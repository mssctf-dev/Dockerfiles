#!/bin/sh

/usr/lib/judger/libjudger.so \
    --exe_path=/usr/bin/g++ \
    --max_cpu_time=10000 \
    --max_real_time=20000 \
    --max_memory=134217728 \
    --max_stack=134217728 \
    --max_process_number=-1 \
    --max_output_size=1048576 \
    --log_path=/opt/compile/run.log \
    --error_path=/opt/compile/error.log \
    --args="-DONLINE_JUDGE" \
    --args="-O2" --args="-w" \
    --args="-fmax-errors=3" --args="-std=c++17" \
    --args="/opt/compile/main.cpp" \
    --args="-lm" --args="-o" --args="/opt/run/main" \
    --env="PATH=$PATH" \
    --uid=0 \
    --gid=0 > /opt/compile/result.log

[ ! -f "/opt/run/main" ] && exit; # compile error

[[ -z "$TIME_LIM" ]] && TIME_LIM=10000
REAL_TIME=$(expr $TIME_LIM \* 2)
[[ -z "$MEM_LIM" ]] && MEM_LIM=134217728
[[ -z "$STACK_LIM" ]] && STACK_LIM=134217728

mkdir /opt/run/outputs

for f in /opt/inputs/*
do
    /usr/lib/judger/libjudger.so \
        --exe_path=/opt/run/main \
        --max_cpu_time=$TIME_LIM \
        --max_real_time=$REAL_TIME \
        --max_memory=$MEM_LIM \
        --max_stack=$STACK_LIM \
        --max_process_number=-1 \
        --max_output_size=1073741824 \
        --log_path=/opt/run/run.log \
        --input_path=$f \
        --error_path=/opt/run/error.log \
        --output_path=/opt/run/outputs/$(basename $f .in).out \
        --uid=1000 \
        --gid=1000 > /opt/run/outputs/$(basename $f .in).log
done
