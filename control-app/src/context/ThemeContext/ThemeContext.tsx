import {
  createContext,
  useContext,
  useEffect,
  useState,
  useCallback,
} from 'react';
import { Appearance } from 'react-native';
import AsyncStorage from '@react-native-async-storage/async-storage';
import { ThemeColors, ThemeContextProps, ThemeProviderProps } from './types';
import { lightTheme } from './themes/light';
import { darkTheme } from './themes/dark';

const ThemeContext = createContext<ThemeContextProps | undefined>(undefined);

// Clave para AsyncStorage
const STORAGE_KEY = 'user-theme-preference';

export const ThemeProvider = ({ children }: ThemeProviderProps): JSX.Element => {
  const [isDarkTheme, setIsDarkTheme] = useState<boolean | null>(null);

  // Cargar preferencia del usuario o sistema
  useEffect(() => {
    const loadTheme = async () => {
      try {
        const stored = await AsyncStorage.getItem(STORAGE_KEY);
        if (stored !== null) {
          setIsDarkTheme(stored === 'dark');
        } else {
          const systemTheme = Appearance.getColorScheme();
          setIsDarkTheme(systemTheme === 'dark');
        }
      } catch (error) {
        console.error('Error al cargar el tema:', error);
        setIsDarkTheme(false);
      }
    };

    loadTheme();
  }, []);

  // Alternar tema manualmente y guardar en AsyncStorage
  const toggleTheme = useCallback(async () => {
    try {
      const newValue = !isDarkTheme;
      setIsDarkTheme(newValue);
      await AsyncStorage.setItem(STORAGE_KEY, newValue ? 'dark' : 'light');
    } catch (error) {
      console.error('Error al guardar preferencia de tema:', error);
    }
  }, [isDarkTheme]);

  if (isDarkTheme === null) {
    return null;
  }

  const colors: ThemeColors = isDarkTheme ? darkTheme : lightTheme;

  return (
    <ThemeContext.Provider value={{ colors, toggleTheme, isDarkTheme }}>
      {children}
    </ThemeContext.Provider>
  );
};

export const useTheme = () => {
  const context = useContext(ThemeContext);
  if (!context) {
    throw new Error('useTheme debe ser usado dentro de un ThemeProvider');
  }
  return context;
};
