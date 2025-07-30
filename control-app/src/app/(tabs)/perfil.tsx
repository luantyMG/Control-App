import React, { useEffect, useState } from 'react';
import { View, Text, Image, TouchableOpacity, StyleSheet, Alert } from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import * as ImagePicker from 'expo-image-picker';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';
import { useRouter } from 'expo-router';

export default function PerfilScreen() {
  const [hasPermission, setHasPermission] = useState<boolean | null>(null);
  const [imageUri, setImageUri] = useState<string | null>(null);
  const { colors, isDarkTheme } = useTheme();
  const { logout } = useAuth();
  const router = useRouter();

  useEffect(() => {
    checkPermissions();
  }, []);

  const checkPermissions = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    setHasPermission(status === 'granted');
  };

  const pickImage = async () => {
    if (!hasPermission) return;

    const result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [1, 1],
      quality: 0.7,
    });

    if (!result.canceled) {
      setImageUri(result.assets[0].uri);
    }
  };

  const handleLogout = () => {
    Alert.alert(
      'Cerrar sesión',
      '¿Estás seguro que quieres cerrar sesión?',
      [
        { text: 'Cancelar', style: 'cancel' },
        {
          text: 'Cerrar sesión',
          style: 'destructive',
          onPress: async () => {
            await logout();
            router.replace('/login'); // Redirige a la pantalla de login
          },
        },
      ]
    );
  };

  return (
    <TabsLayoutWrapper>
      <SafeAreaView style={[styles.container, { backgroundColor: colors.background }]}>
        <StatusBar style={isDarkTheme ? 'light' : 'dark'} />

        <View style={styles.profileContainer}>
          <TouchableOpacity onPress={pickImage}>
            <Image
              source={
                imageUri
                  ? { uri: imageUri }
                  : isDarkTheme
                    ? require('../../assets/images/iconos/usuario-dark.png')
                    : require('../../assets/images/iconos/usuario-light.png')
              }
              style={styles.profileImage}
            />
            <Text style={[styles.editText, { color: colors.primary }]}>Cambiar foto</Text>
          </TouchableOpacity>

          <Text style={[styles.name, { color: colors.text }]}>Luis Alberto Montejo Garcia</Text>
          <Text style={[styles.role, { color: colors.text }]}>Profesional Técnico-Bachiller en Autotrónica</Text>
          <Text style={[styles.textRol, { color: colors.text }]}>Estudiante</Text>
        </View>

        <View style={styles.actionsContainer}>
          <TouchableOpacity style={[styles.actionButton, { backgroundColor: colors.card }]}>
            <Text style={[styles.actionText, { color: colors.text }]}>Configuración</Text>
          </TouchableOpacity>

          <TouchableOpacity
            style={[styles.actionButton, { backgroundColor: colors.card }]}
            onPress={handleLogout}
          >
            <Text style={[styles.actionText, { color: colors.text }]}>Cerrar sesión</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    </TabsLayoutWrapper>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
  },
  profileContainer: {
    alignItems: 'center',
    marginTop: 40,
  },
  profileImage: {
    width: 140,
    height: 140,
    borderRadius: 70,
    borderWidth: 3,
    borderColor: '#aaa',
  },
  editText: {
    marginTop: 8,
    fontSize: 14,
    textAlign: 'center',
  },
  name: {
    fontSize: 24,
    fontWeight: '700',
    marginTop: 20,
  },
  role: {
    textAlign: 'center',
    fontSize: 16,
    marginTop: 5,
    fontStyle: 'italic',
  },
  actionsContainer: {
    marginTop: 40,
    gap: 15,
  },
  actionButton: {
    paddingVertical: 15,
    paddingHorizontal: 20,
    borderRadius: 10,
    alignItems: 'center',
  },
  actionText: {
    fontSize: 16,
    fontWeight: '500',
  },
  textRol: {
    fontSize: 20,
    fontWeight: '600',
    textAlign: 'center',
  },
});
