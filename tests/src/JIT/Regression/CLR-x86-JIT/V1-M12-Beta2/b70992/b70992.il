// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly ILGEN_0xa483b94d {}
.class ILGEN_0xa483b94d {
.method static int32 Main() {
.entrypoint
.maxstack	13
.try {
 .locals (native int LOCAL_0x2)
 ldc.i4 0x4ee510cd 
 stloc LOCAL_0x2
   ldc.i4.5
   newarr [mscorlib]System.Byte
    ldloc LOCAL_0x2
   conv.ovf.i8
  conv.u4
 ldelema [mscorlib]System.Byte
ldind.u1
 pop
leave END
} catch [mscorlib]System.IndexOutOfRangeException {
pop
leave END
}
END:
ldc.i4 100
ret

}
}