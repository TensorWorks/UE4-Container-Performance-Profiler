# UE4 Container Performance Profiler

A ue4 performance profiler

## Docker Hub
https://hub.docker.com/r/belchy06/sequence_profiler

## Windows
You can run the profiler through the windows docker-compose file with the following command: \

`$env:SOURCE="c:/Directory/For/Output/Files"; docker-compose up --scale profiler=N`

Replace the `SOURCE` value with the directory in which you want the output files to be located
Repalce the `N` arguments with the number of profilers you want to run simultaneously