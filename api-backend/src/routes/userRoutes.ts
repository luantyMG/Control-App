import bcrypt from 'bcryptjs';
import { Router, Request, Response } from 'express';
import prisma from '../prismaClient'; 
import jwt from 'jsonwebtoken';
import dotenv from 'dotenv';
import multer from 'multer';
import path from 'path';


dotenv.config();

const router = Router();
const JWT_SECRET = process.env.JWT_SECRET || 'clave_por_defecto_si_no_hay_env';

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, path.join(__dirname, '../../uploads'));
  },
  filename: (req, file, cb) => {
    const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
    const extension = path.extname(file.originalname);
    cb(null, file.fieldname + '-' + uniqueSuffix + extension);
  },
});

const upload = multer({ storage });

interface MulterFile {
  fieldname: string;
  originalname: string;
  encoding: string;
  mimetype: string;
  size: number;
  destination: string;
  filename: string;
  path: string;
  buffer?: Buffer;
}

interface MulterRequest extends Request {
  file?: Express.Multer.File;
}

// GET /users
router.get('/', async (req, res) => {
  try {
    const users = await prisma.user.findMany({
      select: {
        id: true,
        name: true,
        email: true,
        createdAt: true,
        profileImageUrl: true,
        role: { select: { id: true, name: true } },
        student: {
          select: {
            id: true,
            groupId: true,
            group: {
              select: {
                id: true,
                name: true,
                career: { select: { id: true, name: true } },
                campus: { select: { id: true, name: true, municipio: true, estado: true } },
              },
            },
          },
        },
      },
    });

    res.json(users);
  } catch (error) {
    console.error('Error al obtener usuarios:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// POST /users
router.post('/', async (req, res) => {
  const { name, email, password } = req.body;
  if (!name || !email || !password)
    return res.status(400).json({ error: 'Faltan campos requeridos' });

  try {
    const existingUser = await prisma.user.findUnique({ where: { email } });
    if (existingUser)
      return res.status(409).json({ error: 'El email ya está registrado' });

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = await prisma.user.create({
      data: { name, email, password: hashedPassword },
    });

    res.status(201).json({
      message: 'Usuario creado',
      user: {
        id: newUser.id,
        name: newUser.name,
        email: newUser.email,
        createdAt: newUser.createdAt,
      },
    });
  } catch (error) {
    console.error('Error creando usuario:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// POST /users/login
router.post('/login', async (req, res) => {
  const { email, password } = req.body;
  if (!email || !password)
    return res.status(400).json({ error: 'Faltan campos requeridos' });

  try {
    const user = await prisma.user.findUnique({
      where: { email },
      select: {
        id: true,
        name: true,
        email: true,
        password: true,
        createdAt: true,
        profileImageUrl: true,
        role: { select: { id: true, name: true } },
        student: {
          select: {
            id: true,
            groupId: true,
            group: {
              select: {
                id: true,
                name: true,
                career: { select: { id: true, name: true } },
                campus: { select: { id: true, name: true, municipio: true, estado: true } },
              },
            },
          },
        },
        studentLinks: {
          select: {
            student: {
              select: {
                id: true,
                user: { select: { id: true, name: true, email: true } },
                group: {
                  select: {
                    id: true,
                    name: true,
                    career: { select: { id: true, name: true } },
                    campus: { select: { id: true, name: true, municipio: true, estado: true } },
                  },
                },
              },
            },
          },
        },
        teacher: {
          select: {
            id: true,
            campus: { select: { id: true, name: true, municipio: true, estado: true } },
          },
        },
        staff: {
          select: {
            id: true,
            campus: { select: { id: true, name: true, municipio: true, estado: true } },
          },
        },
      },
    });

    if (!user) return res.status(401).json({ error: 'Usuario no encontrado' });

    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) return res.status(401).json({ error: 'Contraseña incorrecta' });

    const token = jwt.sign({ userId: user.id, email: user.email }, JWT_SECRET, { expiresIn: '1h' });

    const { password: _, ...userWithoutPassword } = user;

    res.json({ message: 'Login exitoso', token, user: userWithoutPassword });
  } catch (error) {
    console.error('Error en login:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
});

// POST /users/upload-profile-image/:userId
router.post(
  '/upload-profile-image/:userId',
  upload.single('profileImage'),
  async (req, res) => {
    try {
      const userId = Number(req.params.userId);

      if (!req.file)
        return res.status(400).json({ error: 'No se subió ningún archivo' });

      // Construimos URL completa para la imagen
      const protocol = req.protocol; // 'http'
      const host = req.get('host');  // '192.168.100.43:4000'

      const imageUrl = `${protocol}://${host}/uploads/${req.file.filename}`;

      const updatedUser = await prisma.user.update({
        where: { id: userId },
        data: { profileImageUrl: imageUrl },
      });

      res.json({
        message: 'Imagen subida con éxito',
        user: {
          id: updatedUser.id,
          name: updatedUser.name,
          email: updatedUser.email,
          profileImageUrl: updatedUser.profileImageUrl,
        },
      });
    } catch (error) {
      console.error('Error al subir imagen:', error);
      res.status(500).json({ error: 'Error en el servidor' });
    }
  }
);



export default router;
