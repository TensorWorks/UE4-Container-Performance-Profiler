@REM Run the profiler
/home/ue4/project/SubwaySequencer/Binaries/Win64/SubwaySequencer-Cmd.exe -FullStdOutLogOutput -csvGpuStats -nosound -stdout -RenderOffScreen -unattended
@REM Create time-based svgs
start /wait \CSVToSVG\CSVToSVG.exe -csvDir \home\ue4\project\SubwaySequencer\Saved\Profiling\CSV -o \svg\%COMPUTERNAME%-times.svg -stats FrameTime;RenderThreadTime;GameThreadTime;GPUTime;RHIThreadTime; -smooth -showaverages -skipRows 100
@REM Create memory-based svgs
start /wait \CSVToSVG\CSVToSVG.exe -csvDir \home\ue4\project\SubwaySequencer\Saved\Profiling\CSV -o \svg\%COMPUTERNAME%-memory.svg -stats MemoryFreeMB;PhysicalUsedMB;VirtualUsedMB -smooth -showaverages -skipRows 100
@REM Rename the output CSV to be that of the container name
rename \home\ue4\project\SubwaySequencer\Saved\Profiling\CSV\*.csv %COMPUTERNAME%.csv
@REM Copy the CSV and images to the output folder
Xcopy home\ue4\project\SubwaySequencer\Saved\Profiling\CSV \output  /E /I
Xcopy svg \output  /E /I