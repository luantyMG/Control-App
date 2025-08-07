import dotenv from 'dotenv';
dotenv.config(); // Siempre carga el archivo .env

import express from 'express';
import path from 'path';
import multer from 'multer';
import userRoutes from './routes/userRoutes';

const app = express();

// Revisa el entorno
const nodeEnv = process.env.NODE_ENV || 'development';
const isProduction = nodeEnv === 'production';

console.log(`🧠 Ambiente: ${isProduction ? 'Producción' : 'Desarrollo'}`);
console.log(`🔌 Conectando a la base de datos: ${process.env.DATABASE_URL}`);

// Validaciones
if (!process.env.DATABASE_URL) {
  console.error('❌ Error: DATABASE_URL no está definida en el archivo .env');
  process.exit(1);
}

if (!process.env.JWT_SECRET) {
  console.error('❌ Error: JWT_SECRET no está definida en el archivo .env');
  process.exit(1);
}

// Middleware
app.use(express.json());

// Archivos estáticos
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

// Configuración de multer
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

// Puerto
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
});
