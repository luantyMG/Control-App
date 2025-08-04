#!/bin/bash

set -e  # Detiene el script si ocurre un error

# Cargar datos desde .env.development
LOCAL_DB_URL=$(grep DATABASE_URL .env.development | cut -d '=' -f2- | tr -d '"')

# Cargar datos desde .env.production
RAILWAY_DB_URL=$(grep DATABASE_URL .env.production | cut -d '=' -f2- | tr -d '"')

echo "🔄 Realizando backup desde base de datos local..."
pg_dump "$LOCAL_DB_URL" > dump.sql

if [ $? -ne 0 ]; then
  echo "❌ Error al hacer backup de la base de datos local."
  exit 1
fi

echo "✅ Backup exitoso."

echo "🚀 Restaurando backup en Railway..."
psql "$RAILWAY_DB_URL" < dump.sql

if [ $? -ne 0 ]; then
  echo "❌ Error al restaurar la base de datos en Railway."
  exit 1
fi

echo "🎉 ¡Backup restaurado en Railway con éxito!"
