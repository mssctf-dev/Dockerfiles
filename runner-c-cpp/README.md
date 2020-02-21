## environment variables

|env variable|explaination|
|:-:|:-:|
|TIME_LIM|time limit in miliseconds, default 10000|
|MEM_LIM|memory limit in bytes, default 134217728|
|STACK_LIM|stack limit in bytes, default 128MB|

## mount points

/opt/inputs must be filled with judge cases.
/opt/compile/main.cpp will be compiled to /opt/run/main
/opt/run/outputs/*.log shows the execution data for each judge case
/opt/run/outputs/*.out shows the program output for each judge case

/opt/inputs should better be readonly
