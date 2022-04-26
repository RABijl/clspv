
; RUN: clspv-opt --passes=replace-opencl-builtin,long-vector-lowering %s -o %t.ll
; RUN: FileCheck %s < %t.ll

; AUTO-GENERATED TEST FILE
; This test was generated by async_work_group_copy_long_vector_test_gen.py.
; Please modify that file and regenate the tests to make changes.

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

%opencl.event_t = type opaque


@__spirv_LocalInvocationId = local_unnamed_addr addrspace(5) global <3 x i32> zeroinitializer
@__spirv_WorkgroupSize = local_unnamed_addr addrspace(8) global <3 x i32> zeroinitializer


define dso_local spir_func %opencl.event_t* @foo(<16 x i32> addrspace(1)* %dst, <16 x i32> addrspace(3)* %src, i32 %num_gentypes, %opencl.event_t* %event) {
entry:
  %call = call spir_func %opencl.event_t* @_Z21async_work_group_copyPU3AS1Dv16_iPU3AS3KS_j9ocl_event(<16 x i32> addrspace(1)* %dst, <16 x i32> addrspace(3)* %src, i32 %num_gentypes, %opencl.event_t* %event)
  ret %opencl.event_t* %call
}

declare spir_func %opencl.event_t* @_Z21async_work_group_copyPU3AS1Dv16_iPU3AS3KS_j9ocl_event(<16 x i32> addrspace(1)*, <16 x i32> addrspace(3)*, i32, %opencl.event_t*)

