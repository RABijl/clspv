
; RUN: clspv-opt --passes=replace-opencl-builtin %s -o %t.ll
; RUN: FileCheck %s < %t.ll

; AUTO-GENERATED TEST FILE
; This test was generated by add_sat_test_gen.cpp.
; Please modify the that file and regenerate the tests to make changes.

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

define <4 x i64> @rhadd_ulong4(<4 x i64> %a, <4 x i64> %b) {
entry:
 %call = call <4 x i64> @_Z5rhaddDv4_mS_(<4 x i64> %a, <4 x i64> %b)
 ret <4 x i64> %call
}

declare <4 x i64> @_Z5rhaddDv4_mS_(<4 x i64>, <4 x i64>)

; CHECK: [[a_shr:%[a-zA_Z0-9_.]+]] = lshr <4 x i64> %a, <i64 1, i64 1, i64 1, i64 1>
; CHECK: [[b_shr:%[a-zA-Z0-9_.]+]] = lshr <4 x i64> %b, <i64 1, i64 1, i64 1, i64 1>
; CHECK: [[add:%[a-zA-Z0-9_.]+]] = add <4 x i64> [[a_shr]], [[b_shr]]
; CHECK: [[join:%[a-zA-Z0-9_.]+]] = or <4 x i64> %a, %b
; CHECK: [[and:%[a-zA-Z0-9_.]+]] = and <4 x i64> [[join]], <i64 1, i64 1, i64 1, i64 1>
; CHECK: [[hadd:%[a-zA-Z0-9_.]+]] = add <4 x i64> [[add]], [[and]]
; CHECK: ret <4 x i64> [[hadd]]
