import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  Image,
  TouchableOpacity,
  StyleSheet,
  Alert,
  ActivityIndicator,
} from 'react-native';
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
  const [uploading, setUploading] = useState(false);
  const { colors, isDarkTheme } = useTheme();
  const { logout, user, token, updateUser } = useAuth();
  const router = useRouter();

  useEffect(() => {
    checkPermissions();
  }, []);

  useEffect(() => {
    if (user?.profileImageUrl) {
      setImageUri(user.profileImageUrl);
    }
  }, [user]);

  const checkPermissions = async () => {
    const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
    setHasPermission(status === 'granted');
  };

  const pickImage = async () => {
    if (!hasPermission) {
      Alert.alert(
        'Permiso denegado',
        'Necesitamos permiso para acceder a la galería.'
      );
      return;
    }

    const result = await ImagePicker.launchImageLibraryAsync({
     mediaTypes: 'images',
      allowsEditing: true,
      aspect: [1, 1],
      quality: 0.7,
    });

    if (!result.canceled && result.assets.length > 0) {
      const localUri = result.assets[0].uri;
      setImageUri(localUri);

      // Subimos la imagen al backend
      await uploadImage(localUri);
    }
  };

  const uploadImage = async (uri: string) => {
    if (!token) {
      Alert.alert('Error', 'No estás autenticado.');
      return;
    }

    setUploading(true);

    try {
      const formData = new FormData();
      const uriParts = uri.split('.');
      const fileType = uriParts[uriParts.length - 1];

      formData.append('profileImage', {
        uri,
        name: `profile.${fileType}`,
        type: `image/${fileType === 'jpg' ? 'jpeg' : fileType}`,
      } as any);

      const response = await fetch(
        `http://192.168.100.43:4000/users/upload-profile-image/${user?.id}`,
        {
          method: 'POST',
          headers: {
            // IMPORTANTE: No uses Content-Type aquí, deja que fetch lo gestione con multipart/form-data
            Authorization: `Bearer ${token}`,
          },
          body: formData,
        }
      );

      if (!response.ok) {
        throw new Error('Error al subir la imagen');
      }

      const data = await response.json();

      if (data.user) {
        updateUser(data.user);
        setImageUri(data.user.profileImageUrl);
      } else {
        Alert.alert('Error', 'No se recibió información del usuario actualizada.');
      }
    } catch (error) {
      Alert.alert('Error', (error as Error).message);
    } finally {
      setUploading(false);
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
            router.replace('/login');
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
          <TouchableOpacity onPress={pickImage} disabled={uploading}>
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
            {uploading ? (
              <ActivityIndicator size="small" color={colors.primary} style={{ marginTop: 8 }} />
            ) : (
              <Text style={[styles.editText, { color: colors.primary }]}>Cambiar foto</Text>
            )}
          </TouchableOpacity>

          <Text style={[styles.name, { color: colors.text }]}>
            {user?.name || 'Nombre no disponible'}
          </Text>

          <Text style={[styles.role, { color: colors.text }]}>
            {user?.role?.name === 'Estudiante' &&
              (user?.student?.group?.career?.name || 'Carrera no disponible')}
          </Text>

          <Text style={[styles.textRol, { color: colors.text }]}>
            {user?.role?.name || 'Rol desconocido'}
          </Text>
        </View>

        <View style={styles.actionsContainer}>
          <TouchableOpacity style={[styles.actionButton, { backgroundColor: colors.card }]}>
            <Text style={[styles.actionText, { color: colors.text }]}>Configuración</Text>
          </TouchableOpacity>

          <TouchableOpacity style={[styles.actionButton, { backgroundColor: colors.card }]}>
            <Text style={[styles.actionText, { color: colors.text }]}>Configuración del sitio</Text>
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
