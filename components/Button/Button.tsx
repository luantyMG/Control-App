import { TouchableOpacity,Text } from 'react-native';
import { styles } from './styles';
import { ButtonProps  } from './types';


export default function Button({ title, onPress,color}:ButtonProps ) {
         
         return (

      <TouchableOpacity
        style = {[styles.container, { backgroundColor: color || 'green' }]}
        onPress={onPress}
    
      >
        <Text style={styles.buttonText}>{title}</Text>
      </TouchableOpacity>
  );
};