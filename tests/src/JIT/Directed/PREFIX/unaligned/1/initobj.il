// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

.assembly extern legacy library mscorlib {}
.assembly initobj.exe{ //This byte field requests that this assembly not be verified at run time and corresponds to this C# declaration:
  //[assembly:System.Security.Permissions.SecurityPermissionAttribute( [mscorlib]System.Security.Permissions.SecurityAction.RequestMinimum, Flags=System.Security.Permissions.SecurityPermissionFlag.SkipVerification )]
  .permission reqmin ['mscorlib']System.Security.Permissions.SecurityPermissionAttribute ( "SkipVerification" = true )
                        }

.class public value sealed valClass{
	.field public int32		int32_Field
	.field public static int32	int32_SField
	.field public float32		float32_Field
	.field public static float32	float32_SField
	.field public int32*		int32_ptr_Field
	.field public static int32*	int32_ptr_SField
}

.class	public _initoj {

	//-------------------------
	// Entry point - Main     -
	//-------------------------
	.method public static int32 main(class [mscorlib]System.String[]) {
	.entrypoint
	.locals	(value class valClass, int32)
	.maxstack	10
	//----------------
	// begin testing -
	//----------------
	
//Set all valClass fields to a known state
		ldloca	0
		ldc.i4	0xAB
		unaligned. 0x1
		stfld	int32 valClass::int32_Field	

		ldc.i4	0xCD
		stsfld	int32 valClass::int32_SField	
		
		ldloca	0
		ldc.r4	8.8
		unaligned. 0x1
		stfld	float32 valClass::float32_Field	

		ldc.r4	9.9
		stsfld	float32 valClass::float32_SField	

		ldloca	0
		ldloca	1
		unaligned. 0x1
		stfld	int32* valClass::int32_ptr_Field	

		ldloca	1
		stsfld	int32* valClass::int32_ptr_SField	

//Check the state of all valClass fields to be sure they were initialized correctly
		ldloc	0
		unaligned. 0x1
		ldfld	int32 valClass::int32_Field
		ldc.i4	0xAB
		bne.un	FAIL

		ldsfld	int32 valClass::int32_SField
		ldc.i4	0xCD
		bne.un	FAIL	

		ldloc	0
		unaligned. 0x1
		ldfld	float32 valClass::float32_Field
		ldc.r4	8.8
		bne.un	FAIL

		ldsfld	float32 valClass::float32_SField
		ldc.r4	9.9
		bne.un	FAIL	

		ldloc	0
		unaligned. 0x1
		ldfld	int32* valClass::int32_ptr_Field
		ldloca	1
		bne.un	FAIL

		ldsfld	int32* valClass::int32_ptr_SField
		ldloca	1
		bne.un	FAIL	

//Call initobj
		ldloca	0
		initobj valClass

//Make sure all fields are set to zero or null and all static fields are unchanged.
		ldloc	0
		unaligned. 0x1
		ldfld	int32 valClass::int32_Field
		ldc.i4	0x0
		bne.un	FAIL

		ldsfld	int32 valClass::int32_SField
		ldc.i4	0xCD
		bne.un	FAIL	

		ldloc	0
		unaligned. 0x1
		ldfld	float32 valClass::float32_Field
		ldc.r4	0.0
		bne.un	FAIL

		ldsfld	float32 valClass::float32_SField
		ldc.r4	9.9
		bne.un	FAIL	

		ldloc	0
		unaligned. 0x1
		ldfld	int32* valClass::int32_ptr_Field
		ldnull
		bne.un	FAIL

		ldsfld	int32* valClass::int32_ptr_SField
		ldloca	1
		bne.un	FAIL	


		PASS:
		ldc.i4	0x64
		ret
	//----------------
		FAIL:
		ldc.i4	0x0
		ret
	}
}
