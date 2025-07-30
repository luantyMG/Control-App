import React from 'react';
import { View, StyleSheet, SafeAreaView, ViewStyle, StyleProp } from 'react-native';
import HeaderGlobal from '../HeaderGlobal/HeaderGlobal';
import { useTheme } from '../../context/ThemeContext/ThemeContext';

type TabsLayoutWrapperProps = {
  children: React.ReactNode;
  style?: StyleProp<ViewStyle>; // <-- permitimos estilos externos
};

export default function TabsLayoutWrapper({ children, style }: TabsLayoutWrapperProps) {
  const { colors } = useTheme();

  return (
    <SafeAreaView style={[styles.safeArea, { backgroundColor: colors.background }]}>
      <HeaderGlobal />
      <View style={[styles.container, { backgroundColor: colors.background }, style]}>
        {children}
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    paddingTop: 50,
    paddingHorizontal: 20,
  },
  container: {
    flex: 1,
  },
});
