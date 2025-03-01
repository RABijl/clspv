// Copyright 2022 The Clspv Authors. All rights reserved.
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

#include "llvm/IR/DataLayout.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"

#ifndef _CLSPV_LIB_BITCAST_UTILS_PASS_H
#define _CLSPV_LIB_BITCAST_UTILS_PASS_H

using namespace llvm;

namespace BitcastUtils {

size_t SizeInBits(const DataLayout &DL, Type *Ty);
size_t SizeInBits(IRBuilder<> &builder, Type *Ty);

Type *GetEleType(Type *Ty);
unsigned GetNumEle(Type *Ty);

void ExtractFromArray(IRBuilder<> &Builder, SmallVector<Value *, 8> &Values);
void ExtractFromVector(IRBuilder<> &Builder, SmallVector<Value *, 8> &Values);
void BitcastIntoVector(IRBuilder<> &Builder, SmallVector<Value *, 8> &Values,
                       unsigned NumElePerVec, Type *Ty);
void ConvertInto(Type *Ty, IRBuilder<> &Builder,
                 SmallVector<Value *, 8> &Values);

bool RemovedCstExprFromFunction(Function *F);
} // namespace BitcastUtils

#endif // _CLSPV_LIB_BITCAST_UTILS_PASS_H
