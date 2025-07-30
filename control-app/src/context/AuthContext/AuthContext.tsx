import React, { createContext, useContext, useEffect, useState } from 'react';
import * as SecureStore from 'expo-secure-store';
import jwtDecode from 'jwt-decode';

type AuthContextType = {
  token: string | null;
  isLoading: boolean;
  login: (token: string) => Promise<void>;
  logout: () => Promise<void>;
};

type JwtPayload = {
  exp: number; // timestamp en segundos
};

const isTokenExpired = (token: string) => {
  try {
    const decoded = jwtDecode<JwtPayload>(token);
    if (!decoded.exp) return true;
    return decoded.exp * 1000 < Date.now();
  } catch {
    return true; // si no puede decodificar, lo consideramos expirado
  }
};

const AuthContext = createContext<AuthContextType>({
  token: null,
  isLoading: true,
  login: async () => {},
  logout: async () => {},
});

export const AuthProvider = ({ children }: { children: React.ReactNode }) => {
  const [token, setToken] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  useEffect(() => {
    const loadToken = async () => {
      const storedToken = await SecureStore.getItemAsync('user-token');
      if (storedToken && !isTokenExpired(storedToken)) {
        setToken(storedToken);
      } else {
        setToken(null);
        await SecureStore.deleteItemAsync('user-token');
      }
      setIsLoading(false);
    };
    loadToken();
  }, []);

  const login = async (newToken: string) => {
    setIsLoading(true);
    await SecureStore.setItemAsync('user-token', newToken);
    setToken(newToken);
    setIsLoading(false);
  };

  const logout = async () => {
    setIsLoading(true);
    await SecureStore.deleteItemAsync('user-token');
    setToken(null);
    setIsLoading(false);
  };

  return (
    <AuthContext.Provider value={{ token, isLoading, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
