#FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
#WORKDIR /app
#COPY *.csproj ./
#RUN dotnet restore
#COPY . .
#RUN dotnet build CRM.sln -c Release --no-restore
#RUN dotnet publish CRM.sln -c Release -o out
#FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS runtime
#WORKDIR /app
#COPY --from=build /app/out .
#EXPOSE 80
#ENTRYPOINT ["dotnet", "CRM.dll"]
#---------------------------------------
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . .
RUN dotnet build -c Release --no-restore
RUN dotnet publish -c Release -o out
FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS runtime
WORKDIR /app
COPY --from=build /app/out .
EXPOSE 80
EXPOSE 5001
EXPOSE 44351
ENTRYPOINT ["dotnet", "CRM.dll"]