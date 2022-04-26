
; RUN: clspv-opt --passes=replace-opencl-builtin %s -o %t.ll
; RUN: FileCheck %s < %t.ll

; AUTO-GENERATED TEST FILE
; This test was generated by sub_sat_test_gen.cpp.
; Please modify the that file and regenerate the tests to make changes.

target datalayout = "e-p:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "spir-unknown-unknown"

define <3 x i8> @sub_sat_char3(<3 x i8> %a, <3 x i8> %b) {
entry:
 %call = call <3 x i8> @_Z7sub_satDv3_cS_(<3 x i8> %a, <3 x i8> %b)
 ret <3 x i8> %call
}

declare <3 x i8> @_Z7sub_satDv3_cS_(<3 x i8>, <3 x i8>)

; CHECK: [[sext_a:%[a-zA-Z0-9_.]+]] = sext <3 x i8> %a to <3 x i16>
; CHECK: [[sext_b:%[a-zA-Z0-9_.]+]] = sext <3 x i8> %b to <3 x i16>
; CHECK: [[sub:%[a-zA-Z0-9_.]+]] = sub nuw nsw <3 x i16> [[sext_a]], [[sext_b]]
; CHECK: [[clamp:%[a-zA-Z0-9_.]+]] = call <3 x i16> @_Z5clampDv3_sS_S_(<3 x i16> [[sub]], <3 x i16> <i16 -128, i16 -128, i16 -128>, <3 x i16> <i16 127, i16 127, i16 127>)
; CHECK: [[trunc:%[a-zA-Z0-9_.]+]] = trunc <3 x i16> [[clamp]] to <3 x i8>
; CHECK: ret <3 x i8> [[trunc]]
