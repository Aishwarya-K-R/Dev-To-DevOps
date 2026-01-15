# -------- Build stage --------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["LSQ.csproj", "./"]
RUN dotnet restore

COPY . .
RUN dotnet publish "LSQ.csproj" -c Release -o /app/publish

# -------- Runtime stage --------
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:5248

COPY --from=build /app/publish .

EXPOSE 5248
ENTRYPOINT ["dotnet", "LSQ.dll"]
