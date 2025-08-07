import React from 'react';
import { View, Image, StyleSheet } from 'react-native';
import ThemedButton from '../../components/ThemedButton/ThemedButton';
import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { useAuth } from '../../context/AuthContext/AuthContext';
import LogoEmpresa from '../../assets/images/bussines/logo.png';
import AvatarDefault from '../../assets/images/bussines/perfil.png';

export default function HeaderGlobal() {
  const { colors, toggleTheme } = useTheme();
  const { user } = useAuth();

  return (
    <View style={[styles.topBar, { backgroundColor: colors.background }]}>
      <Image
        source={
          user?.profileImageUrl
            ? { uri: user.profileImageUrl }
            : AvatarDefault
        }
        style={styles.avatar}
      />
      <Image source={LogoEmpresa} style={styles.logoEmpresa} />
      <ThemedButton title="" onPress={toggleTheme} />
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
    width: 60,
    height: 60,
    borderRadius: 30,
    backgroundColor: '#ccc',
  },
});
