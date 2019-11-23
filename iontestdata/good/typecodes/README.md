# Type Codes

Test all of the type codes.  
All values set to invalid type codes when possible.  
Split the files by type code.  

## T0 - null / nop padding

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

## T1 - bool

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


## T3 - int (negative)

```
E0 01 00 EA 31 FF 32 FF FF 33 FF FF FF 34 FF FF 
FF FF 35 FF FF FF FF FF 36 FF FF FF FF FF FF 37 
FF FF FF FF FF FF FF 38 FF FF FF FF FF FF FF FF 
39 FF FF FF FF FF FF FF FF FF 3A FF FF FF FF FF 
FF FF FF FF FF 3B FF FF FF FF FF FF FF FF FF FF 
FF 3C FF FF FF FF FF FF FF FF FF FF FF FF 3D FF 
FF FF FF FF FF FF FF FF FF FF FF FF 3E 8D FF FF 
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

## T6 - timestamp

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