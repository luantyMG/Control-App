import React, { createContext, useContext, useEffect, useState } from 'react';
import * as SecureStore from 'expo-secure-store';
import jwtDecode from 'jwt-decode';

//
// TIPOS
//

type User = {
  id: number;
  name: string;
  email: string;
  createdAt: string;
  profileImageUrl?: string; // Agregado si usas url de imagen en user
  role?: {
    id: number;
    name: string;
  };
  student?: {
    id: number;
    groupId: number;
    group: {
      id: number;
      name: string;
      career: {
        id: number;
        name: string;
      };
      campus: {
        id: number;
        name: string;
        municipio: string;
        estado: string;
      };
    };
  };
  teacher?: {
    id: number;
    campus: {
      id: number;
      name: string;
    };
  };
  staff?: {
    id: number;
    campus: {
      id: number;
      name: string;
    };
  };
  studentLinks?: {
    studentId: number;
    student: {
      user: {
        name: string;
      };
    };
  }[];
};

type AuthContextType = {
  token: string | null;
  user: User | null;
  isLoading: boolean;
  login: (token: string, user: User) => Promise<void>;
  logout: () => Promise<void>;
  updateUser: (newUserData: Partial<User>) => void; // <-- Nueva función para actualizar usuario parcialmente
};

type JwtPayload = {
  exp: number;
};

//
// FUNCIONES AUXILIARES
//

const isTokenExpired = (token: string) => {
  try {
    const decoded = jwtDecode<JwtPayload>(token);
    return decoded.exp * 1000 < Date.now();
  } catch {
    return true;
  }
};

//
// CONTEXTO
//

const AuthContext = createContext<AuthContextType>({
  token: null,
  user: null,
  isLoading: true,
  login: async () => {},
  logout: async () => {},
  updateUser: () => {},
});

//
// PROVIDER
//

export const AuthProvider = ({ children }: { children: React.ReactNode }) => {
  const [token, setToken] = useState<string | null>(null);
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadSession = async () => {
      const storedToken = await SecureStore.getItemAsync('user-token');
      const storedUser = await SecureStore.getItemAsync('user-data');

      if (storedToken && storedUser && !isTokenExpired(storedToken)) {
        setToken(storedToken);
        setUser(JSON.parse(storedUser));
      } else {
        setToken(null);
        setUser(null);
        await SecureStore.deleteItemAsync('user-token');
        await SecureStore.deleteItemAsync('user-data');
      }

      setIsLoading(false);
    };

    loadSession();
  }, []);

  const login = async (newToken: string, userData: User) => {
    setIsLoading(true);
    await SecureStore.setItemAsync('user-token', newToken);
    await SecureStore.setItemAsync('user-data', JSON.stringify(userData));
    setToken(newToken);
    setUser(userData);
    setIsLoading(false);
  };

  const logout = async () => {
    setIsLoading(true);
    await SecureStore.deleteItemAsync('user-token');
    await SecureStore.deleteItemAsync('user-data');
    setToken(null);
    setUser(null);
    setIsLoading(false);
  };

  // Función para actualizar usuario parcialmente (ej: profileImageUrl)
  const updateUser = (newUserData: Partial<User>) => {
    setUser((prevUser) => {
      if (!prevUser) return prevUser;
      return { ...prevUser, ...newUserData };
    });
  };

  return (
    <AuthContext.Provider value={{ token, user, isLoading, login, logout, updateUser }}>
      {children}
    </AuthContext.Provider>
  );
};

//
// HOOK
//

export const useAuth = () => useContext(AuthContext);
