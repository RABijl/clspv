// Copyright 2018 The Clspv Authors. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef CLSPV_LIB_CONSTANTS_H_
#define CLSPV_LIB_CONSTANTS_H_

#include "clspv/AddressSpace.h"
#include <string>

namespace clspv {

// Name for module level metadata storing workgroup argument spec ids.
const std::string &LocalSpecIdMetadataName();

enum ClspvOperand {
  // Operands for workgroup variables.
  kWorkgroupSpecId = 0,
  kWorkgroupDataType = 1,

  // Operands for resource variables.
  kResourceDescriptorSet = 0,
  kResourceBinding = 1,
  kResourceArgKind = 2,
  kResourceArgIndex = 3,
  kResourceDiscriminantIndex = 4,
  kResourceCoherent = 5,
  kResourceDataType = 6,

  // Operands for literal samplers.
  kSamplerDescriptorSet = 0,
  kSamplerBinding = 1,
  kSamplerParams = 2,
  kSamplerDataType = 3,
};

// Base name for workgroup variable accessor function.
const std::string &WorkgroupAccessorFunction();

// Base name for resource variable accessor function.
const std::string &ResourceAccessorFunction();

// Name for module level metadata storing UBO remapped type offsets.
const std::string &RemappedTypeOffsetMetadataName();

// Name for module level metadata storing UBO remapped type sizes.
const std::string &RemappedTypeSizesMetadataName();

// Name of the function used to encode literal samplers
const std::string &LiteralSamplerFunction();

// Name of the function used for composite construct
const std::string &CompositeConstructFunction();

// Name of the clspv builtin used for register packing (specifically v2f16)
const std::string &PackFunction();

// Name of the clspv builtin used for register unpacking (specifically v2f16)
const std::string &UnpackFunction();

// Name of the clspv builtin for copy_memory
const std::string &CopyMemoryFunction();

// Base name for SPIR-V intrinsic functions
const std::string &SPIRVOpIntrinsicFunction();

// Name of the literal sampler initializer function.
inline std::string TranslateSamplerInitializerFunction() {
  return "__translate_sampler_initializer";
}

// Name of the global variable storing all push constants
inline std::string PushConstantsVariableName() { return "__push_constants"; }

// Name for module level metadata storing push constant indices.
inline std::string PushConstantsMetadataName() { return "push_constants"; }

// Name for the function level metadata storing association between argument
// ordinal and push constant offset for image channel getter functions.
inline std::string PushConstantsMetadataImageChannelName() {
  return "push_constants_image_channel";
}

// Name for the call level metadata storing the offset in the push constants
// variable.
inline std::string ImageGetterPushConstantOffsetName() {
  return "image_getter_push_constant_offset";
}

// Name for module level metadata storing next spec constant id.
inline std::string NextSpecConstantMetadataName() {
  return "clspv.next_spec_constant_id";
}

// Name for module level metadata store list of allocated spec constants.
inline std::string SpecConstantMetadataName() {
  return "clspv.spec_constant_list";
}

// Pod args implementation metadata name.
inline std::string PodArgsImplMetadataName() { return "clspv.pod_args_impl"; }

// Clustered arguments mapping metadata name.
inline std::string KernelArgMapMetadataName() { return "kernel_arg_map"; }

// Clustered constants global variable name.
inline std::string ClusteredConstantsVariableName() {
  return "clspv.clustered_constants";
}

inline std::string LocalInvocationIdVariableName() {
  return "__spirv_LocalInvocationId";
}

inline AddressSpace::Type LocalInvocationIdAddressSpace() {
  return AddressSpace::Input;
}

inline std::string WorkgroupSizeVariableName() {
  return "__spirv_WorkgroupSize";
}

inline AddressSpace::Type WorkgroupSizeAddressSpace() {
  return AddressSpace::ModuleScopePrivate;
}

inline unsigned int SPIRVMaxVectorSize() { return 4; }

} // namespace clspv

#endif
