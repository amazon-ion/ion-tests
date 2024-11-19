// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

$ion_schema_2_0

type::{
  name: test_file,
  type: document,
  element: test_case_root,
}

// Shared

type::{
  name: bytes,
  one_of: [
    { type: int, valid_values: range::[0x00, 0xFF]},
    { type: string, regex: "^([0-9A-F]{2}|\\s)+$"},
  ]
}

type::{
  name: text_input,
  one_of: [
    string,
    { type: int, valid_values: range::[0x00, 0xFF]},
  ]
}

type::{
  name: codepoint,
  type: int,
  valid_values: range::[0, 0x10FFFF]
}

// Document clauses

type::{
  name: test_case_root,
  // We need to have types defined for both cases because `ordered_elements` does not support alternation.
  // It's possible to use `one_of` to choose between two types, but there's no way to say that the list should contain
  // either `{type: extension_clause, occurs: range::[1, max]}` or `expectation_clause` (implicitly `occurs: required`).
  one_of:[
    test_case_root_with_extension,
    test_case_root_with_expectation,
  ]
}

type::{
  name: test_case_root_keyword,
  valid_values: [
    document, ion_1_0, ion_1_1, ion_1_x,
    "document", "ion_1_0", "ion_1_1", "ion_1_x",
  ]
}

type::{
  name: test_case_root_with_extension,
  ordered_elements: [
    test_case_root_keyword,
    { type: $string, occurs: optional },
    { type: fragment, occurs: range::[0, max] },
    { type: extension_clause, occurs: range::[1, max]},
  ]
}

type::{
  name: test_case_root_with_expectation,
  ordered_elements: [
    test_case_root_keyword,
    { type: $string, occurs: optional },
    { type: fragment, occurs: range::[0, max] },
    expectation_clause,
  ]
}

// Extension clauses

type::{
  name: extension_clause,
  one_of: [
    each_clause_with_extension,
    each_clause_with_expectation,
    then_clause_with_extension,
    then_clause_with_expectation,
  ],
}

type::{
  name: then_keyword,
  valid_values: [ then, "then" ]
}

type::{
  name: then_clause_with_extension,
  ordered_elements: [
    then_keyword,
    { type: $string, occurs: optional },
    { type: fragment, occurs: range::[0, max] },
    { type: extension_clause, occurs: range::[1, max]},
  ]
}

type::{
  name: then_clause_with_expectation,
  ordered_elements: [
    then_keyword,
    { type: $string, occurs: optional },
    { type: fragment, occurs: range::[0, max] },
    expectation_clause,
  ]
}

type::{
  name: each_keyword,
  valid_values: [ each, "each" ]
}

type::{
  name: each_clause_with_extension,
  ordered_elements: [
    each_keyword,
    // This is not quite accurate to the grammar since this would allow repeated strings.
    // ISL does not have any support for repeated subsequences in ordered_elements, so this is the best we can do.
    { one_of: [ $text, fragment ], occurs: range::[0, max] },
    { type: extension_clause, occurs: range::[1, max] },
  ],
}

type::{
  name: each_clause_with_expectation,
  ordered_elements: [
    each_keyword,
    // This is not quite accurate to the grammar since this would allow repeated strings.
    // ISL does not have any support for repeated subsequences in ordered_elements, so this is the best we can do.
    { one_of: [ $text, fragment ], occurs: range::[0, max] },
    expectation_clause,
  ],
}

// Fragments

type::{
  name: fragment,
  one_of:[
    ivm_clause,
    toplevel_clause,
    binary_clause,
    text_clause,
    mactab_clause,
    encoding_clause,
  ]
}

type::{
  name: ivm_clause,
  ordered_elements: [{ valid_values: [ivm, "ivm"] }, int, int ]
}

type::{
  name: toplevel_clause,
  ordered_elements: [ { valid_values: [toplevel, "toplevel"] }, { occurs: range::[0, max] }, ]
}

type::{
  name: mactab_clause,
  ordered_elements: [ { valid_values: [mactab, "mactab"] }, { occurs: range::[0, max] }, ]
}

type::{
  name: encoding_clause,
  ordered_elements: [ { valid_values: [encoding, "encoding"] }, { occurs: range::[0, max] }, ]
}

type::{
  name: text_clause,
  ordered_elements: [ { valid_values: [text, "text"] }, { type: text_input, occurs: range::[0, max] }, ]
}

type::{
  name: binary_clause,
  ordered_elements: [ { valid_values: [binary, "binary"] }, { type: bytes, occurs: range::[0, max] }, ]
}

