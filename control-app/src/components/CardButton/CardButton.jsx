import React from "react";
import { Text, TouchableOpacity, View, Image } from "react-native";
import { styles } from './styles';
import { useTheme } from '../../context/ThemeContext/ThemeContext';

export default function CardButton({  imageSource, textCard, onPress }) {
  const { colors } = useTheme();

  return (
    <TouchableOpacity
      style={[styles.container, { backgroundColor: colors.card, borderColor: colors.border }]}
      onPress={onPress}
      activeOpacity={0.7}
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
