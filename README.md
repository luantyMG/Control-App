🎓 App de Control Escolar
Aplicación móvil para estudiantes, tutores, docentes, administrativos

Desarrollada con React Native + Expo (frontend) y Node.js con Express + PostgreSQL (backend)
_______________________________________________________________________________________
📱 Descripción
Control Escolar es una app multiplataforma que permite gestionar información escolar desde el móvil.

Incluye inicio de sesión, navegación por pestañas, temas claro/oscuro, y módulos como calificaciones, horarios, biblioteca y más.
_______________________________________________________________________________________
🚀 Tecnologías Usadas

🧩 Frontend – Expo React Native

⚛️ React Native + Expo Router

🎨 Context API para manejo de temas (light / dark)

🧠 Hooks personalizados

📱 Navegación por Tabs con íconos (MaterialCommunityIcons, FontAwesome5)

💾 AsyncStorage para preferencias del usuario

✨ Animaciones y haptics
_______________________________________________________________________________________
🔙 Backend – Node.js + Express
🛠️ Express.js – API RESTful

🐘 PostgreSQL – Base de datos relacional

🔐 JWT / Auth – Manejo seguro de sesiones

🧬 Prisma – ORM para manipular la base de datos

🔒 bcryptjs para encriptar contraseñas

🧑‍🎓 Funcionalidades actuales
📲 Frontend (App móvil)
🏠 Pantalla de inicio personalizada

Datos del usuario (nombre, carrera, rol)

Acceso rápido a módulos
_______________________________________________________________________________________
🧭 Navegación por pestañas

Home – Módulo principal

Noticias – Comunicados escolares

Perfil – Datos y configuración
_______________________________________________________________________________________
🎨 Soporte de temas dinámicos

Tema claro u oscuro según el sistema o preferencia del usuario

Persistencia con AsyncStorage
_______________________________________________________________________________________
🔐 Autenticación

Redirección a /login si no hay token

Loader mientras se carga el estado de sesión


_____________________________________________________________________________________


📁 Estructura del frontend (React Native)

📦 app/

├── 📁 screens/

│   ├── index.tsx            → Pantalla de inicio

│   ├── news.tsx             → Noticias

│   └── perfil.tsx           → Perfil de usuario

├── 📁 components/

│   ├── CardButton/          → Botones personalizados con imagen

│   ├── ui/                  → Íconos y fondo de TabBar

├── 📁 context/

│   ├── ThemeContext/        → Lógica para tema claro/oscuro

│   └── AuthContext/         → Manejo de token y sesión

└── tabs/
    └── _layout.tsx          → Configuración de navegación por pestañas

_____________________________________________________________________________________

    
🔭 Próximamente
 Subida de documentos 📄

 Notificaciones push 🔔

 Calificaciones por materia 📚

 Módulo de seguimiento académico 📈

 Control de asistencia 📋

 Soporte offline 🌐

 Multiplataforma: Web y tablet 💻📱

_____________________________________________________________________________________

 👨‍💻 Desarrollado por 
 
Luis Alberto Montejo Garcia
