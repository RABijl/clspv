// RUN: clspv %s -o %t.spv
// RUN: spirv-dis -o %t2.spvasm %t.spv
// RUN: FileCheck %s < %t2.spvasm
// RUN: spirv-val --target-env vulkan1.0 %t.spv

void kernel __attribute__((reqd_work_group_size(1, 1, 1))) foo(global int3* a, global float3* b, int i)
{
  ((global int3*)b)[i] = *a;
}
// CHECK:  [[_uint:%[0-9a-zA-Z_]+]] = OpTypeInt 32 0
// CHECK:  [[_v4uint:%[0-9a-zA-Z_]+]] = OpTypeVector [[_uint]] 4
// CHECK:  [[_float:%[0-9a-zA-Z_]+]] = OpTypeFloat 32
// CHECK:  [[_v4float:%[0-9a-zA-Z_]+]] = OpTypeVector [[_float]] 4
// CHECK:  [[_28:%[0-9a-zA-Z_]+]] = OpLoad [[_v4uint]]
// CHECK:  [[_29:%[0-9a-zA-Z_]+]] = OpBitcast [[_v4float]] [[_28]]
// CHECK:  OpStore {{.*}} [[_29]]
