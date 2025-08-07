import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    width: 130,
    height: 120,
    margin: 8,
    borderRadius: 8,
    justifyContent: "center",
    alignItems: "center",
    paddingHorizontal: 10,
    borderWidth: 1,
  },
  iconImage: {
    width: 40,
    height: 40,
    resizeMode: 'contain',
    marginBottom: 8,
  },
  textWrapper: {
    width: "100%",
    alignItems: "center",
  },
  text: {
    fontSize: 16,
    textAlign: "center",
  },
});
