# Benchmark Data

A shared corpus for benchmarking Ion implementations, so that results from
different implementations can be compared on identical input.

Nothing in this directory is a conformance test. The conformance tooling in this
repository doesn't read it.

## Layout

| Path           | Contents                                                    |
| -------------- | ----------------------------------------------------------- |
| `manifest.ion` | One struct per dataset: file, size, hashes, provenance      |
| `real-world/`  | Datasets representative of real payloads, in binary Ion 1.0 |
| `synthetic/`   | Constructed datasets, in binary Ion 1.0                     |

Each dataset is stored once, as binary Ion 1.0. Files of 1 KiB or more are
compressed with zstd (`<name>.10n.zst`); smaller files are stored as-is.

## Text

Text versions aren't stored. To get the canonical text for a dataset:

```sh
zstd -d -c <dir>/<name>.10n.zst | ion cat -f text > <name>.ion
```

This uses the compact text format of ion-cli 0.12.0. The manifest records the
size and SHA-256 of the expected output, so a different tool or version that
produces different text is detected.

## Verifying

For each dataset, `manifest.ion` records:

- `bytes` and `sha256` of the decompressed binary,
- `compressed.bytes` and `compressed.sha256` of the stored `.zst` file, if any,
- `text.bytes` and `text.sha256` of the canonical text.

## Datasets

### Real-world

| Name                        | Binary | Values | Description                                         |
| --------------------------- | ------ | ------ | --------------------------------------------------- |
| `json-isl`                  | 354 B  | 7      | An Ion Schema describing JSON                       |
| `isl-2-0`                   | 4.4 kB | 68     | The Ion Schema 2.0 meta-schema                      |
| `comm-filter-sanitized`     | 2.6 kB | 1      | A payload with nested data                          |
| `disc-sanitized`            | 9.8 kB | 1      | A single payload                                    |
| `single-asin-sanitized`     | 39 kB  | 1      | A deeply nested product record                      |
| `disc-median-sanitized`     | 75 kB  | 1      | A message of median size from the "disc" data       |
| `disc-stratified-sanitized` | 1.6 MB | 20     | Batch messages sampled across the size distribution |
| `log-sanitized`             | 6.5 MB | 19,200 | A service log stream                                |

### Synthetic

| Name             | Binary  | Values | Description                                                      |
| ---------------- | ------- | ------ | ---------------------------------------------------------------- |
| `tiny`           | 24 B    | 1      | A very small payload                                             |
| `ints`           | 10.0 kB | 1,830  | Ints spread across 1- to 8-byte magnitudes                       |
| `big-ints`       | 10.1 kB | 540    | Ints of 20 to 60 decimal digits                                  |
| `floats`         | 10.0 kB | 1,330  | Doubles, values exact as 32-bit floats, a few zeros and specials |
| `decimals`       | 10.0 kB | 1,540  | 1 to 34 digits, varied exponents, including zeros                |
| `timestamps`     | 10.0 kB | 1,200  | Every precision; UTC, unknown, and other offsets                 |
| `strings`        | 10.2 kB | 150    | Strings with escapes and multi-byte UTF-8                        |
| `simple-strings` | 10.5 kB | 210    | Printable ASCII strings without escapes                          |
| `symbols`        | 10.0 kB | 3,650  | Symbol values from a 200-symbol vocabulary, skewed               |
| `nulls-bools`    | 10.0 kB | 10,000 | Bools, null, and typed nulls                                     |
| `lobs`           | 10.5 kB | 70     | Blobs and clobs of up to 300 bytes                               |
| `annotations`    | 10.0 kB | 910    | Small values with one to three annotations                       |
| `flat-structs`   | 10.3 kB | 180    | Structs of 6 to 24 int fields from a 40-name vocabulary          |
| `lists`          | 10.1 kB | 160    | Lists of 1 to 40 ints                                            |
| `mixed`          | 10.2 kB | 100    | Structs with a field of each scalar type, a list, and a sexp     |
| `deep-nesting`   | 11.5 kB | 80     | Values nested 20 to 100 levels in lists, sexps, and structs      |
| `large-values`   | 12.5 kB | 10     | Structs holding one large string, blob, int, or decimal          |
| `symbol-tables`  | 10.1 kB | 938    | Short streams concatenated, each with its own symbol table       |

### Provenance

- **Sanitized datasets** (`*-sanitized`) come from real payloads. Every scalar
  was replaced with pseudorandom data of the same type and byte length, keeping
  the binary structure: value lengths, nesting, field and element counts, symbol
  IDs, timestamp precision, and null-ness.
- `disc-stratified-sanitized` is a stratified sample, by message size, from a
  population of more than 10,000 messages.
  `disc-median-sanitized` is the median-size message of that sample.
- `json-isl` and `isl-2-0` come from
  [amazon-ion/ion-schema-schemas](https://github.com/amazon-ion/ion-schema-schemas)
  (Apache-2.0) at commit `0fb72175fa7196c3b85ac97170fc6da822e162bd`: `json-isl`
  is `json/json.isl`; `isl-2-0` concatenates
  `isl/ion_schema_2_0/{constraints,ranges,schema,type,util}.isl` in that order.
  Both were converted from text to binary.
- **Generated synthetic datasets** (all of `synthetic/` except `tiny`) were
  generated once, with every value drawn independently from a pseudorandom
  distribution, so no file is a repeated value or pattern.
  Each was written as Ion text, parsed, and encoded as binary with ion-rust
  1.2.0. They are stored rather than regenerated, so every implementation reads
  identical bytes.
