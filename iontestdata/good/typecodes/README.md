# Type Codes

The files in this folder are used to test all of the type descriptors for Ion 1.0.  
Each file contains a valid Ion [Value Stream](http://amzn.github.io/ion-docs/docs/binary.html#value-streams).  
All representations are made up of invalid type descriptors when possible.

## T0 - null / nop padding

Specification: http://amzn.github.io/ion-docs/docs/binary.html#0-null  

```
E0 01 00 EA 00 01 FF 02 FF FF 03 FF FF FF 04 FF 
FF FF FF 05 FF FF FF FF FF 06 FF FF FF FF FF FF 
07 FF FF FF FF FF FF FF 08 FF FF FF FF FF FF FF 
FF 09 FF FF FF FF FF FF FF FF FF 0A FF FF FF FF 
FF FF FF FF FF FF 0B FF FF FF FF FF FF FF FF FF 
FF FF 0C FF FF FF FF FF FF FF FF FF FF FF FF 0D 
FF FF FF FF FF FF FF FF FF FF FF FF FF 0E 8D FF 
FF FF FF FF FF FF FF FF FF FF FF FF 0F 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)  

> `00`  
> 1 byte NOP padding  

> `01 FF`  
> 2 byte NOP padding  

> `02 FF FF`  
> 3 byte NOP padding  

> `03 FF FF FF`  
> 4 byte NOP padding

> `04 FF FF FF FF`  
> 5 byte NOP padding

> `05 FF FF FF FF FF`  
> 6 byte NOP padding

> `06 FF FF FF FF FF FF`  
> 7 byte NOP padding

> `07 FF FF FF FF FF FF FF`  
> 8 byte NOP padding

> `08 FF FF FF FF FF FF FF FF`  
> 9 byte NOP padding

> `09 FF FF FF FF FF FF FF FF FF`  
> 10 byte NOP padding

> `0A FF FF FF FF FF FF FF FF FF FF`  
> 11 byte NOP padding

> `0B FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte NOP padding

> `0C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte NOP padding

> `0D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 14 byte NOP padding

> `0E 8D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8D = 13, total of 15) byte NOP padding

> `0F`  
> _null_ or _null.null_

### Invalid null / nop padding type descriptors

> _none_

## T1 - bool

Specification: http://amzn.github.io/ion-docs/docs/binary.html#1-bool  

```
E0 01 00 EA 10 11 1F 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `10`  
> _false_

> `11`  
> _true_

> `1F`  
> _null.bool_

### Invalid bool type descriptors

> `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `1A`, `1B`, `1C`, `1D`

## T2 - int (positive)

Specification: http://amzn.github.io/ion-docs/docs/binary.html#2-and-3-int  

```
E0 01 00 EA 20 21 FF 22 FF FF 23 FF FF FF 24 FF 
FF FF FF 25 FF FF FF FF FF 26 FF FF FF FF FF FF 
27 FF FF FF FF FF FF FF 28 FF FF FF FF FF FF FF 
FF 29 FF FF FF FF FF FF FF FF FF 2A FF FF FF FF 
FF FF FF FF FF FF 2B FF FF FF FF FF FF FF FF FF 
FF FF 2C FF FF FF FF FF FF FF FF FF FF FF FF 2D 
FF FF FF FF FF FF FF FF FF FF FF FF FF 2E 8E FF 
FF FF FF FF FF FF FF FF FF FF FF FF FF 2F 
```


> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `20`  
> _0_

> `21 FF`  
> 1 byte positive int

> `22 FF FF`  
> 2 byte positive int

> `23 FF FF FF`  
> 3 byte positive int

> `24 FF FF FF FF`  
> 4 byte positive int

> `25 FF FF FF FF FF`  
> 5 byte positive int

> `26 FF FF FF FF FF FF`  
> 6 byte positive int

> `27 FF FF FF FF FF FF FF`  
> 7 byte positive int

> `28 FF FF FF FF FF FF FF FF`  
> 8 byte positive int

> `29 FF FF FF FF FF FF FF FF FF`  
> 9 byte positive int

> `2A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte positive int

> `2B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte positive int

> `2C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte positive int

> `2D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte positive int

> `2E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte positive int

> `2F`  
> _null.int_

### Invalid int (positive) type descriptors

> _none_


## T3 - int (negative)

Specification: http://amzn.github.io/ion-docs/docs/binary.html#2-and-3-int  

```
E0 01 00 EA 31 FF 32 FF FF 33 FF FF FF 34 FF FF 
FF FF 35 FF FF FF FF FF 36 FF FF FF FF FF FF 37 
FF FF FF FF FF FF FF 38 FF FF FF FF FF FF FF FF 
39 FF FF FF FF FF FF FF FF FF 3A FF FF FF FF FF 
FF FF FF FF FF 3B FF FF FF FF FF FF FF FF FF FF 
FF 3C FF FF FF FF FF FF FF FF FF FF FF FF 3D FF 
FF FF FF FF FF FF FF FF FF FF FF FF 3E 8E FF FF 
FF FF FF FF FF FF FF FF FF FF FF FF 3F 
```


> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `31 FF`  
> 1 byte negative int

> `32 FF FF`  
> 2 byte negative int

> `33 FF FF FF`  
> 3 byte negative int

> `34 FF FF FF FF`  
> 4 byte negative int

> `35 FF FF FF FF FF`  
> 5 byte negative int

> `36 FF FF FF FF FF FF`  
> 6 byte negative int

> `37 FF FF FF FF FF FF FF`  
> 7 byte negative int

> `38 FF FF FF FF FF FF FF FF`  
> 8 byte negative int

> `39 FF FF FF FF FF FF FF FF FF`  
> 9 byte negative int

> `3A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte negative int

> `3B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte negative int

> `3C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte negative int

> `3D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte negative int

> `3E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte negative int

> `3F`  
> _null.int_

### Invalid int (negative) type descriptors

> `30`  

## T4 - float

Specification: http://amzn.github.io/ion-docs/docs/binary.html#4-float  

```
E0 01 00 EA 40 44 00 00 00 00 48 00 00 00 00 00 
00 00 00 4F  
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `40`  
> _0e0_

> `44 00 00 00 00`  
> 32 bit (4 octet) float

> `48 00 00 00 00 00 00 00 00`  
> 64 bit (8 octet) float

> `4F`  
> _null.float_

### Invalid float type descriptors

> `41`, `42`, `43`, `45`, `46`, `47`, `49`, `4A`, `4B`, `4C`, `4D`, `4E`

## T5 - decimal

Specification: http://amzn.github.io/ion-docs/docs/binary.html#5-decimal  

```
E0 01 00 EA 50 51 FF 52 FF FF 53 FF FF FF 54 FF 
FF FF FF 55 FF FF FF FF FF 56 FF FF FF FF FF FF 
57 FF FF FF FF FF FF FF 58 FF FF FF FF FF FF FF 
FF 59 FF FF FF FF FF FF FF FF FF 5A FF FF FF FF 
FF FF FF FF FF FF 5B FF FF FF FF FF FF FF FF FF 
FF FF 5C FF FF FF FF FF FF FF FF FF FF FF FF 5D 
FF FF FF FF FF FF FF FF FF FF FF FF FF 5E 8E FF 
FF FF FF FF FF FF FF FF FF FF FF FF FF 5F 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `50`  
> _0._ or _0d0_

> `51 FF`  
> 1 byte decimal

> `52 FF FF`  
> 2 byte decimal

> `53 FF FF FF`  
> 3 byte decimal

> `54 FF FF FF FF`  
> 4 byte decimal

> `55 FF FF FF FF FF`  
> 5 byte decimal

> `56 FF FF FF FF FF FF`  
> 6 byte decimal

> `57 FF FF FF FF FF FF FF`  
> 7 byte decimal

> `58 FF FF FF FF FF FF FF FF`  
> 8 byte decimal

> `59 FF FF FF FF FF FF FF FF FF`  
> 9 byte decimal

> `5A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte decimal

> `5B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte decimal

> `5C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte decimal

> `5D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte decimal

> `5E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte decimal

> `5F`  
> _null.decimal_

### Invalid decimal type descriptors

> _none_

## T6 - timestamp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#6-timestamp  

```
E0 01 00 EA 62 E1 E1 63 E1 E1 E1 64 8E 8E 8E 8E 
65 00 8E 8E 8E 8E 66 8E 8E 8E 8E 8E 8E 67 8E 8E 
8E 8E 8E 8E 8E 68 8E 8E 8E 8E 8E 8E 8E 8E 69 8E 
8E 8E 8E 8E 8E 8E 8E 8E 6A 8E 8E 8E 8E 8E 8E 8E 
8E 8E 8E 6B 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 6C 
8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 6D 8E 8E 8E 
8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 6E 8F 8E 8E 8E 8E 
8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 6F 
 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `62 E1 E1`  
> 2 byte timestamp with at most VarInt offset and VarUInt year

> `63 E1 E1 E1`  
> 3 byte timestamp with at most VarInt offset, VarUInt year, and VarUInt month

> `64 8E 8E 8E 8E`  
> 4 byte timestamp with at most VarInt offset, VarUInt year, VarUInt month, and VarUInt day

> `65 00 8E 8E 8E 8E`  
> 5 byte timestamp with at most VarInt offset, VarUInt year, VarUInt month, and VarUInt day

> `66 8E 8E 8E 8E 8E 8E`  
> 6 byte timestamp with at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, and VarUInt minute

> `67 8E 8E 8E 8E 8E 8E 8E`  
> 7 byte timestamp with at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, VarUInt minute, and VarUInt second

> `68 8E 8E 8E 8E 8E 8E 8E 8E`  
> 8 byte timestamp with at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, VarUInt minute, VarUInt second, and VarInt fraction_exponent

> `69 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> 9 byte timestamp with all components possibly present

> `6A 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> 10 byte timestamp with all components possibly present

> `6B 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> 11 byte timestamp with all components possibly present

> `6C 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> 12 byte timestamp with all components possibly present

> `6D 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> 13 byte timestamp with all components possibly present

> `6E 8F 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E 8E`  
> VarUInt (8F = 15) byte timestamp with all components possibly present

> `6F`  
> _null.timestamp_

### Invalid timestamp type descriptors

> `60`, `61`  

## T7 - symbol

Specification: http://amzn.github.io/ion-docs/docs/binary.html#7-symbol  

```
E0 01 00 EA 70 71 00 72 00 00 73 00 00 00 74 00 
00 00 00 75 00 00 00 00 00 76 00 00 00 00 00 00 
77 00 00 00 00 00 00 00 78 00 00 00 00 00 00 00 
00 79 00 00 00 00 00 00 00 00 00 7A 00 00 00 00 
00 00 00 00 00 00 7B 00 00 00 00 00 00 00 00 00 
00 00 7C 00 00 00 00 00 00 00 00 00 00 00 00 7D 
00 00 00 00 00 00 00 00 00 00 00 00 00 7E 8E 00 
00 00 00 00 00 00 00 00 00 00 00 00 00 7F 

```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `70`  
> symbol ID zero or _$0_

> `71 00`  
> 1 byte symbol ID

> `72 00 00`  
> 2 byte symbol ID

> `73 00 00 00`  
> 3 byte symbol ID

> `74 00 00 00 00`  
> 4 byte symbol ID

> `75 00 00 00 00 00`  
> 5 byte symbol ID

> `76 00 00 00 00 00 00`  
> 6 byte symbol ID

> `77 00 00 00 00 00 00 00`  
> 7 byte symbol ID

> `78 00 00 00 00 00 00 00 00`  
> 8 byte symbol ID

> `79 00 00 00 00 00 00 00 00 00`  
> 9 byte symbol ID

> `7A 00 00 00 00 00 00 00 00 00 00`  
> 10 byte symbol ID

> `7B 00 00 00 00 00 00 00 00 00 00 00`  
> 11 byte symbol ID

> `7C 00 00 00 00 00 00 00 00 00 00 00 00`  
> 12 byte symbol ID

> `7D 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> 13 byte symbol ID

> `7E 8E 00 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> VarUInt (8E = 14) byte symbol ID

> `7F`  
> _null.symbol_

### Invalid symbol type descriptors

> _none_

## T8 - string

Specification: http://amzn.github.io/ion-docs/docs/binary.html#8-string  

```
E0 01 00 EA 80 81 30 82 30 30 83 30 30 30 84 30 
30 30 30 85 30 30 30 30 30 86 30 30 30 30 30 30 
87 30 30 30 30 30 30 30 88 30 30 30 30 30 30 30 
30 89 30 30 30 30 30 30 30 30 30 8A 30 30 30 30 
30 30 30 30 30 30 8B 30 30 30 30 30 30 30 30 30 
30 30 8C 30 30 30 30 30 30 30 30 30 30 30 30 8D 
30 30 30 30 30 30 30 30 30 30 30 30 30 8E 8E 30 
30 30 30 30 30 30 30 30 30 30 30 30 30 8F 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `80`  
> _""_ (empty string)

> `81 30`  
> 1 byte string

> `82 30 30`  
> 2 byte string

> `83 30 30 30`  
> 3 byte string

> `84 30 30 30 30`  
> 4 byte string

> `85 30 30 30 30 30`  
> 5 byte string

> `86 30 30 30 30 30 30`  
> 6 byte string

> `87 30 30 30 30 30 30 30`  
> 7 byte string

> `88 30 30 30 30 30 30 30 30`  
> 8 byte string

> `89 30 30 30 30 30 30 30 30 30`  
> 9 byte string

> `8A 30 30 30 30 30 30 30 30 30 30`  
> 10 byte string

> `8B 30 30 30 30 30 30 30 30 30 30 30`  
> 11 byte string

> `8C 30 30 30 30 30 30 30 30 30 30 30 30`  
> 12 byte string

> `8D 30 30 30 30 30 30 30 30 30 30 30 30 30`  
> 13 byte string

> `8E 8E 30 30 30 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte string

> `8F`  
> _null.string_

### Invalid string type descriptors

> _none_

## T9 - clob

Specification: http://amzn.github.io/ion-docs/docs/binary.html#9-clob  

```
E0 01 00 EA 90 91 FF 92 FF FF 93 FF FF FF 94 FF 
FF FF FF 95 FF FF FF FF FF 96 FF FF FF FF FF FF 
97 FF FF FF FF FF FF FF 98 FF FF FF FF FF FF FF 
FF 99 FF FF FF FF FF FF FF FF FF 9A FF FF FF FF 
FF FF FF FF FF FF 9B FF FF FF FF FF FF FF FF FF 
FF FF 9C FF FF FF FF FF FF FF FF FF FF FF FF 9D 
FF FF FF FF FF FF FF FF FF FF FF FF FF 9E 8E FF 
FF FF FF FF FF FF FF FF FF FF FF FF FF 9F 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `90`  
> _{{ "" }}_ (empty clob)

> `91 FF`  
> 1 byte clob

> `92 FF FF`  
> 2 byte clob

> `93 FF FF FF`  
> 3 byte clob

> `94 FF FF FF FF`  
> 4 byte clob

> `95 FF FF FF FF FF`  
> 5 byte clob

> `96 FF FF FF FF FF FF`  
> 6 byte clob

> `97 FF FF FF FF FF FF FF`  
> 7 byte clob

> `98 FF FF FF FF FF FF FF FF`  
> 8 byte clob

> `99 FF FF FF FF FF FF FF FF FF`  
> 9 byte clob

> `9A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte clob

> `9B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte clob

> `9C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte clob

> `9D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte clob

> `9E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte clob

> `9F`  
> _null.clob_

### Invalid clob type descriptors

> _none_

## T10 - blob

Specification: http://amzn.github.io/ion-docs/docs/binary.html#10-blob  

```
E0 01 00 EA A0 A1 FF A2 FF FF A3 FF FF FF A4 FF 
FF FF FF A5 FF FF FF FF FF A6 FF FF FF FF FF FF 
A7 FF FF FF FF FF FF FF A8 FF FF FF FF FF FF FF 
FF A9 FF FF FF FF FF FF FF FF FF AA FF FF FF FF 
FF FF FF FF FF FF AB FF FF FF FF FF FF FF FF FF 
FF FF AC FF FF FF FF FF FF FF FF FF FF FF FF AD 
FF FF FF FF FF FF FF FF FF FF FF FF FF AE 8E FF 
FF FF FF FF FF FF FF FF FF FF FF FF FF AF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `A0`  
> _{{ }}_ (empty blob)

> `A1 FF`  
> 1 byte blob

> `A2 FF FF`  
> 2 byte blob

> `A3 FF FF FF`  
> 3 byte blob

> `A4 FF FF FF FF`  
> 4 byte blob

> `A5 FF FF FF FF FF`  
> 5 byte blob

> `A6 FF FF FF FF FF FF`  
> 6 byte blob

> `A7 FF FF FF FF FF FF FF`  
> 7 byte blob

> `A8 FF FF FF FF FF FF FF FF`  
> 8 byte blob

> `A9 FF FF FF FF FF FF FF FF FF`  
> 9 byte blob

> `AA FF FF FF FF FF FF FF FF FF FF`  
> 10 byte blob

> `AB FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte blob

> `AC FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte blob

> `AD FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte blob

> `AE 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte blob

> `AF`  
> _null.blob_

### Invalid blob type descriptors

> _none_

## T11 - list

Specification: http://amzn.github.io/ion-docs/docs/binary.html#11-list  

```
E0 01 00 EA B0 B1 0F B2 0F 0F B3 0F 0F 0F B4 0F 
0F 0F 0F B5 0F 0F 0F 0F 0F B6 0F 0F 0F 0F 0F 0F 
B7 0F 0F 0F 0F 0F 0F 0F B8 0F 0F 0F 0F 0F 0F 0F 
0F B9 0F 0F 0F 0F 0F 0F 0F 0F 0F BA 0F 0F 0F 0F 
0F 0F 0F 0F 0F 0F BB 0F 0F 0F 0F 0F 0F 0F 0F 0F 
0F 0F BC 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F BD 
0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F BE 8E 0F 
0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F BF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `B0`  
> _[]_ (empty list)

> `B1 0F`  
> 1 byte list

> `B2 0F 0F`  
> 2 byte list

> `B3 0F 0F 0F`  
> 3 byte list

> `B4 0F 0F 0F 0F`  
> 4 byte list

> `B5 0F 0F 0F 0F 0F`  
> 5 byte list

> `B6 0F 0F 0F 0F 0F 0F`  
> 6 byte list

> `B7 0F 0F 0F 0F 0F 0F 0F`  
> 7 byte list

> `B8 0F 0F 0F 0F 0F 0F 0F 0F`  
> 8 byte list

> `B9 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 9 byte list

> `BA 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 10 byte list

> `BB 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 11 byte list

> `BC 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 12 byte list

> `BD 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 13 byte list

> `BE 8E 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> VarUInt (8E = 14) byte list

> `BF`  
> _null.list_

### Invalid list type descriptors

> _none_

## T12 - sexp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#12-sexp  

```
E0 01 00 EA C0 C1 0F C2 0F 0F C3 0F 0F 0F C4 0F 
0F 0F 0F C5 0F 0F 0F 0F 0F C6 0F 0F 0F 0F 0F 0F 
C7 0F 0F 0F 0F 0F 0F 0F C8 0F 0F 0F 0F 0F 0F 0F 
0F C9 0F 0F 0F 0F 0F 0F 0F 0F 0F CA 0F 0F 0F 0F 
0F 0F 0F 0F 0F 0F CB 0F 0F 0F 0F 0F 0F 0F 0F 0F 
0F 0F CC 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F CD 
0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F CE 8E 0F 
0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F CF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `C0`  
> _()_ (empty sexp)

> `C1 0F`  
> 1 byte sexp

> `C2 0F 0F`  
> 2 byte sexp

> `C3 0F 0F 0F`  
> 3 byte sexp

> `C4 0F 0F 0F 0F`  
> 4 byte sexp

> `C5 0F 0F 0F 0F 0F`  
> 5 byte sexp

> `C6 0F 0F 0F 0F 0F 0F`  
> 6 byte sexp

> `C7 0F 0F 0F 0F 0F 0F 0F`  
> 7 byte sexp

> `C8 0F 0F 0F 0F 0F 0F 0F 0F`  
> 8 byte sexp

> `C9 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 9 byte sexp

> `CA 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 10 byte sexp

> `CB 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 11 byte sexp

> `CC 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 12 byte sexp

> `CD 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> 13 byte sexp

> `CE 8E 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F 0F`  
> VarUInt (8E = 14) byte sexp

> `CF`  
> _null.sexp_

### Invalid sexp type descriptors

> _none_

## T13 - struct

Specification: http://amzn.github.io/ion-docs/docs/binary.html#13-struct  

```
E0 01 00 EA D0 D1 82 81 0F D2 81 0F D3 81 81 30 
D4 81 82 30 30 D5 81 83 30 30 30 D6 81 84 30 30 
30 30 D7 81 85 30 30 30 30 30 D8 81 86 30 30 30 
30 30 30 D9 81 87 30 30 30 30 30 30 30 DA 81 88 
30 30 30 30 30 30 30 30 DB 81 89 30 30 30 30 30 
30 30 30 30 DC 81 8A 30 30 30 30 30 30 30 30 30 
30 DD 81 8B 30 30 30 30 30 30 30 30 30 30 30 DE 
8E 81 8C 30 30 30 30 30 30 30 30 30 30 30 30 DF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `D0`  
> _{}_ (empty struct)

> `D1 82 81 0F`  
> Sorted VarUInt (82 = 2) byte struct

> `D2 81 0F`  
> 2 byte struct

> `D3 81 81 30`  
> 3 byte struct

> `D4 81 82 30 30`  
> 4 byte struct

> `D5 81 83 30 30 30`  
> 5 byte struct

> `D6 81 84 30 30 30 30`  
> 6 byte struct

> `D7 81 85 30 30 30 30 30`  
> 7 byte struct

> `D8 81 86 30 30 30 30 30 30`  
> 8 byte struct

> `D9 81 87 30 30 30 30 30 30 30`  
> 9 byte struct

> `DA 81 88 30 30 30 30 30 30 30 30`  
> 10 byte struct

> `DB 81 89 30 30 30 30 30 30 30 30 30`  
> 11 byte struct

> `DC 81 8A 30 30 30 30 30 30 30 30 30 30`  
> 12 byte struct

> `DD 81 8B 30 30 30 30 30 30 30 30 30 30 30`  
> 13 byte struct

> `DE 8E 81 8C 30 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte struct

> `DF`  
> _null.struct_

### Invalid struct type descriptors

> _none_

## T14 - annotations

Specification: http://amzn.github.io/ion-docs/docs/binary.html#annotations  

```
E0 01 00 EA E0 01 00 EA E3 81 81 80 E4 81 81 81 
30 E5 81 81 82 30 30 E6 81 81 83 30 30 30 E7 81 
81 84 30 30 30 30 E8 81 81 85 30 30 30 30 30 E9 
81 81 86 30 30 30 30 30 30 EA 81 81 87 30 30 30 
30 30 30 30 EB 81 81 88 30 30 30 30 30 30 30 30 
EC 81 81 89 30 30 30 30 30 30 30 30 30 ED 81 81 
8A 30 30 30 30 30 30 30 30 30 30 EE 8E 81 81 8B 
30 30 30 30 30 30 30 30 30 30 30
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `E0 01 00 EA`  
> Binary Version Marker (BVM) (the only valid sequence after E0)

> `E3 81 81 80`  
> 3 byte annotation wrapper

> `E4 81 81 81 30`  
> 4 byte annotation wrapper

> `E5 81 81 82 30 30`  
> 5 byte annotation wrapper

> `E6 81 81 83 30 30 30`  
> 6 byte annotation wrapper

> `E7 81 81 84 30 30 30 30`  
> 7 byte annotation wrapper

> `E8 81 81 85 30 30 30 30 30`  
> 8 byte annotation wrapper

> `E9 81 81 86 30 30 30 30 30 30`  
> 9 byte annotation wrapper

> `EA 81 81 87 30 30 30 30 30 30 30`  
> 10 byte annotation wrapper

> `EB 81 81 88 30 30 30 30 30 30 30 30`  
> 11 byte annotation wrapper

> `EC 81 81 89 30 30 30 30 30 30 30 30 30`  
> 12 byte annotation wrapper

> `ED 81 81 8A 30 30 30 30 30 30 30 30 30 30`  
> 13 byte annotation wrapper

> `EE 8E 81 81 8B 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte annotation wrapper

### Invalid annotation type descriptors

> `E1`, `E2`, `E15`

## T15 - reserved

Specification: http://amzn.github.io/ion-docs/docs/binary.html#15-reserved  

```
E0 01 00 EA
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

### Invalid reserved type descriptors

> `F0`, `F1`, `F2`, `F3`, `F4`, `F5`, `F6`, `F7`, `F8`, `F9`, `FA`, `FB`, `FC`, `FD`, `FE`, `FF`