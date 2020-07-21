import { StatusBar } from "expo-status-bar";
import React, { useEffect, useState } from "react";
import { StyleSheet, Text, View } from "react-native";

export default function App() {
  // NOTE - this is purely to test the first flow. This is a quick, dirty implementation
  const [activity, setActivity] = useState("");
  const find_random = () =>
    fetch("http://localhost:4000/api/activities/find_random")
      .then((res) => res.json())
      .then(setActivity);
  const find_another = () =>
    fetch("http://localhost:4000/api/activities/find_another")
      .then((res) => res.json())
      .then(setActivity);
  return (
    <View style={styles.container}>
      <Text onPress={find_random}>START</Text>
      <Text>{activity?.title}</Text>
      <Text onPress={find_another}>TOO HARD</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
