#!/bin/bash
# Run sequencer movie
./home/ue4/project/SubwaySequencer.sh -FullStdOutLogOutput -csvGpuStats -RenderOffScreen -nosound -stdout -Vulkan &&
# Create SVG from frame time stats
./CSVToSVG/CSVToSVG -csvDir /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV -o output/$HOSTNAME-times.svg -stats FrameTime\;RenderThreadTime\;GameThreadTime\;GPUTime\;RHIThreadTime -smooth -showaverages -skipRows 100 &&
# Create SVG from system memory stats
./CSVToSVG/CSVToSVG -csvDir /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV -o output/$HOSTNAME-memory.svg -stats MemoryFreeMB\;PhysicalUsedMB\;VirtualUsedMB -smooth -showaverages -skipRows 100 &&
# Rename CSV File
mv /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV/*.csv /home/ue4/project/SubwaySequencer/Saved/Profiling/CSV/$HOSTNAME.csv
# Copy CSV and SVGs to output folder
cp ./home/ue4/project/SubwaySequencer/Saved/Profiling/CSV/$HOSTNAME.csv ./output
cp -r ./svg ./output