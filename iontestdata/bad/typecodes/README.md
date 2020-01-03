# Type Codes

The files in this folder are used to test all of the bad type descriptors for Ion 1.0.  
Each file contains an invalid Ion [Value Stream](http://amzn.github.io/ion-docs/docs/binary.html#value-streams).  
All representations are made up of valid type descriptors to ensure readers are failing when appropriate.  
Each type descriptor is broken out into a separate file.  

## T1 - bool

Specification: http://amzn.github.io/ion-docs/docs/binary.html#1-bool

### T1L2

```
E0 01 00 EA 12 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `12`  
> Invalid bool

### T1L3

```
E0 01 00 EA 13 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `13`  
> Invalid bool

### T1L4

```
E0 01 00 EA 14
``` 

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `14`  
> Invalid bool

### T1L5

```
E0 01 00 EA 15
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `15`  
> Invalid bool

### T1L6

```
E0 01 00 EA 16 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `16`  
> Invalid bool

### T1L7

```
E0 01 00 EA 17 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `17`  
> Invalid bool

### T1L8

```
E0 01 00 EA 18 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `18`  
> Invalid bool

### T1L9

```
E0 01 00 EA 19 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `19`  
> Invalid bool

### T1LA

```
E0 01 00 EA 1A 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `1A`  
> Invalid bool

### T1LB

```
E0 01 00 EA 1B 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `1B`  
> Invalid bool

### T1LC

```
E0 01 00 EA 1C 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `1C`  
> Invalid bool

### T1LD

```
E0 01 00 EA 1D 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `1D`  
> Invalid bool

### T1LE

```
E0 01 00 EA 1E 81 FF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `1E 81 FF`  
> Invalid bool with an arbitrary 1 byte VarUInt representation

## T3 - int (negative)

Specification: http://amzn.github.io/ion-docs/docs/binary.html#2-and-3-int 

### T3L0

```
E0 01 00 EA 30 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `30`  
> Invalid negative int

## T4 - float

Specification: http://amzn.github.io/ion-docs/docs/binary.html#4-float 

### T4L1

```
E0 01 00 EA 41 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `41 00`  
> Invalid float with an arbitrary 1 byte representation

### T4L2

```
E0 01 00 EA 42 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `42 00 00`  
> Invalid float with an arbitrary 2 byte representation

### T4L3

```
E0 01 00 EA 43 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `43 00 00 00`  
> Invalid float with an arbitrary 3 byte representation

### T4L5

```
E0 01 00 EA 45 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `45 00 00 00 00 00`  
> Invalid float with an arbitrary 5 byte representation

### T4L6

```
E0 01 00 EA 46 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `46 00 00 00 00 00 00`  
> Invalid float with an arbitrary 6 byte representation

### T4L7

```
E0 01 00 EA 47 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `47 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 7 byte representation

### T4L9

```
E0 01 00 EA 49 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `49 00 00 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 9 byte representation

### T4LA

```
E0 01 00 EA 4A 00 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `4A 00 00 00 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 10 byte representation

### T4LB

```
E0 01 00 EA 4B 00 00 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `4B 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 11 byte representation

### T4LC

```
E0 01 00 EA 4C 00 00 00 00 00 00 00 00 00 00 00 
00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `4C 00 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 12 byte representation

### T4LD

```
E0 01 00 EA 4D 00 00 00 00 00 00 00 00 00 00 00 
00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `4D 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid float with an arbitrary 13 byte representation

### T4LE

```
E0 01 00 EA 4E 81 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `4E 81 00`  
> Invalid float with an arbitrary 1 byte VarUInt representation

## T6 - timestamp

Specification: http://amzn.github.io/ion-docs/docs/binary.html#6-timestamp 

### T6L0

```
E0 01 00 EA 60 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `60`  
> Invalid timestamp

### T6L1

```
E0 01 00 EA 61 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `61 00`  
> Invalid timestamp with an arbitrary 1 byte representation

## T14 - annotations

Specification: http://amzn.github.io/ion-docs/docs/binary.html#annotations  

### TEL1

```
E0 01 00 EA E1 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `E1 00`  
> Invalid annotation with an arbitrary 1 byte representation

### TEL2

```
E0 01 00 EA E2 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `E2 00 00`  
> Invalid annotation with an arbitrary 2 byte representation

### TELF

```
E0 01 00 EA EF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `EF`  
> Invalid annotation

## T15 - reserved

Specification: http://amzn.github.io/ion-docs/docs/binary.html#15-reserved

### TFL0

```
E0 01 00 EA F0 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F0`  
> Reserved type descriptor

### TFL1

```
E0 01 00 EA F1 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F1 00`  
> Invalid reserved type descriptor with an arbitrary 1 byte representation

### TFL2

```
E0 01 00 EA F2 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F2 00 00`  
> Invalid reserved type descriptor with an arbitrary 2 byte representation

### TFL3

```
E0 01 00 EA F3 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F3 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 3 byte representation

### TFL4

```
E0 01 00 EA F4 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F4 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 4 byte representation

### TFL5

```
E0 01 00 EA F5 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F5 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 5 byte representation

### TFL6

```
E0 01 00 EA F6 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F6 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 6 byte representation

### TFL7

```
E0 01 00 EA F7 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F7 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 7 byte representation

### TFL8

```
E0 01 00 EA F8 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F8 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 8 byte representation

### TFL9

```
E0 01 00 EA F9 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `F9 00 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 9 byte representation

### TFLA

```
E0 01 00 EA FA 00 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FA 00 00 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 10 byte representation

### TFLB

```
E0 01 00 EA FB 00 00 00 00 00 00 00 00 00 00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FB 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 11 byte representation

### TFLC

```
E0 01 00 EA FC 00 00 00 00 00 00 00 00 00 00 00 
00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FC 00 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 12 byte representation

### TFLD

```
E0 01 00 EA FD 00 00 00 00 00 00 00 00 00 00 00 
00 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FD 00 00 00 00 00 00 00 00 00 00 00 00 00`  
> Invalid reserved type descriptor with an arbitrary 13 byte representation

### TFLE

```
E0 01 00 EA FE 81 00 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FE 81 00`  
> Invalid reserved type descriptor with an arbitrary 1 byte VarUInt representation

### TFLF

```
E0 01 00 EA FF 
```

> `E0 01 00 EA`  
> Binary Version Marker (BVM)

> `FF`  
> Invalid reserved type descriptor