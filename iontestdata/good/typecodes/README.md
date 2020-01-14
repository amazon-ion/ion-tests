# Type Codes

The files in this folder are used to test all of the good type descriptors for Ion 1.0.  
Each file contains a valid Ion [Value Stream](http://amzn.github.io/ion-docs/docs/binary.html#value-streams).  
Where possible, all representations are made up of invalid type descriptors (`12`, `30`, `E1`, `FF`) to ensure readers are reading the proper lengths without relying on an implementation for reading the representation. Symbols are an exception; writing a symbol table with a large `max_id` adds unwanted complexity to the tests. For example, by choosing an invalid type descriptor, `FF`, as the int representation in `2E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`,  a reader that gets the length incorrect is more likely to fail by skipping to a `FF` rather than to part of the representation that also happens to be a valid type descriptor.  
Timestamps and symbols are split into 2 files, one for small representations and one for larger representations.  

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

> `12`, `13`, `14`, `15`, `16`, `17`, `18`, `19`, `1A`, `1B`, `1C`, `1D`, `1E`

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
> _255_

> `22 FF FF`  
> 2 byte positive int  
> _65535_

> `23 FF FF FF`  
> 3 byte positive int  
> _16777215_

> `24 FF FF FF FF`  
> 4 byte positive int  
> _4294967295_

> `25 FF FF FF FF FF`  
> 5 byte positive int  
> _1099511627775_

> `26 FF FF FF FF FF FF`  
> 6 byte positive int  
> _281474976710655_

> `27 FF FF FF FF FF FF FF`  
> 7 byte positive int  
> _72057594037927935_

> `28 FF FF FF FF FF FF FF FF`  
> 8 byte positive int  
> _18446744073709551615_

> `29 FF FF FF FF FF FF FF FF FF`  
> 9 byte positive int  
> _4722366482869645213695_

> `2A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte positive int  
> _1208925819614629174706175_

> `2B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte positive int  
> _309485009821345068724781055_

> `2C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte positive int  
> _79228162514264337593543950335_

> `2D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte positive int  
> _20282409603651670423947251286015_

> `2E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte positive int  
> _5192296858534827628530496329220095_

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
> _-255_

> `32 FF FF`  
> 2 byte negative int  
> _-65535_

> `33 FF FF FF`  
> 3 byte negative int  
> _-16777215_

> `34 FF FF FF FF`  
> 4 byte negative int  
> _-4294967295_

> `35 FF FF FF FF FF`  
> 5 byte negative int  
> _-1099511627775_

> `36 FF FF FF FF FF FF`  
> 6 byte negative int  
> _-281474976710655_

> `37 FF FF FF FF FF FF FF`  
> 7 byte negative int  
> _-72057594037927935_

> `38 FF FF FF FF FF FF FF FF`  
> 8 byte negative int  
> _-18446744073709551615_

> `39 FF FF FF FF FF FF FF FF FF`  
> 9 byte negative int  
> _-4722366482869645213695_

> `3A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte negative int  
> _-1208925819614629174706175_

> `3B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte negative int  
> _-309485009821345068724781055_

> `3C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte negative int  
> _-79228162514264337593543950335_

> `3D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte negative int  
> _-20282409603651670423947251286015_

> `3E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte negative int  
> _-5192296858534827628530496329220095_

> `3F`  
> _null.int_

### Invalid int (negative) type descriptors

> `30`  

## T4 - float

Specification: http://amzn.github.io/ion-docs/docs/binary.html#4-float  

```
E0 01 00 EA 40 44 12 12 12 12 48 12 12 12 12 12 
12 12 12 4F  
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `40`  
> _0e0_

> `44 12 12 12 12`  
> 32 bit (4 octet) float  
> _4.609175024471393E-28_

> `48 12 12 12 12 12 12 12 12`  
> 64 bit (8 octet) float  
> _1.2497855238365512E-221_

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
> _0d-63_

> `52 FF FF`  
> 2 byte decimal  
> _-1.27d-61_

> `53 FF FF FF`  
> 3 byte decimal  
> _-3.2767d-59_

> `54 FF FF FF FF`  
> 4 byte decimal  
> _-8.388607d-57_

> `55 FF FF FF FF FF`  
> 5 byte decimal  
> _-2.147483647d-54_

> `56 FF FF FF FF FF FF`  
> 6 byte decimal  
> _-5.49755813887d-52_

> `57 FF FF FF FF FF FF FF`  
> 7 byte decimal  
> _-1.40737488355327d-49_

> `58 FF FF FF FF FF FF FF FF`  
> 8 byte decimal  
> _-3.6028797018963967d-47_

> `59 FF FF FF FF FF FF FF FF FF`  
> 9 byte decimal  
> _-9.223372036854775807d-45_

> `5A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte decimal  
> _-2.361183241434822606847d-42_

> `5B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte decimal  
> _-6.04462909807314587353087d-40_

> `5C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte decimal  
> _-1.54742504910672534362390527d-37_

> `5D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte decimal  
> _-3.9614081257132168796771975167d-35_

> `5E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte decimal  
> _-1.0141204801825835211973625643007d-32_

> `5F`  
> _null.decimal_

### Invalid decimal type descriptors

> _none_

## T6-small - timestamp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#6-timestamp  

```
E0 01 00 EA 62 C0 E1 63 C0 E1 81 64 C0 E1 81 81 
65 C0 12 E1 81 81 66 E1 E1 81 81 81 81 67 E1 E1 
81 81 81 81 81 6F  
 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `62 C0 E1`  
> 2 byte timestamps can have at most VarInt offset and VarUInt year components.  
> Month, day, hour, minute, second, fraction_exponent, and fraction_coefficient components cannot be specified in a 2 byte timestamp.  
> _0097T_

> `63 C0 E1 81`  
> 3 byte timestamps can have at most VarInt offset, VarUInt year, and VarUInt month components.  
> Day, hour, minute, second, fraction_exponent, and fraction_coefficient components cannot be specified in a 3 byte timestamp.  
> _0097-01T_

> `64 C0 E1 81 81`  
> 4 byte timestamps can have at most VarInt offset, VarUInt year, VarUInt month, and VarUInt day components.  
> Hour, minute, second, fraction_exponent, and fraction_coefficient components  cannot be specified in a 4 byte timestamp.  
> _0097-01-01T_ or _0097-01-01_

> `65 C0 12 E1 81 81`  
> 5 byte timestamp can have at most VarInt offset, VarUInt year, VarUInt month, and VarUInt day components.  
> Hour, minute, second, fraction_exponent, and fraction_coefficient components cannot be specified in a 5 byte timestamp.  
> _2401-01-01T_ or _2401-01-01_

> `66 E1 E1 81 81 81 81`  
> 6 byte timestamp can have at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, and VarUInt minute components.  
> Second, fraction_exponent, and fraction_coefficient components cannot be specified in a 6 byte timestamp.  
> _0097-01-01T00:28-00:33_

> `67 E1 E1 81 81 81 81 81`  
> 7 byte timestamp can have at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, VarUInt minute, and VarUInt second  components.  
> Fraction_exponent, and fraction_coefficient components cannot be specified in a 7 byte timestamp.  
> _0097-01-01T00:28:01-00:33_

> `6F`  
> _null.timestamp_

### Invalid timestamp type descriptors

> `60`, `61`  

## T6-large - timestamp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#6-timestamp  

```
E0 01 00 EA 68 E1 E1 81 81 81 81 81 E1 69 E1 E1 
81 81 81 81 81 E1 12 6A E1 E1 81 81 81 81 81 E1 
12 12 6B E1 E1 81 81 81 81 81 E1 12 12 12 6C E1 
E1 81 81 81 81 81 E1 12 12 12 12 6D E1 E1 81 81 
81 81 81 E1 12 12 12 12 12 6E 8E E1 E1 81 81 81 
81 81 E1 12 12 12 12 12 12
```

> `68 E1 E1 81 81 81 81 81 E1`  
> 8 byte timestamp can have at most VarInt offset, VarUInt year, VarUInt month, VarUInt day, VarUInt hour, VarUInt minute, VarUInt second, and VarInt fraction_exponent components.  
> The fraction_coefficient component cannot be specified in a 8 byte timestamp.  
> _0097-01-01T00:28:01.000000000000000000000000000000000-00:33_

> `69 E1 E1 81 81 81 81 81 E1 12`  
> 9 byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000000000000000018-00:33_

> `6A E1 E1 81 81 81 81 81 E1 12 12`  
> 10 byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000000000000004626-00:33_

> `6B E1 E1 81 81 81 81 81 E1 12 12 12`  
> 11 byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000000000001184274-00:33_

> `6C E1 E1 81 81 81 81 81 E1 12 12 12 12`  
> 12 byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000000000303174162-00:33_

> `6D E1 E1 81 81 81 81 81 E1 12 12 12 12 12`  
> 13 byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000000077612585490-00:33_

> `6E 8E E1 E1 81 81 81 81 81 E1 12 12 12 12 12 12`  
> VarUInt (8E = 14) byte timestamp with all components possibly present.  
> _0097-01-01T00:28:01.000000000000000000019868821885458-00:33_

### Invalid timestamp type descriptors

> `60`, `61`  

## T7-small - symbol

Specification: http://amzn.github.io/ion-docs/docs/binary.html#7-symbol  

```
E0 01 00 EA 70 71 00 72 00 00 73 00 00 00 74 00 
00 00 00 7F 
 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `70`  
> symbol ID zero or _$0_

> `71 00`  
> 1 byte symbol ID  
> symbol ID zero or _$0_

> `72 00 00`  
> 2 byte symbol ID  
> symbol ID zero or _$0_

> `73 00 00 00`  
> 3 byte symbol ID  
> symbol ID zero or _$0_

> `74 00 00 00 00`  
> 4 byte symbol ID  
> symbol ID zero or _$0_

> `7F`  
> _null.symbol_

### Invalid symbol type descriptors

> _none_

## T7-large - symbol

Specification: http://amzn.github.io/ion-docs/docs/binary.html#7-symbol  

```
E0 01 00 EA 75 00 00 00 00 00 76 00 00 00 00 00 
00 77 00 00 00 00 00 00 00 78 00 00 00 00 00 00 
00 00 79 00 00 00 00 00 00 00 00 00 7A 00 00 00 
00 00 00 00 00 00 00 7B 00 00 00 00 00 00 00 00 
00 00 00 7C 00 00 00 00 00 00 00 00 00 00 00 00 
7D 00 00 00 00 00 00 00 00 00 00 00 00 00 7E 8E 
00 00 00 00 00 00 00 00 00 00 00 00 00 00 
 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `75 00 00 00 00 00`  
> 5 byte symbol ID  
> symbol ID zero or _$0_

> `76 00 00 00 00 00 00`  
> 6 byte symbol ID  
> symbol ID zero or _$0_

> `77 00 00 00 00 00 00 00`  
> 7 byte symbol ID  
> symbol ID zero or _$0_

> `78 00 00 00 00 00 00 00 00`  
> 8 byte symbol ID  
> symbol ID zero or _$0_

> `79 00 00 00 00 00 00 00 00 00`  
> 9 byte symbol ID  
> symbol ID zero or _$0_

> `7A 00 00 00 00 00 00 00 00 00 00`  
> 10 byte symbol ID  
> symbol ID zero or _$0_

> `7B 00 00 00 00 00 00 00 00 00 00 00`  
> 11 byte symbol ID  
> symbol ID zero or _$0_

> `7C 00 00 00 00 00 00 00 00 00 00 00 00`  
> 12 byte symbol ID  
> symbol ID zero or _$0_

> `7D 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> 13 byte symbol ID  
> symbol ID zero or _$0_

> `7E 8E 00 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> VarUInt (8E = 14) byte symbol ID  
> symbol ID zero or _$0_

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
> _"0"_

> `82 30 30`  
> 2 byte string  
> _"00"_

> `83 30 30 30`  
> 3 byte string  
> _"000"_

> `84 30 30 30 30`  
> 4 byte string  
> _"0000"_

> `85 30 30 30 30 30`  
> 5 byte string  
> _"00000"_

> `86 30 30 30 30 30 30`  
> 6 byte string  
> _"000000"_

> `87 30 30 30 30 30 30 30`  
> 7 byte string  
> _"0000000"_

> `88 30 30 30 30 30 30 30 30`  
> 8 byte string  
> _"00000000"_

> `89 30 30 30 30 30 30 30 30 30`  
> 9 byte string  
> _"000000000"_

> `8A 30 30 30 30 30 30 30 30 30 30`  
> 10 byte string  
> _"0000000000"_

> `8B 30 30 30 30 30 30 30 30 30 30 30`  
> 11 byte string  
> _"00000000000"_

> `8C 30 30 30 30 30 30 30 30 30 30 30 30`  
> 12 byte string  
> _"000000000000"_

> `8D 30 30 30 30 30 30 30 30 30 30 30 30 30`  
> 13 byte string  
> _"0000000000000"_

> `8E 8E 30 30 30 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte string  
> _"00000000000000"_

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
> _{{ "\xFF" }}_

> `92 FF FF`  
> 2 byte clob  
> _{{"\xFF\xFF"}}_

> `93 FF FF FF`  
> 3 byte clob  
> _{{"\xFF\xFF\xFF"}}_

> `94 FF FF FF FF`  
> 4 byte clob  
> _{{"\xFF\xFF\xFF\xFF"}}_

> `95 FF FF FF FF FF`  
> 5 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF"}}_

> `96 FF FF FF FF FF FF`  
> 6 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `97 FF FF FF FF FF FF FF`  
> 7 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `98 FF FF FF FF FF FF FF FF`  
> 8 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `99 FF FF FF FF FF FF FF FF FF`  
> 9 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `9A FF FF FF FF FF FF FF FF FF FF`  
> 10 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `9B FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `9C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `9D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

> `9E 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte clob  
> _{{"\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF"}}_

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
> _{{/w==}}_ (base64 representation)

> `A2 FF FF`  
> 2 byte blob  
> _{{//8=}}_ (base64 representation)

> `A3 FF FF FF`  
> 3 byte blob  
> _{{////}}_ (base64 representation)

> `A4 FF FF FF FF`  
> 4 byte blob  
> _{{/////w==}}_ (base64 representation)

> `A5 FF FF FF FF FF`  
> 5 byte blob  
> _{{//////8=}}_ (base64 representation)

> `A6 FF FF FF FF FF FF`  
> 6 byte blob  
> _{{////////}}_ (base64 representation)

> `A7 FF FF FF FF FF FF FF`  
> 7 byte blob  
> _{{/////////w==}}_ (base64 representation)

> `A8 FF FF FF FF FF FF FF FF`  
> 8 byte blob  
> _{{//////////8=}}_ (base64 representation)

> `A9 FF FF FF FF FF FF FF FF FF`  
> 9 byte blob  
> _{{////////////}}_ (base64 representation)

> `AA FF FF FF FF FF FF FF FF FF FF`  
> 10 byte blob  
> _{{/////////////w==}}_ (base64 representation)

> `AB FF FF FF FF FF FF FF FF FF FF FF`  
> 11 byte blob  
> _{{//////////////8=}}_ (base64 representation)

> `AC FF FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte blob  
> _{{////////////////}}_ (base64 representation)

> `AD FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte blob  
> _{{/////////////////w==}}_ (base64 representation)

> `AE 8E FF FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte blob  
> _{{//////////////////8=}}_ (base64 representation)

> `AF`  
> _null.blob_

### Invalid blob type descriptors

> _none_

## T11 - list

Specification: http://amzn.github.io/ion-docs/docs/binary.html#11-list  

```
E0 01 00 EA B0 B1 00 B2 01 FF B3 02 FF FF B4 03 
FF FF FF B5 04 FF FF FF FF B6 05 FF FF FF FF FF 
B7 06 FF FF FF FF FF FF B8 07 FF FF FF FF FF FF 
FF B9 08 FF FF FF FF FF FF FF FF BA 09 FF FF FF 
FF FF FF FF FF FF BB 0A FF FF FF FF FF FF FF FF 
FF FF BC 0B FF FF FF FF FF FF FF FF FF FF FF BD 
0C FF FF FF FF FF FF FF FF FF FF FF FF BE 8E 0D 
FF FF FF FF FF FF FF FF FF FF FF FF FF BF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `B0`  
> _[]_ (empty list)

> `B1 00`  
> 1 byte list  
> _[]_ (empty list)

> `B2 01 FF`  
> 2 byte list  
> _[]_ (empty list)

> `B3 02 FF FF`  
> 3 byte list  
> _[]_ (empty list)

> `B4 03 FF FF FF`  
> 4 byte list  
> _[]_ (empty list)

> `B5 04 FF FF FF FF`  
> 5 byte list  
> _[]_ (empty list)

> `B6 05 FF FF FF FF FF`  
> 6 byte list  
> _[]_ (empty list)

> `B7 06 FF FF FF FF FF FF`  
> 7 byte list  
> _[]_ (empty list)

> `B8 07 FF FF FF FF FF FF FF`  
> 8 byte list  
> _[]_ (empty list)

> `B9 08 FF FF FF FF FF FF FF FF`  
> 9 byte list  
> _[]_ (empty list)

> `BA 09 FF FF FF FF FF FF FF FF FF`  
> 10 byte list  
> _[]_ (empty list)

> `BB 0A FF FF FF FF FF FF FF FF FF FF`  
> 11 byte list  
> _[]_ (empty list)

> `BC 0B FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte list  
> _[]_ (empty list)

> `BD 0C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte list  
> _[]_ (empty list)

> `BE 8E 0D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte list  
> _[]_ (empty list)

> `BF`  
> _null.list_

### Invalid list type descriptors

> _none_

## T12 - sexp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#12-sexp  

```
E0 01 00 EA C0 C1 00 C2 01 FF C3 02 FF FF C4 03 
FF FF FF C5 04 FF FF FF FF C6 05 FF FF FF FF FF 
C7 06 FF FF FF FF FF FF C8 07 FF FF FF FF FF FF 
FF C9 08 FF FF FF FF FF FF FF FF CA 09 FF FF FF 
FF FF FF FF FF FF CB 0A FF FF FF FF FF FF FF FF 
FF FF CC 0B FF FF FF FF FF FF FF FF FF FF FF CD 
0C FF FF FF FF FF FF FF FF FF FF FF FF CE 8E 0D 
FF FF FF FF FF FF FF FF FF FF FF FF FF CF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `C0`  
> _()_ (empty sexp)

> `C1 00`  
> 1 byte sexp  
> _()_ (empty sexp)

> `C2 01 FF`  
> 2 byte sexp  
> _()_ (empty sexp)

> `C3 02 FF FF`  
> 3 byte sexp  
> _()_ (empty sexp)

> `C4 03 FF FF FF`  
> 4 byte sexp  
> _()_ (empty sexp)

> `C5 04 FF FF FF FF`  
> 5 byte sexp  
> _()_ (empty sexp)

> `C6 05 FF FF FF FF FF`  
> 6 byte sexp  
> _()_ (empty sexp)

> `C7 06 FF FF FF FF FF FF`  
> 7 byte sexp  
> _()_ (empty sexp)

> `C8 07 FF FF FF FF FF FF FF`  
> 8 byte sexp  
> _()_ (empty sexp)

> `C9 08 FF FF FF FF FF FF FF FF`  
> 9 byte sexp  
> _()_ (empty sexp)

> `CA 09 FF FF FF FF FF FF FF FF FF`  
> 10 byte sexp  
> _()_ (empty sexp)

> `CB 0A FF FF FF FF FF FF FF FF FF FF`  
> 11 byte sexp  
> _()_ (empty sexp)

> `CC 0B FF FF FF FF FF FF FF FF FF FF FF`  
> 12 byte sexp  
> _()_ (empty sexp)

> `CD 0C FF FF FF FF FF FF FF FF FF FF FF FF`  
> 13 byte sexp  
> _()_ (empty sexp)

> `CE 8E 0D FF FF FF FF FF FF FF FF FF FF FF FF FF`  
> VarUInt (8E = 14) byte sexp  
> _()_ (empty sexp)

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
> _{ $ion:null }_

> `D2 81 0F`  
> 2 byte struct  
> _{ $ion:null }_

> `D3 81 81 30`  
> 3 byte struct  
> _{ $ion:"0" }_

> `D4 81 82 30 30`  
> 4 byte struct  
> _{ $ion:"00" }_

> `D5 81 83 30 30 30`  
> 5 byte struct  
> _{ $ion:"000" }_

> `D6 81 84 30 30 30 30`  
> 6 byte struct  
> _{ $ion:"0000" }_

> `D7 81 85 30 30 30 30 30`  
> 7 byte struct  
> _{ $ion:"00000" }_

> `D8 81 86 30 30 30 30 30 30`  
> 8 byte struct  
> _{ $ion:"000000" }_

> `D9 81 87 30 30 30 30 30 30 30`  
> 9 byte struct  
> _{ $ion:"0000000" }_

> `DA 81 88 30 30 30 30 30 30 30 30`  
> 10 byte struct  
> _{ $ion:"00000000" }_

> `DB 81 89 30 30 30 30 30 30 30 30 30`  
> 11 byte struct  
> _{ $ion:"000000000" }_

> `DC 81 8A 30 30 30 30 30 30 30 30 30 30`  
> 12 byte struct  
> _{ $ion:"0000000000" }_

> `DD 81 8B 30 30 30 30 30 30 30 30 30 30 30`  
> 13 byte struct  
> _{ $ion:"00000000000" }_

> `DE 8E 81 8C 30 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte struct  
> _{ $ion:"000000000000" }_

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
> _$ion::""_

> `E4 81 81 81 30`  
> 4 byte annotation wrapper  
> _$ion::"0"_

> `E5 81 81 82 30 30`  
> 5 byte annotation wrapper  
> _$ion::"00"_

> `E6 81 81 83 30 30 30`  
> 6 byte annotation wrapper  
> _$ion::"000"_

> `E7 81 81 84 30 30 30 30`  
> 7 byte annotation wrapper  
> _$ion::"0000"_

> `E8 81 81 85 30 30 30 30 30`  
> 8 byte annotation wrapper  
> _$ion::"00000"_

> `E9 81 81 86 30 30 30 30 30 30`  
> 9 byte annotation wrapper  
> _$ion::"000000"_

> `EA 81 81 87 30 30 30 30 30 30 30`  
> 10 byte annotation wrapper  
> _$ion::"0000000"_

> `EB 81 81 88 30 30 30 30 30 30 30 30`  
> 11 byte annotation wrapper  
> _$ion::"00000000"_

> `EC 81 81 89 30 30 30 30 30 30 30 30 30`  
> 12 byte annotation wrapper  
> _$ion::"000000000"_

> `ED 81 81 8A 30 30 30 30 30 30 30 30 30 30`  
> 13 byte annotation wrapper  
> _$ion::"0000000000"_

> `EE 8E 81 81 8B 30 30 30 30 30 30 30 30 30 30 30`  
> VarUInt (8E = 14) byte annotation wrapper  
> _$ion::"00000000000"_

### Invalid annotation type descriptors

> `E1`, `E2`, `E15`

## T15 - reserved

Specification: http://amzn.github.io/ion-docs/docs/binary.html#15-reserved  

### Invalid reserved type descriptors

> `F0`, `F1`, `F2`, `F3`, `F4`, `F5`, `F6`, `F7`, `F8`, `F9`, `FA`, `FB`, `FC`, `FD`, `FE`, `FF`