import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import CardButton from '../../components/CardButton/CardButton';
import CardButtonGrid from '../../components/CardButtonGrid/CardButtonGrid';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';

export default function HomeScreen() {
  const { colors } = useTheme();
  const { user } = useAuth();

  const userRole = user?.role?.name;
  const isStudentOrTutor = userRole === 'Estudiante' || userRole === 'Tutor';

  return (
    <TabsLayoutWrapper>
      <ScrollView contentContainerStyle={[styles.container, { backgroundColor: colors.background }]}>
        <View style={styles.header}>
          {/* Nombre */}
          <Text style={[styles.textNombre, { color: colors.text }]}>
            {user?.name ? `¡Hola, ${user.name}!` : '¡Hola!'}
          </Text>

          {/* Mostrar carrera solo si es Estudiante */}
          {userRole === 'Estudiante' && (
            <Text style={[styles.textCarrera, { color: colors.mutedText }]}>
              {user?.student?.group?.career?.name || 'Carrera no disponible'}
            </Text>
          )}

          {/* Mostrar Rol */}
          <Text style={[styles.textRol, { color: colors.text }]}>
            {userRole || 'Rol desconocido'}
          </Text>
        </View>

        <CardButtonGrid>
          {/* Mostrar estos solo si es Estudiante o Tutor */}
          {isStudentOrTutor && (
            <>
              <CardButton
                imageSource={require('../../assets/images/iconos/reloj.png')}
                textCard="Horarios"
                onPress={() => {}}
              />
              <CardButton
                imageSource={require('../../assets/images/iconos/library.png')}
                textCard="Academia"
                onPress={() => {}}
              />
              <CardButton
                imageSource={require('../../assets/images/iconos/boleta.png')}
                textCard="Calificaciones"
                onPress={() => {}}
              />
            </>
          )}

          {/* Estos se muestran a todos */}
          <CardButton
            imageSource={require('../../assets/images/iconos/buzon.png')}
            textCard="Buzón de Quejas o Sugerencias"
            onPress={() => {}}
          />
          <CardButton
            imageSource={require('../../assets/images/iconos/proceso.png')}
            textCard="Configuración"
            onPress={() => {}}
          />
          <CardButton
            imageSource={require('../../assets/images/iconos/normativas.png')}
            textCard="Normativas"
            onPress={() => {}}
          />
          <CardButton
            imageSource={require('../../assets/images/iconos/convenio.png')}
            textCard="Convenios"
            onPress={() => {}}
          />
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
