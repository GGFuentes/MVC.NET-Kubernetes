#La imagen se agrege al container from
FROM  mcr.microsoft.com/dotnet/aspnet:5.0 AS base
#Se almacená en la carpeta
WORKDIR /app
#Habrá comunicación con ese container por el puerto 9001
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

#Agregar el código fuente de mi proyecto
COPY "MVCPrototipo.csproj" .
#Restaura e installa los paquetes nuget del proyecto que necesita para funcionar
RUN dotnet restore "MVCPrototipo.csproj"
#Copia todos los archivos
COPY . .
#Generar los dlls del proyecto o publicar el proyecto y quiero que los resultados se copien al conteiner en la carpeta build
RUN dotnet build . -c Release -o /app/build

#Me baso en el SDK para crear una versión pública
FROM build AS publish
#Compilación de tipo realease y quiero que se almacene en la carpeta publish 
RUN dotnet publish "MVCPrototipo.csproj" -c Release -o /app/publish

#Agregar al runtime dentro de la carpeta publish
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
#Crear la comunicación con el cliente entre la aplicación dentro del container
ENTRYPOINT [ "dotnet","MVCPrototipo.dll" ]