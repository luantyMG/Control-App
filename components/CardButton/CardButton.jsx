import React from "react";
import { Text, TouchableOpacity, View, StyleSheet } from "react-native";
import { Feather } from "@expo/vector-icons";

export default function CardButton({ iconName, textCard, onPress }) {
  return (
    <TouchableOpacity style={styles.container} onPress={onPress} activeOpacity={0.7}>
      <Feather name={iconName} size={36} color="white" style={styles.icon} />
      <View style={styles.textWrapper}>
        <Text
          style={styles.text}
          numberOfLines={2}
          adjustsFontSizeToFit={true}
          minimumFontScale={0.7} // mínimo tamaño de fuente permitido
          allowFontScaling={true}
        >
          {textCard}
        </Text>
      </View>
    </TouchableOpacity>
  );
}

const styles = StyleSheet.create({
  container: {
    width: 130, 
    height: 120,
    margin: 8,
    backgroundColor: "#3B83BD",
    borderRadius: 8,
    justifyContent: "center",
    alignItems: "center",
    paddingHorizontal: 10,
  },
  icon: {
    marginBottom: 8,
  },
  textWrapper: {
    width: "100%",
    alignItems: "center",
  },
text: {
  color: "white",
  fontSize: 16,
  textAlign: "center"
}
});
