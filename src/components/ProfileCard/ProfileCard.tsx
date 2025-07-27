import {View,TouchableOpacity,Text} from 'react-native'
import { styles } from './styles';
import { ProfileCardProps } from './types';



export default function ProfileCard({ nombre, edad, onPress: _onPress, sexo }: ProfileCardProps) {
  return (
    <View style={styles.container}>
      <TouchableOpacity
        onPress={() => alert(`Hola mi nombre es ${nombre}`)}
        style={styles.button}
      >
        <Text style={styles.textColor}>{`Hola mi nombre es ${nombre}`}</Text>
        <Text style={styles.textColor}>{`Edad: ${edad}`}</Text>
        <Text style={styles.textColor}>{`Sexo: ${sexo}`}</Text>
      </TouchableOpacity>
    </View>
  );
}