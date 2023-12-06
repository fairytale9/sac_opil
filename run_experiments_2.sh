# Copyright 2023 The Google Research Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

declare -a env_names=("InvertedPendulum-v2" "Swimmer-v2")
declare -a algos=("dac")

expert_dir="./sac_opil/datasets/"
save_dir="./sac_opil/save/"

for algo in "${algos[@]}"
do
  for env_name in "${env_names[@]}"
  do
    for ((seed=0;seed<4;seed+=1))
    do
      python -m sac_opil.train_eval \
        --expert_dir $expert_dir \
        --save_dir $save_dir \
        --algo $algo \
        --env_name $env_name \
        --seed $seed \
        --num_trajectories 10 \
        --alsologtostderr
    done
  done
done
