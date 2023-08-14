# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /app
COPY . ./

# Copy the project files and restore dependencies
#COPY CRM.csproj ./
RUN dotnet restore

# Copy the rest of the application files and build
#COPY . ./
RUN dotnet build -c Release --no-restore
RUN dotnet publish -c Release -o out

# Stage 2: Create the runtime image
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS runtime
WORKDIR /app

# Copy the published files from the build stage
COPY --from=build /app/out .

EXPOSE 80
EXPOSE 5001
ENTRYPOINT ["dotnet", "CRM.dll"]
