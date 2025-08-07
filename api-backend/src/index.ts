import dotenv from 'dotenv';

// Carga variables desde .env si NO estás en producción
if (process.env.NODE_ENV !== 'production') {
  dotenv.config(); // Por defecto busca .env
}

import express from 'express';
import path from 'path';
import multer from 'multer';
import userRoutes from './routes/userRoutes';

const app = express();

const isProduction = process.env.NODE_ENV === 'production';

console.log(`🧠 Ambiente: ${isProduction ? 'Producción' : 'Desarrollo'}`);
console.log(`🔌 Conectando a la base de datos: ${process.env.DATABASE_URL}`);

// Verificar que DATABASE_URL esté definida
if (!process.env.DATABASE_URL) {
  console.error('❌ Error: DATABASE_URL no está definida');
  process.exit(1);
}

// Middleware para parsear JSON
app.use(express.json());

// Servir archivos estáticos de la carpeta uploads (ajusta la ruta según tu estructura)
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

// Configuración multer para guardar en /uploads
const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../uploads'));
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
    const extension = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + extension);
  },
});
export const upload = multer({ storage });

// Rutas
app.use('/users', userRoutes);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
});
