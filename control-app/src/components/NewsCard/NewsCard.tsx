import React from 'react';
import { View, Text, Image } from 'react-native';
import { styles } from './styles';
import { NewsCardProps } from './types';
import { useTheme } from '../../context/ThemeContext/ThemeContext';

export default function NewsCard({ avatarUrl, title, date, description, imageUrl }: NewsCardProps) {
  const { colors } = useTheme();

  return (
    <View style={[styles.container, { backgroundColor: colors.card, borderColor: colors.border, shadowColor: colors.isDark ? '#000' : '#AAA' }]}>
      <View style={styles.containerHeader}>
        <Image source={{ uri: avatarUrl }} style={styles.avatar} />
        <Text style={[styles.title, { color: colors.text }]}>{title}</Text>
      </View>

      <Text style={[styles.subText, { color: colors.mutedText }]}>{date}</Text>

      <Text style={[styles.description, { color: colors.text }]}>{description}</Text>

      {imageUrl ? (
        <Image source={{ uri: imageUrl }} style={styles.image} />
      ) : null}
    </View>
  );
}
