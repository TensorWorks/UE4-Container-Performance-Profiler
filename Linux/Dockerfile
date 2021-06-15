FROM mcr.microsoft.com/dotnet/core/sdk:5.0.100-preview.3-focal AS build-env

WORKDIR /app

ADD /CSVToSVG/*.csproj .
RUN dotnet restore

ADD /CSVToSVG .
RUN dotnet publish \
    -c Release \
    -o ./output


# Copy the packaged files into a runtime container image that doesn't include any Unreal Engine components
FROM adamrehn/ue4-runtime:20.04-vulkan
# Copy CSVToSVG
COPY --from=build-env /app/output ./CSVToSVG
# Copy UE4 project
COPY --chown=ue4:ue4 ./LinuxNoEditor /home/ue4/project
# Copy start script
COPY --chown=ue4:ue4 ./start.sh .

# Create output folder for SVG images
USER root
RUN ["mkdir", "output"]


# Allow CSVToSVG to write images to output folder
RUN ["chmod", "ugo+rwx", "/output"]

# Switch user as UE4 won't run application as root
USER ue4
# Give executions permissions
RUN ["chmod", "+x", "/home/ue4/project/SubwaySequencer.sh"]
RUN ["chmod", "+x", "/start.sh"]
ENTRYPOINT ["./start.sh"]