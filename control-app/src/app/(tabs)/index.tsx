import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import CardButton from '../../components/CardButton/CardButton';
import CardButtonGrid from '../../components/CardButtonGrid/CardButtonGrid';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';
import { useRouter } from 'expo-router';

// Definir roles como constantes para evitar errores de typo
const ROLES = {
  STUDENT: 'Estudiante',
  TUTOR: 'Tutor',
  DOCENTE: 'Docente',
  ADMIN: 'Administrativo',
};

export default function HomeScreen() {
  const { colors } = useTheme();
  const { user } = useAuth();
  const router = useRouter();

  // Aseguramos que userRole sea string (vacío si undefined)
  const userRole = user?.role?.name || '';
  const isStudentOrTutor = [ROLES.STUDENT, ROLES.TUTOR].includes(userRole);

  // Listado de botones para estudiantes y tutores
  const studentButtons = [
    {
      key: 'horarios',
      icon: require('../../assets/images/iconos/reloj.png'),
      text: 'Horarios',
      onPress: () => {},
    },
    {
      key: 'biblioteca',
      icon: require('../../assets/images/iconos/library.png'),
      text: 'Biblioteca digital',
      onPress: () => {},
    },
    {
      key: 'calificaciones',
      icon: require('../../assets/images/iconos/boleta.png'),
      text: 'Calificaciones',
      onPress: () => {},
    },
    {
      key: 'mis-docentes',
      icon: require('../../assets/images/iconos/mujer.png'),
      text: 'Mis Docentes',
      onPress: () => {},
    },
    {
      key: 'estado-pagos',
      icon: require('../../assets/images/iconos/metodo-de-pago.png'),
      text: 'Estado de Pagos',
      onPress: () => {},
    },
  ];

  // Botones comunes a todos los usuarios
  const commonButtons = [
    {
      key: 'buzon',
      icon: require('../../assets/images/iconos/buzon.png'),
      text: 'Buzón de Quejas o Sugerencias',
      onPress: () => {},
    },
    {
      key: 'normativas',
      icon: require('../../assets/images/iconos/normativas.png'),
      text: 'Normativas y Documentos Oficiales',
      onPress: () => {},
    },
    {
      key: 'convenios',
      icon: require('../../assets/images/iconos/convenio.png'),
      text: 'Convenios',
      onPress: () => {},
    },
  ];

  return (
    <TabsLayoutWrapper>
      <ScrollView
        contentContainerStyle={[styles.container, { backgroundColor: colors.background }]}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
      >
        <View style={styles.header}>
          {/* Nombre con fallback amigable */}
          <Text style={[styles.textNombre, { color: colors.text }]}>
            {user?.name ? `¡Hola, ${user.name}!` : '¡Hola! Completa tu perfil'}
          </Text>

          {/* Mostrar carrera solo si es Estudiante */}
          {userRole === ROLES.STUDENT && (
            <Text style={[styles.textCarrera, { color: colors.mutedText }]}>
              {user?.student?.group?.career?.name || 'Carrera no disponible'}
            </Text>
          )}

          {/* Mostrar Rol con fallback */}
          <Text style={[styles.textRol, { color: colors.text }]}>
            {userRole || 'Rol desconocido'}
          </Text>
        </View>

        <CardButtonGrid>
          {/* Botones para Estudiante o Tutor */}
          {isStudentOrTutor &&
            studentButtons.map((btn) => (
              <CardButton
                key={btn.key}
                imageSource={btn.icon}
                textCard={btn.text}
                onPress={btn.onPress}
                accessibilityRole="button"
                accessibilityLabel={btn.text}
                activeOpacity={0.7}
              />
            ))}

          {/* Botones para todos */}
          {commonButtons.map((btn) => (
            <CardButton
              key={btn.key}
              imageSource={btn.icon}
              textCard={btn.text}
              onPress={btn.onPress}
              accessibilityRole="button"
              accessibilityLabel={btn.text}
              activeOpacity={0.7}
            />
          ))}
        </CardButtonGrid>
      </ScrollView>
    </TabsLayoutWrapper>
  );
}

const styles = StyleSheet.create({
  container: {
    flexGrow: 1,
    paddingTop: 50,
    paddingHorizontal: 20,
  },
  header: {
    alignItems: 'center',
    marginBottom: 30,
  },
  textNombre: {
    fontSize: 24,
    fontWeight: '700',
    marginBottom: 8,
    textAlign: 'center',
  },
  textCarrera: {
    fontSize: 16,
    fontWeight: '400',
    marginBottom: 4,
    textAlign: 'center',
  },
  textRol: {
    fontSize: 18,
    fontWeight: '600',
    textAlign: 'center',
  },
});