; CHECK: [[localid0:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(5)* getelementptr (<3 x i32>, <3 x i32> addrspace(5)* @__spirv_LocalInvocationId, i32 0, i32 0), align
; CHECK: [[localid1:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(5)* getelementptr (<3 x i32>, <3 x i32> addrspace(5)* @__spirv_LocalInvocationId, i32 0, i32 1), align
; CHECK: [[localid2:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(5)* getelementptr (<3 x i32>, <3 x i32> addrspace(5)* @__spirv_LocalInvocationId, i32 0, i32 2), align
; CHECK: [[groupsizevec:%[a-zA-Z0-9_.]+]] = load <3 x i32>, <3 x i32> addrspace(8)* @__spirv_WorkgroupSize, align 16
; CHECK: [[groupsize0:%[a-zA-Z0-9_.]+]] = extractelement <3 x i32> [[groupsizevec]], i32 0
; CHECK: [[groupsize1:%[a-zA-Z0-9_.]+]] = extractelement <3 x i32> [[groupsizevec]], i32 1
; CHECK: [[groupsize2:%[a-zA-Z0-9_.]+]] = extractelement <3 x i32> [[groupsizevec]], i32 2
; CHECK: [[tmp7:%[a-zA-Z0-9_.]+]] = mul i32 [[localid2]], [[groupsize1]]
; CHECK: [[tmp8:%[a-zA-Z0-9_.]+]] = add i32 [[tmp7]], [[localid1]]
; CHECK: [[tmp9:%[a-zA-Z0-9_.]+]] = mul i32 [[tmp8]], [[groupsize0]]
; CHECK: [[startid:%[a-zA-Z0-9_.]+]] = add i32 [[tmp9]], [[localid0]]
; CHECK: [[tmp11:%[a-zA-Z0-9_.]+]] = mul i32 [[groupsize0]], [[groupsize1]]
; CHECK: [[incr:%[a-zA-Z0-9_.]+]] = mul i32 [[tmp11]], [[groupsize2]]
; CHECK: br label %[[cmp:[a-zA-Z0-9_.]+]]
; CHECK: [[cmp]]:
; CHECK: [[phiiterator:%[a-zA-Z0-9_.]+]] = phi i32 [ [[startid]], %[[entry:[a-zA-Z0-9_.]+]] ], [ [[nextiterator:%[a-zA-Z0-9_.]+]], %[[loop:[a-zA-Z0-9_.]+]] ]
; CHECK: [[icmp:%[a-zA-Z0-9_.]+]] = icmp ult i32 [[phiiterator]], %num_gentypes
; CHECK: br i1 [[icmp]], label %[[loop]], label %[[exit:[a-zA-Z0-9_.]+]]
; CHECK: [[loop]]:
; CHECK: [[dsti:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* %dst, i32 [[phiiterator]]
; CHECK: [[srci:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* %src, i32 [[phiiterator]]
; CHECK: [[nextiterator]] = add i32 [[phiiterator]], [[incr]]

;CHECK: [[gepsrc0:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 0
;CHECK: [[loadsrc0:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc0]], align 4
;CHECK: [[gepdst0:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 0
;CHECK: store i32 [[loadsrc0]], i32 addrspace(1)* [[gepdst0]], align 4

;CHECK: [[gepsrc1:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 1
;CHECK: [[loadsrc1:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc1]], align 4
;CHECK: [[gepdst1:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 1
;CHECK: store i32 [[loadsrc1]], i32 addrspace(1)* [[gepdst1]], align 4

;CHECK: [[gepsrc2:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 2
;CHECK: [[loadsrc2:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc2]], align 4
;CHECK: [[gepdst2:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 2
;CHECK: store i32 [[loadsrc2]], i32 addrspace(1)* [[gepdst2]], align 4

;CHECK: [[gepsrc3:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 3
;CHECK: [[loadsrc3:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc3]], align 4
;CHECK: [[gepdst3:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 3
;CHECK: store i32 [[loadsrc3]], i32 addrspace(1)* [[gepdst3]], align 4

;CHECK: [[gepsrc4:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 4
;CHECK: [[loadsrc4:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc4]], align 4
;CHECK: [[gepdst4:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 4
;CHECK: store i32 [[loadsrc4]], i32 addrspace(1)* [[gepdst4]], align 4

;CHECK: [[gepsrc5:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 5
;CHECK: [[loadsrc5:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc5]], align 4
;CHECK: [[gepdst5:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 5
;CHECK: store i32 [[loadsrc5]], i32 addrspace(1)* [[gepdst5]], align 4

;CHECK: [[gepsrc6:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 6
;CHECK: [[loadsrc6:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc6]], align 4
;CHECK: [[gepdst6:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 6
;CHECK: store i32 [[loadsrc6]], i32 addrspace(1)* [[gepdst6]], align 4

;CHECK: [[gepsrc7:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 7
;CHECK: [[loadsrc7:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc7]], align 4
;CHECK: [[gepdst7:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 7
;CHECK: store i32 [[loadsrc7]], i32 addrspace(1)* [[gepdst7]], align 4

;CHECK: [[gepsrc8:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 8
;CHECK: [[loadsrc8:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc8]], align 4
;CHECK: [[gepdst8:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 8
;CHECK: store i32 [[loadsrc8]], i32 addrspace(1)* [[gepdst8]], align 4

;CHECK: [[gepsrc9:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 9
;CHECK: [[loadsrc9:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc9]], align 4
;CHECK: [[gepdst9:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 9
;CHECK: store i32 [[loadsrc9]], i32 addrspace(1)* [[gepdst9]], align 4

;CHECK: [[gepsrc10:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 10
;CHECK: [[loadsrc10:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc10]], align 4
;CHECK: [[gepdst10:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 10
;CHECK: store i32 [[loadsrc10]], i32 addrspace(1)* [[gepdst10]], align 4

;CHECK: [[gepsrc11:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 11
;CHECK: [[loadsrc11:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc11]], align 4
;CHECK: [[gepdst11:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 11
;CHECK: store i32 [[loadsrc11]], i32 addrspace(1)* [[gepdst11]], align 4

;CHECK: [[gepsrc12:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 12
;CHECK: [[loadsrc12:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc12]], align 4
;CHECK: [[gepdst12:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 12
;CHECK: store i32 [[loadsrc12]], i32 addrspace(1)* [[gepdst12]], align 4

;CHECK: [[gepsrc13:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 13
;CHECK: [[loadsrc13:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc13]], align 4
;CHECK: [[gepdst13:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 13
;CHECK: store i32 [[loadsrc13]], i32 addrspace(1)* [[gepdst13]], align 4

;CHECK: [[gepsrc14:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 14
;CHECK: [[loadsrc14:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc14]], align 4
;CHECK: [[gepdst14:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 14
;CHECK: store i32 [[loadsrc14]], i32 addrspace(1)* [[gepdst14]], align 4

;CHECK: [[gepsrc15:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(3)* [[srci]], i32 0, i32 15
;CHECK: [[loadsrc15:%[a-zA-Z0-9_.]+]] = load i32, i32 addrspace(3)* [[gepsrc15]], align 4
;CHECK: [[gepdst15:%[a-zA-Z0-9_.]+]] = getelementptr [16 x i32], [16 x i32] addrspace(1)* [[dsti]], i32 0, i32 15
;CHECK: store i32 [[loadsrc15]], i32 addrspace(1)* [[gepdst15]], align 4

; CHECK: br label %[[cmp]]
