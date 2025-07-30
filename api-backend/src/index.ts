import express from 'express';
import userRoutes from './routes/userRoutes'; // o donde tengas el archivo de rutas

const app = express();

app.use(express.json()); // para que express entienda JSON

app.use('/users', userRoutes); // monta las rutas de usuarios en /users

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Servidor corriendo en puerto ${PORT}`);
});
