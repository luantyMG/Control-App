import { ReactNode } from 'react';

export interface ThemeColors {
  background: string;
  text: string;
  primary: string;
  secondary: string;
  border: string;
  card: string;
  error: string;
  success: string;
  warning: string;
  mutedText: string;
    isDark: boolean,
}
export interface ThemeContextProps {
    colors: ThemeColors;
    toggleTheme: () => void;
}

export interface ThemeProviderProps {
    children: ReactNode;
}
