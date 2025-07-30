import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import CardButton from '../../components/CardButton/CardButton';
import CardButtonGrid from '../../components/CardButtonGrid/CardButtonGrid';
import TabsLayoutWrapper from '../../components/TabsLayoutWrapper/TabsLayoutWrapper';


export default function HomeScreen() {
  const { colors } = useTheme();

  return (
    <TabsLayoutWrapper>
      <ScrollView contentContainerStyle={[styles.container, { backgroundColor: colors.background }]}>
        <View style={styles.header}>
          <Text style={[styles.textNombre, { color: colors.text }]}>¡Hola, Luis Alberto Montejo Garcia!</Text>
          <Text style={[styles.textCarrera, { color: colors.text }]}>Profesional Técnico-Bachiller en Autotrónica</Text>
          <Text style={[styles.textRol, { color: colors.text }]}>Estudiante</Text>
        </View>

        <CardButtonGrid>
          <CardButton imageSource={require('../../assets/images/iconos/reloj.png')} textCard="Horarios" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/buzon.png')} textCard="Buzón de Quejas o Sugerencias" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/library.png')} textCard="Academia" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/boleta.png')} textCard="Calificaciones" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/proceso.png')} textCard="Configuración" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/normativas.png')} textCard="Normativas" onPress={() => { }} />
          <CardButton imageSource={require('../../assets/images/iconos/convenio.png')} textCard="Convenios" onPress={() => { }} />
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
