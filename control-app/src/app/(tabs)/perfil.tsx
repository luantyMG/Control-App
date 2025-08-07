import React, { useEffect, useState } from 'react';
import {
  View,
  Text,
  Image,
  TouchableOpacity,
  StyleSheet,
  Alert,
  ActivityIndicator,
  FlatList,
  ScrollView,
  Platform,
} from 'react-native';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import * as ImagePicker from 'expo-image-picker';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';
import { useRouter } from 'expo-router';
import { API_BASE_URL } from '../../utils/apiConfig';

export default function PerfilScreen() {
  const [hasPermission, setHasPermission] = useState<boolean | null>(null);
  const [imageUri, setImageUri] = useState<string | null>(null);
  const [uploading, setUploading] = useState(false);
  const { colors, isDarkTheme } = useTheme();
  const { logout, user, token, updateUser } = useAuth();
  const router = useRouter();

  // Estilos dinámicos para aplicar colores del tema
  const dynamicStyles = {
    text: { color: colors.text },
    primary: { color: colors.primary },
    mutedText: { color: colors.mutedText },
    cardBackground: { backgroundColor: colors.card },
    buttonBackground: { backgroundColor: colors.primary, shadowColor: colors.primary },
  };

  useEffect(() => {
    checkPermissions();
  }, []);

  useEffect(() => {
    if (user?.profileImageUrl) {
      setImageUri(user.profileImageUrl);
    }
  }, [user]);

  const checkPermissions = async () => {
    if (Platform.OS === 'android' && Platform.Version >= 33) {
      const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
      setHasPermission(status === 'granted');
    } else {
      const { status } = await ImagePicker.requestMediaLibraryPermissionsAsync();
      setHasPermission(status === 'granted');
    }
  };

  const pickImage = async () => {
    if (!hasPermission) {
      Alert.alert('Permiso denegado', 'Necesitamos permiso para acceder a la galería.');
      return;
    }

    try {
      const result = await ImagePicker.launchImageLibraryAsync({
        mediaTypes: ImagePicker.MediaTypeOptions.Images,
        allowsEditing: true,
        aspect: [1, 1],
        quality: 0.7,
      });

      if (!result.canceled && result.assets.length > 0) {
        const localUri = result.assets[0].uri;
        const previousUri = imageUri;
        setImageUri(localUri);

        try {
          await uploadImage(localUri);
        } catch (error) {
          setImageUri(previousUri);
          Alert.alert('Error', (error as Error).message);
        }
      }
    } catch (error) {
      Alert.alert('Error', 'No se pudo seleccionar la imagen.');
    }
  };

  const uploadImage = async (uri: string) => {
    if (!token) {
      throw new Error('No estás autenticado.');
    }

    setUploading(true);

    try {
      const formData = new FormData();

      const uriParts = uri.split('.');
      const fileType = uriParts[uriParts.length - 1].toLowerCase();
      const mimeType = fileType === 'jpg' ? 'image/jpeg' : `image/${fileType}`;

      // @ts-ignore
      formData.append('profileImage', {
        uri,
        name: `profile.${fileType}`,
        type: mimeType,
      });

      const response = await fetch(
        `${API_BASE_URL}/users/upload-profile-image/${user?.id}`,
        {
          method: 'POST',
          headers: {
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
        throw new Error('No se recibió información actualizada del usuario.');
      }
    } finally {
      setUploading(false);
    }
  };

  const handleLogout = () => {
    Alert.alert('Cerrar sesión', '¿Estás seguro que quieres cerrar sesión?', [
      { text: 'Cancelar', style: 'cancel' },
      {
        text: 'Cerrar sesión',
        style: 'destructive',
        onPress: async () => {
          await logout();
          router.replace('/login');
        },
      },
    ]);
  };

  const actionButtons = [
    { id: 'config', label: 'Configuración', onPress: () => {}, accessibilityLabel: 'Configuración' },
    { id: 'site-config', label: 'Configuración del sitio', onPress: () => {}, accessibilityLabel: 'Configuración del sitio' },
    { id: 'logout', label: 'Cerrar sesión', onPress: handleLogout, accessibilityLabel: 'Cerrar sesión' },
  ];

  return (
    <TabsLayoutWrapper>
      <SafeAreaView style={{ flex: 1, backgroundColor: colors.background }}>
        <StatusBar style={isDarkTheme ? 'light' : 'dark'} />
        <ScrollView contentContainerStyle={styles.container}>
          <View style={styles.profileContainer}>
            <TouchableOpacity
              onPress={pickImage}
              disabled={uploading}
              accessibilityLabel="Cambiar foto de perfil"
              accessibilityRole="button"
            >
              <Image
                source={
                  imageUri
                    ? { uri: imageUri }
                    : isDarkTheme
                      ? require('../../assets/images/iconos/usuario-dark.png')
                      : require('../../assets/images/iconos/usuario-light.png')
                }
                style={[styles.profileImage, { borderColor: colors.primary, backgroundColor: colors.card }]}
              />
              {uploading ? (
                <ActivityIndicator size="small" color={colors.primary} style={{ marginTop: 8 }} />
              ) : (
                <Text style={[styles.editText, dynamicStyles.primary]}>Cambiar foto</Text>
              )}
            </TouchableOpacity>

            <Text style={[styles.textRol, dynamicStyles.mutedText]}>
              {user?.role?.name || 'Rol desconocido'}
            </Text>

            <Text style={[styles.name, dynamicStyles.text]}>
              {user?.name || 'Nombre no disponible'}
            </Text>

            <Text style={[styles.campusText, dynamicStyles.mutedText]}>
              {user?.student?.group?.campus?.name ||
                user?.teacher?.campus?.name ||
                user?.staff?.campus?.name ||
                'Campus no disponible'}
            </Text>

            <Text style={[styles.role, dynamicStyles.mutedText]}>
              {user?.role?.name === 'Estudiante'
                ? user?.student?.group?.career?.name || 'Carrera no disponible'
                : null}
            </Text>
          </View>

          <FlatList
            data={actionButtons}
            keyExtractor={(item) => item.id}
            scrollEnabled={false}
            contentContainerStyle={styles.actionsContainer}
            renderItem={({ item }) => (
              <TouchableOpacity
                activeOpacity={0.7}
                disabled={uploading}
                style={[styles.actionButton, dynamicStyles.buttonBackground]}
                onPress={item.onPress}
                accessibilityLabel={item.accessibilityLabel}
                accessibilityRole="button"
              >
                <Text style={[styles.actionText]}>{item.label}</Text>
              </TouchableOpacity>
            )}
          />
        </ScrollView>
      </SafeAreaView>
    </TabsLayoutWrapper>
  );
}

const styles = StyleSheet.create({
  container: {
    padding: 20,
    paddingBottom: 80,
  },
  profileContainer: {
    alignItems: 'center',
    marginTop: 20,
    marginBottom: 30,
    paddingHorizontal: 10,
  },
  profileImage: {
    width: 160,
    height: 160,
    borderRadius: 80,
    borderWidth: 3,
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.25,
    shadowRadius: 5,
    elevation: 5,
  },
  editText: {
    marginTop: 10,
    fontSize: 14,
    fontWeight: '600',
    textAlign: 'center',
  },
  name: {
    fontSize: 28,
    fontWeight: '700',
    marginTop: 20,
    textAlign: 'center',
    letterSpacing: 0.5,
  },
  textRol: {
    fontSize: 18,
    fontWeight: '600',
    textAlign: 'center',
    marginTop: 6,
  },
  campusText: {
    fontSize: 16,
    marginTop: 6,
    fontStyle: 'italic',
    textAlign: 'center',
  },
  role: {
    fontSize: 16,
    marginTop: 8,
    fontStyle: 'italic',
    textAlign: 'center',
  },
  actionsContainer: {
    marginTop: 40,
    gap: 15,
    paddingHorizontal: 10,
  },
  actionButton: {
    paddingVertical: 16,
    paddingHorizontal: 25,
    borderRadius: 12,
    alignItems: 'center',
    shadowOffset: { width: 0, height: 6 },
    shadowOpacity: 0.35,
    shadowRadius: 7,
    elevation: 8,
  },
  actionText: {
    fontSize: 16,
    fontWeight: '600',
    color: '#fff',
  },
});
