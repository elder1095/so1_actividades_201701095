#! /bin/bash
# /usr/bin/env bash
# echo "Hola Mundo!"

set -o errexit
set -o nounset
set -o pipefail

# Verificar si se proporcionó un argumento
if [ $# -eq 0 ]; then
  echo "Error: Se requiere un nombre de usuario como argumento."
  exit 1
fi

# Asignar el primer argumento a una variable
GITHUB_USER="$1"

# Agregamos el valor del parametro a nuestra URL
url="https://api.github.com/users/$GITHUB_USER"

# Hacer la solicitud a la API usando curl y guardar la respuesta en una variable
res=$(curl -s -X GET $url)

# Verificar si hubo algún error en la solicitud
if [ $? -ne 0 ]; then
  echo "Error: No se pudo conectar a la API de GitHub."
  exit 1
fi

# Imprimiendo saludo
# echo "Hola $GITHUB_USER"

# -------------- RESULTADO ID --------------------
# Filtrando con el comando grep el contenido de la variable res
# Utilizando bandera -w para no obtener resultados parciales y guardando en variables "id"
id=$(echo "$res" | grep -w id )

# Eliminando las comas en el resultado (tenia una al final de la linea)
# Guardando el resultado en la nueva variable User_ID
User_ID="${id//,}"

# Eliminando tabulaciones o espacios al inicio de la cadena
User_ID=$(echo "$User_ID"| sed 's/^[ \t]*//')

# Eliminando "id" de la salida y reemplazandolo con User ID
# echo "${User_ID/\"id\"/User ID}" # Resultado

# -------------- RESUTADO CREATED_AT----------------
# Filtrando con el comando grep el contenido de la variable res
# Utilizando bandera -w para no obtener resultados parciales y guardando en variables "created"
created=$(echo "$res" | grep -w created_at )

# Eliminando las comas en el resultado (tenia una al final de la linea)
# Guardando el resultado en la nueva variable Created_at
Created_at="${created//,}"

# Eliminando tabulaciones o espacios al inicio de la cadena
Created_at=$(echo "$Created_at"| sed 's/^[ \t]*//')

# Eliminando "id" de la salida y reemplazandolo con User ID
# echo "${Created_at/\"created_at\"/Cuenta fue creada el}" # Resultado

#------------- CREANDO ARCHIVO EN TMP -----------------------
# Obteniendo fecha del dia actual
dia_actual=$(date +"%d")

# Creando el directorio
mkdir -p /tmp/$dia_actual

# Creando variable que albergue la direccion completa
direccion="/tmp/$dia_actual/saludos.log"

# Escribiendo en el archivo
echo "Hola $GITHUB_USER" > $direccion
echo "${User_ID/\"id\"/User ID}" >> $direccion
echo "${Created_at/\"created_at\"/Cuenta fue creada el}" >> $direccion