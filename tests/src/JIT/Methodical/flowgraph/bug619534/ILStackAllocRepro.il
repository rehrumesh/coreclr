// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.


.assembly ILStackAllocRepro {}
 .assembly extern mscorlib{auto}

.class private auto ansi beforefieldinit Foo
       extends [mscorlib]System.Object
{
  .field private static int32* buffer
  .method private hidebysig static int32 Main() cil managed
  {
    .entrypoint
    // Code size       20 (0x14)
    .maxstack  2
    .locals init (int32* V_0)
    IL_0000:  ldc.i4.8
    IL_0001:  localloc
    IL_0003:  stsfld     int32* Foo::buffer
    IL_0008:  ldsfld     int32* Foo::buffer
    IL_000d:  ldind.i4
    IL_000e:  call       void [mscorlib]System.Console::WriteLine(int32)
ldc.i4 100
    IL_0013:  ret
  } // end of method Foo::Main

} // end of class Foo

