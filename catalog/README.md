# Catalog data for Ion test cases

This directory includes Ion catalog data: shared symbol tables and modules that
are reused across other Ion documents.

Catalog entities are indexed by a name and version, where the name is a non-empty
string (sequence of Unicode code points) and the version is a positive integer.

Each Ion file in this directory contains one or more valid catalog entities.
Each entity is represented as an Ion value following the canonical form of
either:
  * a shared symbol table: a struct with the first annotation 
    `$ion_shared_symbol_table`
  * a shared module: an S-expression with the first annotation 
    `$ion_shared_module`

Given a _name_ and _version_, implementations locate the relevant entity as 
follows:

  * First, look for a file path `<name>.ion` and seek the entity therein with
    the given version.
  * If no such file exists, seek the entity in the file `catalog.ion`. 


## Constraints

The data in this directory must satisfy these constraints:

  * Every Ion file must consist solely of one or more top-level values denoting 
    shared symbol tables and/or modules.
  * Each value MUST contain valid name and version metadata per the specified 
    canonical form; any other data in the entity MAY be absent or erroneous.   
  * Except for the catch-all file `catalog.ion`, every entity MUST have a name
    that matches the file name.
  * When a file contains multiple entities with the same name:
    * each such entity must have a distinct version, and
    * the entities must be sorted by version, lowest first.
