import React from 'react';
import { TouchableOpacity, Text, StyleSheet, GestureResponderEvent, View } from 'react-native';
import { useTheme } from '../../src/context/ThemeContext/ThemeContext';
import { Feather } from '@expo/vector-icons';

interface ThemedButtonProps {
  title: string;
  onPress: (event: GestureResponderEvent) => void;
  style?: object;
  isDarkMode: boolean;
}

export default function ThemedButton({ title, onPress, style, isDarkMode }: ThemedButtonProps) {
  const { colors } = useTheme();

  // Define los colores según el modo
  const backgroundColor = isDarkMode ? 'white' : 'black';
  const textColor = isDarkMode ? 'black' : 'white';

  return (
    <TouchableOpacity
      onPress={onPress}
      activeOpacity={0.8}
      style={[styles.button, { backgroundColor }, style]}
    >
      <View style={styles.content}>
        <Feather
          name={isDarkMode ? 'moon' : 'sun'}
          size={20}
          color={textColor}
          style={{ marginRight: 8 }}
        />
        <Text style={[styles.text, { color: textColor }]}>{title}</Text>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  button: {
    padding: 10,
    borderRadius: 50,
    alignItems: 'center',
    justifyContent: 'center',
  },
  content: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  text: {
    fontSize: 16,
    fontWeight: '600',
  },
});
