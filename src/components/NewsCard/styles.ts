
import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
  container: {
    width: '100%',
    height: 'auto',
    backgroundColor: 'transparent',  // quitar fondo blanco
    borderRadius: 10,
    paddingVertical: 15,          
   shadowOffset: { width: 0, height: 0 },
    shadowOpacity: 0,
    shadowRadius: 0,
    elevation: 0,
  },
  containerHeader: {
    flexDirection: 'row',
    justifyContent: 'flex-start',
    gap: 10,
  
  },
  title: {
    fontSize: 14,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  subText: {
    fontSize: 12,
    marginBottom: 5,
  },
  description: {
    fontSize: 18,
    color: '#666',
  },
  image: {
    width: '100%',
    height: 200,
    borderRadius: 10,
    marginTop: 10,
  },
  avatar: {
    width: 40,
    height: 40,
    borderRadius: 20,
  },
});
