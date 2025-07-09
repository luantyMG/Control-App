import { StyleSheet } from "react-native";

export const styles = StyleSheet.create({
 container: {
   width: 110, 
   height:110,             // ancho fijo, ni muy pequeño ni muy grande
  margin: 8,               // margen para separar
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
  },
  icon: {
    marginRight: 8,
    color: 'white',
    fontSize: 35,
  },
});