// Expectations

type::{
  name: expectation_clause,
  one_of: [denotes_clause, produces_clause, signals_clause],
}

type::{
  name: produces_clause,
  ordered_elements: [
    { valid_values: [produces, "produces"] },
    { type: $any, occurs: range::[0, max] }
  ]
}

type::{
  name: signals_clause,
  ordered_elements: [
    { valid_values: [signals, "signals"] },
    string
  ]
}

type::{
  name: denotes_clause,
  ordered_elements: [
    { valid_values: [denotes, "denotes"] },
    { type: model_value, occurs: range::[0, max] }
  ]
}

// All the supporting types for `denotes`

type::{
  name: model_value,
  one_of: [model_annot, model_content]
}

type::{
  name: model_type,
  valid_values: [
    bool, int, float, decimal, timestamp, symbol, string, blob, clob, list, sexp, struct,
    "bool", "int", "float", "decimal", "timestamp", "symbol", "string", "blob", "clob", "list", "sexp", "struct",
  ]
}

type::{
  name: model_annot,
  ordered_elements: [
    { valid_values: [Annot, "Annot"] },
    model_content,
    { type: model_symtok, occurs: range::[0, max] }
  ]
}

type::{
  name: model_content,
  one_of: [
    bool,
    int,
    string,
    {ordered_elements:[{valid_values:[Null,"Null"]},     { type: model_type, occurs: optional }         ]},
    {ordered_elements:[{valid_values:[Bool,"Bool"]},     bool                                           ]},
    {ordered_elements:[{valid_values:[Int,"Int"]},       int                                            ]},
    {ordered_elements:[{valid_values:[Float,"Float"]},   string                                         ]},
    model_decimal,
    model_timestamp,
    {ordered_elements:[{valid_values:[Symbol,"Symbol"]}, model_symtok                                   ]},
    {ordered_elements:[{valid_values:[String,"String"]}, { type: codepoint, occurs: range::[0, max] }   ]},
    {ordered_elements:[{valid_values:[Blob,"Blob"]},     { type: bytes, occurs: range::[0, max] }       ]},
    {ordered_elements:[{valid_values:[Clob,"Clob"]},     { type: bytes, occurs: range::[0, max] }       ]},
    {ordered_elements:[{valid_values:[List,"List"]},     { type: model_value, occurs: range::[0, max] } ]},
    {ordered_elements:[{valid_values:[Sexp,"Sexp"]},     { type: model_value, occurs: range::[0, max] } ]},
    {ordered_elements:[{valid_values:[Struct,"Struct"]}, { type: model_field, occurs: range::[0, max] } ]},
  ]
}

type::{
  name: model_symtok,
  one_of:[
    string,
    int,
    { ordered_elements:[ {valid_values:[text,"text"]}, { type: codepoint, occurs: range::[0, max] } ] },
    { ordered_elements:[ {valid_values:[absent,"absent"]}, string, int ] }
  ]
}

type::{
  name: model_field,
  ordered_elements:[ model_symtok, model_value ]
}

type::{
  name: model_decimal,
  ordered_elements: [
    {valid_values:[Decimal,"Decimal"]},
    model_decimal_coefficient,
    int,
  ]
}

type::{
  name: model_decimal_coefficient,
  one_of:[ int, {valid_values:[negative_0,"negative_0"]} ]
}

type::{
  name: timestamp_keyword,
  valid_values: [Timestamp,"Timestamp"],
}

type::{
  name: model_timestamp,
  one_of: [
    {ordered_elements:[ timestamp_keyword, {valid_values:[year,"year"]},       int, ]},
    {ordered_elements:[ timestamp_keyword, {valid_values:[month,"month"]},     int, int, ]},
    {ordered_elements:[ timestamp_keyword, {valid_values:[day,"day"]},         int, int, int, ]},
    {ordered_elements:[ timestamp_keyword, {valid_values:[minute,"minute"]},   int, int, int, offset, int, int, ]},
    {ordered_elements:[ timestamp_keyword, {valid_values:[second,"second"]},   int, int, int, offset, int, int, int, ]},
    {ordered_elements:[ timestamp_keyword, {valid_values:[second,"fraction"]}, int, int, int, offset, int, int, int, model_decimal_coefficient, int, ]},
  ]
}

type::{
  name: offset,
  ordered_elements:[
    { valid_values: [offset,"offset"] },
    {
      one_of: [
        $null,
        { type: int, valid_values: range::[-1440, 1440] }
      ]
    }
  ]
}
