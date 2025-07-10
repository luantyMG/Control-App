// style.js o style.ts
import { StyleSheet } from 'react-native';

export const styles = StyleSheet.create({
  container: {
    minWidth: 110,
    maxWidth: '32%',
    height: 110,
    margin: 8,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#3B83BD',
    padding: 10,
    borderRadius: 8,
  },
  text: {
    color: 'white',
    fontSize: 16,
    textAlign: 'center',
    includeFontPadding: false,
    paddingHorizontal: 4,
  },
  icon: {
    color: 'white',
    fontSize: 35,
    marginBottom: 8,
  },
});
