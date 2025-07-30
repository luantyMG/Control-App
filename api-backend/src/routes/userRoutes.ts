import bcrypt from 'bcryptjs';
import { Router } from 'express';
import prisma from '../prismaClient'; // importa tu instancia de Prisma configurada
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';

dotenv.config(); // carga las variables de entorno desde .env

const router = Router();

const JWT_SECRET = process.env.JWT_SECRET || 'clave_por_defecto_si_no_hay_env';

// Obtener todos los usuarios (sin password)
router.get('/', async (req, res) => {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        createdAt: true,
      }
    });
    res.json(users);
  } catch (error) {
    console.error('Error al obtener usuarios:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// Crear nuevo usuario con contraseña encriptada
router.post('/', async (req, res) => {
  console.log('POST /users recibido con body:', req.body);
  const { name, email, password } = req.body;

  if (!name || !email || !password) {
    return res.status(400).json({ error: 'Faltan campos requeridos' });
  }

  try {
    const existingUser = await prisma.user.findUnique({ where: { email } });
    if (existingUser) {
      return res.status(409).json({ error: 'El email ya está registrado' });
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = await prisma.user.create({
      data: {
        name,
        email,
        password: hashedPassword,
      },
    });

    res.status(201).json({
      message: 'Usuario creado',
      user: {
        id: newUser.id,
        name: newUser.name,
        email: newUser.email,
        createdAt: newUser.createdAt,
      }
    });
  } catch (error) {
    console.error('Error creando usuario:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// Ruta POST /users/login para login con JWT
router.post('/login', async (req, res) => {
  console.log('POST /users/login recibido con body:', req.body);
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ error: 'Faltan campos requeridos' });
  }

  try {
    const user = await prisma.user.findUnique({ where: { email } });
    if (!user) {
      return res.status(401).json({ error: 'Usuario no encontrado' });
    }

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: 'Contraseña incorrecta' });
    }

    // Crear el token JWT
    const token = jwt.sign(
      { userId: user.id, email: user.email }, // payload
      JWT_SECRET,
      { expiresIn: '1h' } // Expira en 1 hora, ajusta a lo que necesites
    );

    res.json({
      message: 'Login exitoso',
      token, // devuelves el token aquí
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        createdAt: user.createdAt,
      }
    });
  } catch (error) {
    console.error('Error en login:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

export default router;
