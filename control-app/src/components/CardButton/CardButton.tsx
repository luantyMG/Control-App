import React from "react";
import { Text, TouchableOpacity, View, Image } from "react-native";
import type { AccessibilityRole } from 'react-native';
import { styles } from './styles';
import { useTheme } from '../../context/ThemeContext/ThemeContext';

type CardButtonProps = {
  imageSource: any;
  textCard: string;
  onPress: () => void;
  accessibilityRole?: AccessibilityRole;
  accessibilityLabel?: string;
  activeOpacity?: number;
};

export default function CardButton({
  imageSource,
  textCard,
  onPress,
  accessibilityRole = "button",
  accessibilityLabel,
  activeOpacity = 0.7,
}: CardButtonProps) {
  const { colors } = useTheme();

  return (
    <TouchableOpacity
      style={[
        styles.container,
        { 
          backgroundColor: colors.card,
          borderColor: colors.border,
          shadowColor: colors.isDark ? '#000' : '#AAA',
          shadowOffset: { width: 0, height: 2 },
          shadowOpacity: colors.isDark ? 0.3 : 0.15,
          shadowRadius: 4,
          elevation: 3,
        }
      ]}
      onPress={onPress}
      activeOpacity={activeOpacity}
      accessibilityRole={accessibilityRole}
      accessibilityLabel={accessibilityLabel || textCard}
    >
      <Image source={imageSource} style={styles.iconImage} />
      <View style={styles.textWrapper}>
        <Text
          style={[styles.text, { color: colors.text }]}
          numberOfLines={2}
          adjustsFontSizeToFit
          minimumFontScale={0.7}
          allowFontScaling
        >
          {textCard}
        </Text>
      </View>
    </TouchableOpacity>
  );
}
