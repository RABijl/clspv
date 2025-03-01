// RUN: clspv %s -o %t.spv
// RUN: spirv-dis %t.spv -o %t.spvasm
// RUN: FileCheck %s < %t.spvasm
// RUN: spirv-val --target-env vulkan1.0 %t.spv

kernel void foo(global ushort4* a, global ushort4* b) {
  *a = popcount(*b);
}

// CHECK: [[int:%[a-zA-Z0-9_]+]] = OpTypeInt 32 0
// CHECK: [[short:%[a-zA-Z0-9_]+]] = OpTypeInt 16 0
// CHECK: [[short4:%[a-zA-Z0-9_]+]] = OpTypeVector [[short]] 4
// CHECK: [[int4:%[a-zA-Z0-9_]+]] = OpTypeVector [[int]] 4
// CHECK: [[ld:%[a-zA-Z0-9_]+]] = OpLoad [[short4]]
// CHECK: [[convert:%[a-zA-Z0-9_]+]] = OpUConvert [[int4]] [[ld]]
// CHECK: [[cnt:%[a-zA-Z0-9_]+]] = OpBitCount [[int4]] [[convert]]
// CHECK: [[res:%[a-zA-Z0-9_]+]] = OpUConvert [[short4]] [[cnt]]
// CHECK: OpStore {{.*}} [[res]]
