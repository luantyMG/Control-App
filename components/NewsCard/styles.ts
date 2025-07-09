import { StyleSheet } from "react-native";



export const styles = StyleSheet.create({
    container: {
     width: '100%',
        height: 'auto',
        backgroundColor: '#fff',
        borderRadius: 10,
        padding: 10,
        marginBottom: 10,
        shadowColor: '#000',
        shadowOffset: {
        width: 0,
        height: 10,
        },
        shadowOpacity: 0.25,
        shadowRadius: 3.84,
        elevation: 5,
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
    }
    ,
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
    
})