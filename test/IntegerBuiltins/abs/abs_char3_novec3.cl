// RUN: clspv  %s -o %t.spv -int8 -vec3-to-vec4
// RUN: spirv-dis -o %t2.spvasm %t.spv
// RUN: FileCheck %s < %t2.spvasm
// RUN: spirv-val --target-env vulkan1.0 %t.spv

kernel void foo(global uchar3* a, global char3* b) {
  *a = abs(*b);
}

// CHECK: [[char:%[a-zA-Z0-9_]+]] = OpTypeInt 8 0
// CHECK: [[char4:%[a-zA-Z0-9_]+]] = OpTypeVector [[char]] 4
// CHECK: [[ld:%[a-zA-Z0-9_]+]] = OpLoad [[char4]]
// CHECK: [[abs:%[a-zA-Z0-9_]+]] = OpExtInst [[char4]] {{.*}} SAbs [[ld]]
// CHECK: OpStore {{.*}} [[abs]]
