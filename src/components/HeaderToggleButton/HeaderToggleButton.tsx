import { useTheme } from '../../context/ThemeContext/ThemeContext';
import { TouchableOpacity } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

export default function HeaderToggleButton() {
  const { toggleTheme, colors } = useTheme();

  return (
    <TouchableOpacity onPress={toggleTheme} style={{ marginRight: 15 }}>
      <Icon name="moon" size={24} color={colors.text} />
    </TouchableOpacity>
  );
}
