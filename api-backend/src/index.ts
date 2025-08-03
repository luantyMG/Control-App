import dotenv from 'dotenv';
dotenv.config(); // Carga variables desde .env en desarrollo

import express from 'express';
import userRoutes from './routes/userRoutes';

const app = express();

const isProduction = process.env.NODE_ENV === 'production';

console.log(`🧠 Ambiente: ${isProduction ? 'Producción' : 'Desarrollo'}`);
console.log(`🔌 Conectando a la base de datos: ${process.env.DATABASE_URL}`);

app.use(express.json());
app.use('/users', userRoutes);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`🚀 Servidor corriendo en puerto ${PORT}`);
});
