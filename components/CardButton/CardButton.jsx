import { Text, TouchableOpacity } from "react-native";
import { styles } from './style';
import { Feather } from '@expo/vector-icons';

export default function CardButton({ iconName, textCard, onPress }) {
  return (
    <TouchableOpacity style={[styles.container, { width: '30%', margin: '1.5%' }]} onPress={onPress}>
      <Feather name={iconName} style={styles.icon} />
      <Text style={styles.text}>{textCard}</Text>
    </TouchableOpacity>
  );
}
