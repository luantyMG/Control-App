import React from 'react';
import { View, Image, StyleSheet } from 'react-native';
import ThemedButton from '@/components/ThemedButton/ThemedButton';
import { useTheme } from '../../src/context/ThemeContext/ThemeContext';
import LogoEmpresa from '../../assets/images/bussines/logo.png';
import Avatar from '../../assets/images/bussines/perfil.png';

export default function HeaderGlobal() {
  const { colors, toggleTheme } = useTheme();
  const isDarkMode = colors.background === '#121212';

  return (
    <View style={[styles.topBar, { backgroundColor: colors.background }]}>
       <Image source={Avatar} style={styles.avatar} />
      <Image source={LogoEmpresa} style={styles.logoEmpresa} />
      <ThemedButton title="" onPress={toggleTheme} isDarkMode={isDarkMode} />
    </View>
  );
}

const styles = StyleSheet.create({
  topBar: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingHorizontal: 30,
   
  },
  logoEmpresa: {
    width: 150,
    height: 100,
    resizeMode: 'contain',
  },
   avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
    backgroundColor: '#ccc',
  },
});
