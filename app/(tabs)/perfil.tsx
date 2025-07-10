import { View, Text } from 'react-native';
import { useTheme } from '../../src/context/ThemeContext/ThemeContext';
import { SafeAreaView } from 'react-native-safe-area-context';
import { StatusBar } from 'expo-status-bar';
import TabsLayoutWrapper from '@/components/TabsLayoutWrapper/TabsLayoutWrapper';
export default function PerfilScreen() {
  const { colors } = useTheme();

  return (
     <TabsLayoutWrapper><SafeAreaView style={{ flex: 1, backgroundColor: colors.background }}>
      <StatusBar style={colors.background === '#121212' ? 'light' : 'dark'} />
       <View style={{ flex: 1, justifyContent: "center", alignItems: "center", backgroundColor: colors.background }}>
      <Text style={{ color: colors.text }}>Página de Perfil</Text>
    </View></SafeAreaView>
</TabsLayoutWrapper>
    
  );
}
