import React, { useState } from 'react';
import { View, TextInput, Button, Alert, StyleSheet, Text, ActivityIndicator, Image } from 'react-native';
import { useRouter } from 'expo-router';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import { API_BASE_URL } from '../../utils/apiConfig';

const logo = require('../../assets/images/bussines/LogoCompany.png');

const LoginScreen: React.FC = () => {
  const router = useRouter();
  const { colors } = useTheme();
  const { login } = useAuth();

  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [loading, setLoading] = useState(false);

  const handleLogin = async (): Promise<void> => {
    if (!email || !password) {
      Alert.alert('Error', 'Por favor completa todos los campos');
      return;
    }

    setLoading(true);
    try {
      const res = await fetch(`${API_BASE_URL}/users/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ email, password }),
      });

      const data = await res.json();

      if (res.ok) {
        if (data.token && data.user) {
          // Aquí pasamos el token y el usuario completo al contexto
          await login(data.token, data.user);
          router.replace('/');
        } else {
          Alert.alert('Error', 'No se recibieron datos completos del servidor');
        }
      } else {
        Alert.alert('Error', data.error || 'Login fallido');
      }
    } catch (error) {
      console.error('Login error:', error);
      Alert.alert('Error', 'No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  return (
    <View style={[styles.container, { backgroundColor: colors.background }]}>
      <Image source={logo} style={styles.logo} resizeMode="contain" />
      <Text style={[styles.title, { color: colors.primary }]}>Iniciar sesión</Text>
      <TextInput
        placeholder="Correo"
        placeholderTextColor={colors.mutedText}
        value={email}
        onChangeText={setEmail}
        autoCapitalize="none"
        keyboardType="email-address"
        style={[styles.input, { borderColor: colors.border, color: colors.text }]}
        editable={!loading}
      />
      <TextInput
        placeholder="Contraseña"
        placeholderTextColor={colors.mutedText}
        value={password}
        onChangeText={setPassword}
        secureTextEntry
        style={[styles.input, { borderColor: colors.border, color: colors.text }]}
        editable={!loading}
      />
      {loading ? (
        <ActivityIndicator size="large" color={colors.primary} />
      ) : (
        <Button title="Iniciar sesión" onPress={handleLogin} color={colors.primary} />
      )}
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    justifyContent: 'center',
    alignItems: 'center',
  },
  logo: {
    width: 120,
    height: 120,
    marginBottom: 30,
  },
  title: {
    fontSize: 24,
    marginBottom: 24,
    fontWeight: 'bold',
    textAlign: 'center',
    alignSelf: 'stretch',
  },
  input: {
    marginBottom: 12,
    borderBottomWidth: 1,
    padding: 8,
    alignSelf: 'stretch',
  },
});

export default LoginScreen;

export const options = {
  headerShown: false,
};
