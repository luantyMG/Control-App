import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { useTheme } from '../../src/context/ThemeContext/ThemeContext';
import ThemedButton from '@/components/ThemedButton/ThemedButton';
import { StatusBar } from 'expo-status-bar';
import CardButton from '@/components/CardButton/CardButton';

export default function HomeScreen() {
  const { colors, toggleTheme } = useTheme();

  return (
    <View style={[styles.container, { backgroundColor: colors.background }]}>
      <StatusBar style={colors.background === '#121212' ? 'light' : 'dark'} />
      <Text style={[styles.text, { color: colors.text }]}>
        !Hola,Luis Alberto Montejo Garcia !
      </Text>

      <ThemedButton title="Cambiar tema" onPress={toggleTheme} />
      <View style={styles.containerButton}>
        <CardButton
          iconName="clock"
          textCard="Horarios"
          onPress={() => console.log('Botón presionado')}
        />
        <CardButton
          iconName="alert-octagon"
          textCard="Reportar Incidente"
          onPress={() => console.log('Botón presionado')}
        />
        <CardButton
          iconName="codesandbox"
          textCard="Modulos"
          onPress={() => console.log('Botón presionado')}
        />
        <CardButton
          iconName="award"
          textCard="Calificaciones"
          onPress={() => console.log('Botón presionado')}
        />
        <CardButton
          iconName="award"
          textCard="Califiaciones"
          onPress={() => console.log('Botón presionado')}
        />
      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  text: {
    fontSize: 24,
    width: 300,
  },
  containerButton: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'center',
    paddingHorizontal: 10,
  },
});
