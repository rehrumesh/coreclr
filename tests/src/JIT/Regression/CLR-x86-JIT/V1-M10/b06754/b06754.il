// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly b06754
{
}
.class ILGEN_939661025 {
.method static int32 main() {
.entrypoint
.maxstack	7
 .locals (float32, int64, float32)
//ldc.r4 33
//stloc 0
//ldc.i8 33
//stloc 1
//ldc.r4 33
//stloc 2

      ldloc 2
    conv.i8
   conv.i4
      ldc.r4 float32(0x38cc5085)
      ldc.r4 float32(0x532657f6)
     stloc 2
    conv.r8
      ldc.r4 float32(0x60f849ff)
      ldloc 0
    cgt
   conv.r4
  stloc 2
pop
pop
ldc.i4 100
ret
}
}

