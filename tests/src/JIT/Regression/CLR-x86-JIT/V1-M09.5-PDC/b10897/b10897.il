// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly b10897
{
  .permission reqmin ['mscorlib']System.Security.Permissions.SecurityPermissionAttribute ( "SkipVerification" = true )
}

// ----------------------------------
// -- bug --
// 0xABBA is the errorlevel on success
// ----------------------------------
.class bug {

.method static int32 jumpee(){
.maxstack	20
	ldc.i4 0xABBA
	ret
}

.method static int32 jumper(){
.maxstack 20
	jmp int32 bug::jumpee()
}

.method static int32 main(class [mscorlib]System.String[]) {
.entrypoint
.maxstack 20
	call int32 bug::jumper()
    ldc.i4 0xABBA
    ceq
    ldc.i4 1
    sub
ldc.i4 100
add
	ret
}
}