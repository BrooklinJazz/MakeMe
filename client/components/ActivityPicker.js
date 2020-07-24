import React from "react";
import { Text, View, StyleSheet, Button } from "react-native";

const ActivityPicker = ({ activity, tooHardClick }) => {
  return (
    <View>
      <Text>{activity?.title}</Text>
      <Button title="TOO HARD" onPress={tooHardClick} />
    </View>
  );
};

const styles = StyleSheet.create({});

export default ActivityPicker;
