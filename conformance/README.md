# Ion Conformance Tests

This directory contains conformance tests for Ion, expressed using a small,
declarative domain-specific language.

**Contents**
 * `core/` – test cases for verifying the functionality of a conformance DSL runner
 * `data_model/` – test cases for the encodings of the Ion data model
 * `eexp/` – test cases for parsing/interpretation of e-expressions and their arguments
 * `ion_encoding/` – test cases for encoding directives
   * `module/`
 * `system_macros/` – test cases for each of the system macros
 * `tdl/` – test cases for the template definition language and special forms
 * `demos/` – contains demonstrations of interesting and/or useful strategies

> [!WARNING]
> This test suite and its DSL are **Work In Progress**.


# Test Tiers

The full DSL requires a complete Ion text parser at minimum (to read
the DSL S-expressions), and some aspects require a writer or encoder as well.
This raises the question of how we can lower the barrier to entry so that we can write tests
that can be exercised for an in-progress Ion implementation earlier than that
point.

We intend to approach this problem by carefully partitioning the test files,
and by expressing the earliest phases (the lowest-level test cases) in a subset of Ion that
can be safely converted to JSON using `ion to json` (see [`ion-cli`](https://github.com/amazon-ion/ion-cli)).
For example,

```
["ion_1_1", ["each",
               ["text", "1"],
               ["bytes", 0x61, 0x01],
               ["toplevel", 1],
               ["produces", 1]]]
```

The next logical tiers would introduce basic symbols and sexps into the parser.
Here, the `denotes` expectation becomes valuable:

```
["ion_1_x", ["text", "(1 2.3)"],
            ["denotes", ["Sexp", ["Int", 1], ["Decimal", 23, -1]]]]
```

The inner clauses should align with the formal data model in the denotational
semantics, which would (more or less) reduce the components to integers and
strings.

# The Test DSL

At a high level, each test case in the DSL consists of an input document and an
expectation that should be met when the document is evaluated by an Ion
implementation.  Each expectation is either a series of application values that
the document produces, or an error condition that it signals.

Here’s a simple example:

```
(ion_1_0 (text ''' {a:1, b:2} "two" ''')
         (produces {b:2, a:1} "two"))
```

The `ion_1_0` operator starts a test case relevant to Ion 1.0;
it effectively starts an abstract document with that IVM.
The `text` operator extends that document with some additional top-level content
expressed as string; this text is effectively concatenated to the preceding IVM.
The `produces` clause indicates that the preceding document parses to a series
of application values equivalent to those given.

> [!TIP]
> This aspect of the DSL both assumes the presence and tests the correctness of
> an implementation of Ion data-model equivalence.

The `produces` clause verifies fully-expanded output, so valid symbol IDs are
replaced by their text:

```
(ion_1_0 (text "$1 $2 $3")
         (produces $ion $ion_1_0 $ion_symbol_table))
```

Not all input documents can be parsed successfully; Ion specifies certain cases
that must signal error conditions.
To test that, use the `signals` expectation clause instead of `produces`:

```
(ion_1_0 (text "$99")
         (signals "Out of range symbol ID: 99"))
```

The `signals` form declares that expansion of the document must fail.
The given message is non-normative, in the sense that we’re not trying to force
all implementations into any particular message phrasing.
That said, some kind of pattern matching might be useful, and/or this could be
extended with a more structural check on where the error occurred in the input.


The most interesting test cases involve encoding directives:

```
(ion_1_0 (text '''$ion_symbol_table::{symbols:["a"]}  $10''')
         (produces a))
```

We can test something similar for Ion 1.1 using the `ion_1_1` form:

```
(ion_1_1 (text '''$ion_encoding::((module M (macro_table (macro mac [] 1)))
                                  (macro_table M))
                  (:M:mac) (:M:0) (:mac) (:0))
               '''
         (produces 1 1 1 1))
```

## Binary fragments

In addition to providing input data as text, you can provide Ion binary content:


```
(ion_1_1 (binary   0x50 0x51 0x01 0xEB 0x01)
         (produces    0         1  null.int))
```

Here, the `binary` clause accepts any number of octets, written as either an int
in the range 0-255, or a string of hexadecimal digits.

For example:

```
(ion_1_1 (binary   "50 5101 EB01")
         (produces  0  1    null.int))
```


## Multiple fragments

It was noted above that the `text` clause is appended to the declared IVM to
produce an input document.  This is an example of a _fragment_ clause, so named
because it represents a fragment of a full document.
When an expectation (`produces` or `signals`) is found, the preceding fragments
are combined and then parsed and expanded.

In clauses that accept fragments, more than one can be provided:

```
(ion_1_0 (text "$1")
         (text "$2")
         (text "$3")
         (produces $ion $ion_1_0 $ion_symbol_table))
```

When fragments are combined, appropriate whitespace is implicitly injected
to prevent tokenization from crossing the boundary.  In other words, the above
behaves like `(text "$1 $2 $3")` and not `(text "$1$2$3")`.

One important constraint is that a fragment must represent zero or more complete
top-level values, unless a `signals` clause immediately follows.

The more common use of fragment combination is to allow tests to "branch out"
from a starting point.


It’s common in test cases to want to share a fixture or common test setup.
The DSL allows a common document prefix to be shared across multiple test cases.
You can use `then` clauses to continue the document in different directions,
each with additional fragments and an expectation.

````
(ion_1_1 (text '''$ion_encoding::((module M (macro_table (macro mac [] 1)))
                                  (macro_table M))'''
         (then (text "(:M:mac)")
               (produces 1))
         (then (text "(:M:0)")
               (produces 1))
         (then (text "(:mac)")
               (produces 1))
         (then (text "(:0)")
               (produces 1)))
````

Here, each `then` clause extends the document with a different suffix,
then checks the results.
This more clearly associates the specific inputs forms and their outputs.

A further refinement is to indicate that multiple input forms all produce the
same output, using `each`:

```
(ion_1_1 (text '''$ion_encoding::((module M (macro_table (macro mac [] 1)))
                                  (macro_table M))'''
         (each (text "(:M:mac)")
               (text "(:M:0)")
               (text "(:mac)")
               (text "(:0)")
               (produces 1)))
```

The `each` clause extends the document multiple directions, then verifies the
same expectation for each result.  In this example, there are four final
documents; all have the same `$ion_encoding` directive but each has its own
single E-expression.

This pattern makes it easy to verify multiple representations of the same data,
ensuring that all input forms handle scenarios the same way.

```
(ion_1_1 (each
           (text "1")
           (bytes 0x51 0x01)
           (toplevel 1)         // Abstract syntax representation; see below.
           (produces 1)))
```


### Combining Formats

The previous section implies that in general, a test case can be thought of as a
tree where the interior nodes are fragments, and the leaves are expectations.
Each expectation is tied to a single document formed by combining the fragments
along the path from the root to the expectation.

In theory, we could mix and match text, binary, and AST fragments in a single
document, since ultimately they all express the same thing in different ways.
However, that forces fairly complicated transcoding into the test framework.
To keep things reasonable, we constrain test trees such that `text` and `binary`
fragments cannot coexist on the path to one expectation.
AST fragments, however, can mix with text or binary fragments.
This is the case in most situations, since the `ion_1_*` clauses inherently
abstract over the bytes on an IVM.

Before checking an expectation, the conformance framework constructs a document
by combining the preceding sequence of fragments:
  * If any fragment is `text`, any AST fragments are effectively converted to
text before processing.  Adjacent text fragments MUST be joined with whitespace.
  * If any fragment is `binary`, any AST fragments are effectively encoded to
binary before processing.

We say "effectively" because the implementation is not _required_ to do such
transcoding; that is not the behavior under test.
It may be easier and/or faster to skip that, as long as the observable results
are equivalent: the effect on the encoding context, the data produced, and any
errors signaled.

When all fragments are abstract (that is, there are no `text` or `binary`
fragments on the path to an expectation), it is assumed that the test case is
not intended to verify the behavior of the Ion parser/decoder, but rather the
expansion process that happens after parsing completes.
The implementation may verify the test accordingly, by transcoding to text
and/or binary if necessary, or doing neither if it can handle the abstract
syntax more directly.
For example, the framework could surface a stream of "raw" low-level events
common to both formats.

> [!NOTE]
> It would also be valuable if the DSL can be extended to intentionally focus on
> the encoder by providing AST fragments and expecting certain bytes.
> I can imagine that gets tricky given the variety of encoding options available.
> Perhaps we could have DSL clauses that direct specific encoding choices, so that
> we can expect specific byte sequences.


## Ion versions

The examples above illustrate the `ion_1_0` and `ion_1_1` entry points.
These are derived forms, shorthand for the common extensions to a more primitive
starting point: an empty document.  Here's how that is expressed:

```
(document (produces))
```

This example  simply says that an empty Ion document produces no data.

The `document` clause is the true root of all tests.
It starts a test case with an empty document: no IVM, no bytes of any kind.
The body of the clause acts the same as a `then` clause, so the trivial
example is equivalent to:

```
(document (then (produces)))
```


To make a more meaningful test, we must add some input to the document:

```
(document (text "null.int")
          (denotes (Null int)))
```

Here, the input document is an eight-byte text document containing exactly the
given characters, and the test expects the implementation to produce a null `int`.

The `ion_1_*` clauses are shorthands for extending the empty document with Ion
version markers.
To be more specific, `(ion_1_0 _form_ ...)` is equivalent to:

```
(document
  (then (ivm 1 0) _form_ ...))
```

`(ion_1_1 _form_ ...)` is equivalent to:

```
(document
  (then (ivm 1 1) _form_ ...))
```

Finally, `(ion_1_x _form_ ...)` is equivalent to:

```
(document
  (then (ivm 1 0) _form_ ...)
  (then (ivm 1 1) _form_ ...))
```

This combination declares behavior common to _both_ 1.0 and 1.1.

```
(ion_1_x (text "1::true")
         (signals "Invalid annotation"))
```

When this test suite is used by an implementation that only supports 1.0,
it must ignore any `ion_1_1` clauses, and interpret `ion_1_x` the same as
`ion_1_0`.


## Modeling outputs

The `produces` form is specified to use Ion data-model equivalence when checking
results.  This works nicely when you have that implemented, but it's somewhat
circular and hard to bootstrap, especially when you're still implementing
JSON extensions like annotations, symbols, and S-expressions.

As an alternative, you can use the `denotes` expectation to express output in a
form that expresses the Ion data model in more primitive terms.

```
(ion_1_0 (text "(symval 1.2) a::b::null.bool")
         (denotes (Sexp (Symbol "symval") (Decimal 12 -1))
                  (Annot (Null bool) "a" "b")))
```

This example uses new expression forms denoting `symbol`, `decimal`, and `null`
values, as well as `annot`ations.  This inner expression language covers the
full Ion data model using only sequences, strings, and integers, which happen
to be the same fundamental data types used by Ion's formal denotational semantic
model.


## JSON-compatible test expressions

The above test cases requires an Ion implementation of S-expressions
and symbols before they can even be interpreted by the test runner.
To make it easier to bootstrap a new Ion system, the entire testing DSL can be
written as JSON data by replacing S-expressions with lists (JSON "arrays") and
keyword symbols with strings:

```
["ion_1_0", ["text", "(symval 1.2) a::b::null.bool"],
            ["denotes", ["Sexp", ["Symbol", "symval"], ["Decimal", 12, -1]]
                        ["Annot", ["Null", "bool"], "a", "b"]]]
```

This works because every DSL clause has the shape “sexp starting with a keyword
symbol”, which in this controlled context can be generalized to “sequence
starting with a keyword text value”, thus supporting the JSON-friendly “list
starting with a keyword string” shape.
While cumbersome, it can be used to express the DSL for early development
phases; the test runner can use any JSON parser to read the tests,
up until the point that the Ion parser covers that ground.
Note that these tests can cover both text and binary inputs during this phase.


## Handling unknown symbols

One edge-case in the Ion data model should be addressed explicitly: the handling
of unknown symbols.  Per the spec, symbols are equivalent when they have the
same text.  In the conformance suite, this situation is expressed via
expectations such as these:

```
(ion_1_0 (text '''$ion_symbol_table::{symbols:["$ion"]}''')
         (each (text "$ion")
               (text "$1")
               (text "$10")
               (denotes (Symbol "$ion"))))  // Or, equivalently: (produces $ion)
```

When text is unknown for a SID, equivalence depends on whether the SID maps into
the local symbol table or into a shared table.
In the former case, all unknown symbols are equivalent to `$0`:

```
(ion_1_0 (text '''$ion_symbol_table::{symbols:[null, false]}''')
         (each (text "$0")
               (text "$10")
               (text "$11")
               (denotes (Symbol 0))))
```

Here we use a variant of the `symbol` model using an integer SID rather than a
string.

When an unknown SID resides in a shared symbol table, it is equivalent only to
the same local address in the same-named symbol table:

```
(ion_1_0 (text '''$ion_symbol_table::{imports:[{name:"not found", max_id:2}]}''')
         (text "$10 $11")
         (denotes (Symbol ("not found" 1))
                  (Symbol ("not found" 2))))
```

Here the `symbol` is modeled as a pair of symtab-name and local address.

The above technique suffices when using modeled outputs, but doesn't suffice
for the literal data expected by `produces` forms.
Specifically, there's no way to express the not-found shared symbols in the
latter example.

To handle such cases, we reserve the set of symbols that start with the digraph
`#$` to encode portions of the data model that cannot be directly expressed.
Within a `produces` clause, symbols starting with `#$` are reserved.
At present, the following forms are accepted:

  * `'#$0'` denotes symbol zero.
  * Symbols of the form `'#$name#ddd'`, where _name_ is not empty and _ddd_ is
    one or more digits, denotes an unknown symbol at address _ddd_ of symtab
    _name_.  In other words, it denotes `(Symbol ("name" ddd))`.
  * All other symbols starting with `#$` must signal an erroneous test case.

Per these rules, we can rewrite the above test cases as:

```
(ion_1_0 (text '''$ion_symbol_table::{symbols:[null, false]}''')
         (each (text "$0")
               (text "$10")
               (text "$11")
               (produces '#$0')))

(ion_1_0 (text '''$ion_symbol_table::{imports:[{name:"not found", max_id:2}]}''')
         (text "$10 $11")
         (produces '#$not found#1' '#$not found#2'))
```


## Providing input as data

The `text` and `binary` clauses express input data in terms of the Ion text and
binary encodings, for the most part embedding raw data inside strings.
While this is more-or-less a requirement for binary inputs, it can quickly
become cumbersome for text inputs.

The first issue is escaping of the text input.
Because these are Ion strings, we'll need to escape inner quotes correctly.
This isn't difficult when using triple-quoted long strings as above, but its
also not elegant, and it can be prone to errors when used inside S-expressions.

The second issue is correctness and ease of authoring.
Embedding Ion data inside a string means you won't get any assistance from your
text editor, so common errors like unbalanced parentheses won't get flagged,
increasing the likelihood of syntactic errors in the input data itself:

```
(ion_1_1 (text '''
           $ion_encoding::((module M
                             (macro_table
                               (macro m [] (noSuchMacro)))
                           (macro_table M))
           ''')
         (signals "No such macro: noSuchMacro"))
```

We can address these errors by allowing the input to be expressed directly as data,
without a wrapping string.  The `toplevel` fragment does that:

```
(ion_1_1 (toplevel $ion_encoding::((module M
                                     (macro_table
                                       (macro m [] (noSuchMacro)))
                                   (macro_table M)))
         (signals "No such macro: noSuchMacro"))
```

The test framework will automatically transcode this data into the necessary
format based on the surrounding document fragments, so it can be parsed and
expanded as if were expressed as text.
Of course this assumes the test-runner has correct Ion parsers and encoders,
but those lower-level concerns are covered by other parts of the conformance
suite so that these tests can focus on higher-level behavior involving encoding
directives and the template language.


A third issue to consider clarity and crispness of the test cases that cover
these higher-level scenarios.  In the current example, only the faulty `macro`
clause is relevant to the test case; the surrounding three lines are boilerplate
putting that macro definition into the context of a valid encoding directive.
This is a lot of overhead, introducing friction for the test author, when we
want to make it easy and concise to denote highly-focused test scenarios.
Let's whittle that away a bit.

Because many test cases will focus on the behavior of 1.1 encoding directives,
there are special forms to shorten the expression of such input documents.
The `encoding` fragment is such a shorthand:

```
(ion_1_1 (encoding (module M
                     (macro_table
                       (macro m [] (noSuchMacro)))
                   (macro_table M))
         (signals "No such macro: noSuchMacro"))
```

An `encoding` fragment accepts the body of an encoding directive, so the DSL
syntax `(encoding expr …)` is shorthand for
`(toplevel $ion_encoding::(expr …))`.


Another common test pattern, especially for testing the template language,
is to define and install a number of macros.
The syntax `(mactab expr …)` is shorthand for
`(encoding (module M (macro_table expr …)) (macro_table M))`.
For example:

```
(ion_1_1 (mactab (macro m [] (noSuchMacro)))
         (signals "No such macro: noSuchMacro"))
```

Compared to the original form using `text`, this is significantly streamlined
and abstracted to focus on just the input fragments relevant to the specific
test scenario.
Expressing test cases for the template language is now direct and crisp:

```
(ion_1_1 (mactab (macro m      [] "m")
                 (macro m_wrap [] (m)))
         (text "(:m_wrap)")
         (produces "m"))
```

This brevity allows test cases to focus on the essentials:
```
(ion_1_1 (mactab (macro _ (v) x))
         (signals "Unbound variable: x"))
```


### Abstract syntax forms

To make `toplevel` and its derivatives complete with respect to Ion syntax, we
need a way to encode symbol references and E-expressions such that they are not
expanded by the Ion parser reading the DSL script.
We also need a way to denote IVMs distinct from the symbols with the same text.

To enable this, the input-as-data forms use a strategy similar to how `provides`
encodes unknown symbols: it treats input symbols starting with the digraph `#$`
as special.
In effect, we want to be able to express fragments of the abstract syntax trees
produced by a parser, so the DSL grammar uses the _ast_ nonterminal where these
conventions apply.

> [!IMPORTANT]
> As before, this comes at the reasonable cost that one can’t use such symbols
> as test data in this category of fragments.  Those values can still be covered
> using the more primitive `text` and `denotes` forms.

To encode an IVM, write `'#$ion_1_0'` or `'#$ion_1_1'` as a direct element of
`toplevel`.  Note that the unmangled forms `$ion_1_0` or `'$ion_1_0'` denote
top-level symbols, not IVMs.

To encode a symbol reference that might normally look like `$123` you instead
write `'#$123'`:

```
(ion_1_x (toplevel '#$ion_1_0'  $ion_1_0  '#$1'  '#$2'     '#$3')
         (produces  /* IVM */   $ion_1_0  $ion   $ion_1_0  $ion_symbol_table))
```

To denote an E-expression, you write an S-expression starting with a symbol of
the form `#$:_macroref_`:

```
(ion_1_1 (toplevel [1, ('#$:values' a b), 2])
         (produces [1, a, b, 2]))
```

```
(ion_1_1 (mactab (macro mac [] 1))
         (each (toplevel ('#$:M:mac'))  // = (text "(:M:mac)")
               (toplevel ('#$:M:0'))    // = (text "(:M:0)")
               (toplevel ('#$:mac'))    // = (text "(:mac)")
               (toplevel ('#$:0'))      // = (text "(:0)")
               (produces 1)))
```

Note that using this facility doesn't imply crisper test expressions.
its main purpose is to make the various fragment-producing clauses equally
expressive.  Additionally, it can allow exercising the macro expander
independent of the E-expression parser, since these clauses do not require it.

We close with a relatively complex tree of test cases:

```
(ion_1_1 (mactab (macro m () 0))
         (then (toplevel ('#$:m'))              // = (text "(:m)")
               (produces 0))
         (each (toplevel ('#$:m' 1))            // = (text "(:m 1)")
               (toplevel ('#$:m' 1 2))          // = (text "(:m 1 2)")
               (signals "Too many arguments")))
```

Here’s where the DSL starts showing its expressiveness.
Compare that to the expanded cases without nested `then`/`each`:

```
(ion_1_1 (toplevel $ion_encoding::((module M (macro_table (macro m () 0)))
                                   (macro_table M))
                   ('#$:m'))
         (produces 0))
(ion_1_1 (toplevel $ion_encoding::((module M (macro_table (macro m () 0)))
                                   (macro_table M))
                    ('#$:m' 1))
         (signals "Too many arguments"))
(ion_1_1 (toplevel $ion_encoding::((module M (macro_table (macro m () 0)))
                                   (macro_table M))
                   ('#$:m' 1 2))
         (signals "Too many arguments"))
```



# Grammar

The conformance DSL is expressed as Ion (or JSON) data.
The following BNF-style grammar is intended to informally constrain the shape of
that data.  These conventions are used:

* Alternatives of the form  `"(" ... ")"` denote S-expressions; lists are also
acceptable, of course with appropriate commas.
* Other quoted terminals like `"ion_1_0"` denote symbols or strings.
* The terminals `null`, `bool`, `int`, and `string` denote Ion/JSON data of that
type.
  * JSON numbers with decimal points or exponents are erroneous.


These rules describe the overall shape of test cases:

```ebnf
test ::=  "("  "document" name-string?  fragment*  continuation  ")"
       |  "("  "ion_1_0"  name-string?  fragment*  continuation  ")"
       |  "("  "ion_1_1"  name-string?  fragment*  continuation  ")"
       |  "("  "ion_1_x"  name-string?  fragment*  continuation  ")"

name-string ::= string

fragment ::=  "("  "text"      text_input*  ")"
           |  "("  "binary"    bytes*   ")"
           |  "("  "ivm"       int int  ")"
           |  "("  "toplevel"  ast*     ")"
           |  "("  "encoding"  ast*     ")"
           |  "("  "mactab"    ast*     ")"

continuation ::=  expectation  |  extension+

expectation  ::=  "("  "produces"  datum*        ")"       // "datum" is any valid ion data with no special interpretation
               |  "("  "denotes"   model-value*  ")"
               |  "("  "signals"   message       ")"
               |  "("  "and"       expectation+  ")"
               |  "("  "not"       expectation   ")"

extension    ::=  "("  "then"  name-string?  fragment*  continuation  ")"
               |  "("  "each"  each-branch*  continuation  ")"

each-branch  ::=  name-string?  fragment

text_input   ::=  int      // In the range 0..255
               |  string

bytes        ::=  int      // In the range 0..255
               |  string   // Containing hexadecimal digit pairs with optional whitespace
```

TODO: Explain `ast`

The DSL’s expression grammar hierarchically composes a set of abstract Ion
documents from one or more *fragment*s of content, then verifies that the
expansion of those documents meets a certain _expectation_, either specific values
in the Ion data model, or an error condition.

At entry to every clause, there exists a well-defined (non-empty) set of
(potentially empty) abstract documents.
The outermost clauses `document`, `ion_1_0`, `ion_1_1`, and `ion_1_x` provide
the initial set of documents to be extended by nested clauses.
Each *fragment* appends some top-level content to each document in progress.
Note that at each step, all documents are well-formed.

Fragments are always followed by a _continuation_, which either extends the
current document(s) with one or more _extension_s, or verifies that they meet an
expectation, ending that branch of the test tree.

When an extension has no fragments, the continuation is applied to the current
document set.  In other words, the extension acts as if it had a single empty
`toplevel` fragment, which does not change the current documents.

These rules describe Ion data-model results for use in the `denotes` expectation:

```ebnf
model-value     ::=  model-content  |  annotated

model-content   ::=  bool
                  |  int
                  |  string
                  |  "("  "Null"      model-type?      ")"
                  |  "("  "Bool"      bool             ")"
                  |  "("  "Int"       int              ")"
                  |  "("  "Float"     model-float      ")"
                  |  "("  "Decimal"   model-decimal    ")"
                  |  "("  "Timestamp" model-timestamp  ")"
                  |  "("  "String"    codepoint*       ")"
                  |  "("  "Symbol"    model-symtok     ")"
                  |  "("  "List"      model-value*     ")"
                  |  "("  "Sexp"      model-value*     ")"
                  |  "("  "Struct"    model-field*     ")"
                  |  "("  "Blob"      bytes*           ")"
                  |  "("  "Clob"      bytes*           ")"

model-type      ::=  "bool"
                  |  "int"
                  |  "float"
                  |  "decimal"
                  |  "timestamp"
                  |  "string"
                  |  "symbol"
                  |  "list"
                  |  "sexp"
                  |  "struct"
                  |  "blob"
                  |  "clob"

codepoint       ::=  int                                   // in the range 0..0x10FFFF

model-symtok    ::=  string
                  |  int
                  |  "("  "text"  codepoint*  ")"
                  |  "("  "absent"  string  int  ")"       // symtab name + offset

model-field     ::=  "("  model-symtok  model-value  ")"

// All "denotes" values must be given with 64-bit precision, regardless of the value being tested because the Ion data
// model uses 64 bit floats. See https://amazon-ion.github.io/ion-docs/docs/float.html
model-float     ::= string

model-decimal   ::= int int                                // coefficient + exponent
                  | "negative_0" int                       // negative zero coefficient + exponent

// All timestamp subfields are interpreted as UTC time.
// I.e. the following timestamps are not equivalent, but they represent the same point in time.
// (timestamp second 1 2 3 (offset -1440) 4 5 6)
// (timestamp second 1 2 3 (offset +1440) 4 5 6)

model-timestamp ::= year     int
                  | month    int int
                  | day      int int int
                  | minute   int int int offset int int
                  | second   int int int offset int int int
                  | fraction int int int offset int int int model-decimal

offset          ::= "(" "offset" offset-minutes ")"

offset-minutes  ::= int                                    // in the range -1440..1440
                  | null                                   // indicates unknown offset

annotated       ::=  "("  "annot"  model-content  model-symtok*  ")"
```

The `model-content` forms `(string ...)` and `(symbol (text ...))` express text
in terms of Unicode code points, which is needed to test parsing of escape
sequences.

Floating point number libraries can be inconsistent regarding the serialization of non-numeric float values.
For the purpose of this conformance DSL, use `nan`, `+inf`, and `-inf` for the non-numeric values.


# WIP TODOs

* The denotational test cases are wired with a small catalog of shared symtabs
  (and soon, shared modules) so that related functionality can be tested.
  In the stand-alone suite, we should have a similar mechanism.
* I’ve got a bunch of test cases (not written in this DSL) that check the bounds
  of the current symbol table or macro table; that would be nice to have an
  expectation for.
* Define an expectation for point-in-time equality of timestamps.
