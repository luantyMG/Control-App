// CardButtonGrid.tsx
import React from 'react';
import { View, StyleSheet } from 'react-native';

export default function CardButtonGrid({ children }: { children: React.ReactNode }) {
  return <View style={styles.gridContainer}>{children}</View>;
}

const styles = StyleSheet.create({
  gridContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between', 
    paddingHorizontal: 5,
    marginBottom: 10,
  },
});
