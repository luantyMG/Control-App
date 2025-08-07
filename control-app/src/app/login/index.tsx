import React, { useState } from 'react';
import {
  View,
  TextInput,
  Button,
  Alert,
  StyleSheet,
  Text,
  ActivityIndicator,
  Image,
  TouchableOpacity,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';
import { Ionicons } from '@expo/vector-icons'; // <-- import de íconos
import { useRouter } from 'expo-router';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import { API_BASE_URL } from '../../utils/apiConfig';

const logo = require('../../assets/images/bussines/LogoCompany.png');

const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

const LoginScreen: React.FC = () => {
  const router = useRouter();
  const { colors } = useTheme();
  const { login } = useAuth();

  const [email, setEmail] = useState<string>('');
  const [password, setPassword] = useState<string>('');
  const [loading, setLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState<string | null>(null);
  const [showPassword, setShowPassword] = useState(false);

  const validateInputs = () => {
    if (!email || !password) {
      setErrorMsg('Por favor completa todos los campos');
      return false;
    }
    if (!emailRegex.test(email)) {
      setErrorMsg('Por favor ingresa un correo válido');
      return false;
    }
    setErrorMsg(null);
    return true;
  };

  const handleLogin = async (): Promise<void> => {
    if (!validateInputs()) return;

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
          await login(data.token, data.user);
          router.replace('/');
        } else {
          setErrorMsg('No se recibieron datos completos del servidor');
        }
      } else {
        setErrorMsg(data.error || 'Login fallido');
      }
    } catch (error) {
      console.error('Login error:', error);
      setErrorMsg('No se pudo conectar al servidor');
    } finally {
      setLoading(false);
    }
  };

  return (
    <KeyboardAvoidingView
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      style={[styles.container, { backgroundColor: colors.background }]}
    >
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

      <View style={styles.passwordWrapper}>
        <TextInput
          placeholder="Contraseña"
          placeholderTextColor={colors.mutedText}
          value={password}
          onChangeText={setPassword}
          secureTextEntry={!showPassword}
          style={[styles.input, { flex: 1, borderColor: colors.border, color: colors.text }]}
          editable={!loading}
        />
        <TouchableOpacity
          onPress={() => setShowPassword(!showPassword)}
          disabled={loading}
          style={styles.showPasswordButton}
        >
          <Ionicons
            name={showPassword ? 'eye-off' : 'eye'}
            size={24}
            color={colors.primary}
          />
        </TouchableOpacity>
      </View>

      {errorMsg && <Text style={[styles.errorText, { color: colors.error }]}>{errorMsg}</Text>}

      {loading ? (
        <ActivityIndicator size="large" color={colors.primary} style={{ marginTop: 10 }} />
      ) : (
        <Button
          title="Iniciar sesión"
          onPress={handleLogin}
          color={colors.primary}
          disabled={!email || !password}
        />
      )}
    </KeyboardAvoidingView>
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
  passwordWrapper: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 12,
    alignSelf: 'stretch',
  },
  showPasswordButton: {
    paddingHorizontal: 10,
    height: 40,
    justifyContent: 'center',
  },
  errorText: {
    marginBottom: 12,
    alignSelf: 'stretch',
    textAlign: 'center',
  },
});

export default LoginScreen;

export const options = {
  headerShown: false,
};
