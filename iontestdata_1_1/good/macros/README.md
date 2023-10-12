The purpose of this directory is to ensure that Ion Reader implementations can
parse Ion 1.1 macro invocations in a variety of locations within an Ion stream.

The `equivs` and `non-equivs` macro tests will not even load until these tests
are generally passing.

The `(:void)` macro is assumed to be the simplest macro, so it is used for all
tests cases that are testing a specific location for a macro to be invoked.
All other macros receive only a single test case with a top-level invocation.
The only exception is `void_invoked_in_values_macros.ion`, which is used for
testing the `(:void)` macro inside another macro invocation.

More comprehensive macro tests appear in the `equivs/macros/` directory.
