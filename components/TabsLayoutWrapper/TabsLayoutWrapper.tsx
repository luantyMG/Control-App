import React from 'react';
import { View, StyleSheet, SafeAreaView } from 'react-native';
import HeaderGlobal from '../HeaderGlobal/HeaderGlobal';
import { useTheme } from '../../src/context/ThemeContext/ThemeContext';

export default function TabsLayoutWrapper({ children }: { children: React.ReactNode }) {
  const { colors } = useTheme();

  return (
    <SafeAreaView style={[styles.safeArea, { backgroundColor: colors.background }]}>
      <HeaderGlobal />
      <View style={[styles.container, { backgroundColor: colors.background }]}>
        {children}
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    paddingTop: 50,
    paddingBottom: 40,
    paddingHorizontal: 20,
  },
  container: {
    flex: 1,
  },
});
