#!/bin/bash
# Run sequencer movie
./home/ue4/project/SubwaySequencer.sh -FullStdOutLogOutput -csvGpuStats -RenderOffScreen -Vulkan -nosound &&
# Create SVG from frame time stats
./CSVToSVG/CSVToSVG -csvDir /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV -o output/times.svg -stats FrameTime\;RenderThreadTime\;GameThreadTime\;GPUTime\;RHIThreadTime -smooth -showaverages -skipRows 100 &&
# Create SVG from system memory stats
./CSVToSVG/CSVToSVG -csvDir /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV -o output/memory.svg -stats MemoryFreeMB\;PhysicalUsedMB\;VirtualUsedMB -smooth -showaverages -skipRows 100 &&
# Copy CSV to output folder
cp -r ./home/ue4/project/SubwaySequencer/Saved/Profiling/CSV ./output