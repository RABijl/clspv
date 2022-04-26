; RUN: clspv-opt %s -o %t --passes=replace-pointer-bitcast
; RUN: FileCheck %s < %t

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

; CHECK: [[shl:%[a-zA-Z0-9_.]+]] = shl i32 %i, 2
; CHECK: [[gep:%[a-zA-Z0-9_.]+]] = getelementptr float, float addrspace(1)* %a, i32 [[shl]]
; CHECK: [[ld0:%[a-zA-Z0-9_.]+]] = load float, float addrspace(1)* [[gep]]
; CHECK: [[add0:%[a-zA-Z0-9_.]+]] = add i32 [[shl]], 1
; CHECK: [[gep:%[a-zA-Z0-9_.]+]] = getelementptr float, float addrspace(1)* %a, i32 [[add0]]
; CHECK: [[ld1:%[a-zA-Z0-9_.]+]] = load float, float addrspace(1)* [[gep]]
; CHECK: [[add1:%[a-zA-Z0-9_.]+]] = add i32 [[add0]], 1
; CHECK: [[gep:%[a-zA-Z0-9_.]+]] = getelementptr float, float addrspace(1)* %a, i32 [[add1]]
; CHECK: [[ld2:%[a-zA-Z0-9_.]+]] = load float, float addrspace(1)* [[gep]]
; CHECK: [[add2:%[a-zA-Z0-9_.]+]] = add i32 [[add1]], 1
; CHECK: [[gep:%[a-zA-Z0-9_.]+]] = getelementptr float, float addrspace(1)* %a, i32 [[add2]]
; CHECK: [[ld3:%[a-zA-Z0-9_.]+]] = load float, float addrspace(1)* [[gep]]
; CHECK: [[in0:%[a-zA-Z0-9_.]+]] = insertelement <4 x float> undef, float [[ld0]], i32 0
; CHECK: [[in1:%[a-zA-Z0-9_.]+]] = insertelement <4 x float> [[in0]], float [[ld1]], i32 1
; CHECK: [[in2:%[a-zA-Z0-9_.]+]] = insertelement <4 x float> [[in1]], float [[ld2]], i32 2
; CHECK: [[in3:%[a-zA-Z0-9_.]+]] = insertelement <4 x float> [[in2]], float [[ld3]], i32 3
; CHECK: bitcast <4 x float> [[in3]] to <4 x i32>
define spir_kernel void @foo(float addrspace(1)* %a, <4 x i32> addrspace(1)* %b, i32 %i) {
entry:
  %0 = bitcast float addrspace(1)* %a to <4 x i32> addrspace(1)*
  %arrayidx = getelementptr inbounds <4 x i32>, <4 x i32> addrspace(1)* %0, i32 %i
  %1 = load <4 x i32>, <4 x i32> addrspace(1)* %arrayidx, align 8
  store <4 x i32> %1, <4 x i32> addrspace(1)* %b, align 8
  ret void
}


