import React from 'react';
import {
  TouchableOpacity,
  Text,
  StyleSheet,
  View,
  StyleProp,
  ViewStyle,
  Image,
} from 'react-native';
import { useTheme } from '../../context/ThemeContext/ThemeContext';

import sunIcon from '../../assets/images/iconos/sun.png';
import moonIcon from '../../assets/images/iconos/moon.png';

interface ThemedButtonProps {
  title?: string;
  onPress: () => void;
  style?: StyleProp<ViewStyle>;
}

export default function ThemedButton({ title, onPress, style }: ThemedButtonProps) {
  const { colors } = useTheme();

  const iconSource = colors.isDark ? moonIcon : sunIcon;

  return (
    <TouchableOpacity
      onPress={onPress}
      activeOpacity={0.8}
      style={[
        styles.button,
        { backgroundColor: colors.primary },
        style,
      ]}
    >
      <View style={styles.content}>
        <Image
          source={iconSource}
          style={[styles.icon, { marginRight: title ? 8 : 0 }]}
          resizeMode="contain"
        />
        {title ? <Text style={[styles.text, { color: colors.text }]}>{title}</Text> : null}
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
  icon: {
    width: 20,
    height: 20,
  },
  text: {
    fontSize: 16,
    fontWeight: '600',
  },
});
