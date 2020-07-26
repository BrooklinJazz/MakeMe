import React from "react";
import { Text, View, StyleSheet } from "react-native";

const Header = ({ title }) => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>{ title }</Text>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
  },
  title: {
    fontSize: 40
  }
})

export default Header;