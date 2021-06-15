# Copy the packaged files into a runtime container image that doesn't include any Unreal Engine components
FROM registry.gitlab.com/tensorworks/client-projects/epic-games/pixel-streaming/container-images:windows-gpu-21h1-full

# Copy UE4 Project
COPY ./WindowsNoEditor /home/ue4/project
# Copy UE4 CSV to SVG tool
COPY ./CSVToSVG ./CSVToSVG
# Copy start script
COPY ./start.bat .
# Create the output directory
RUN mkdir "svg"
RUN mkdir "output"
# Set the start script as the container's entrypoint
ENTRYPOINT ["start.bat"]
