import React from "react";
import { View, Text, StyleSheet, TouchableOpacity } from "react-native";
import { ActivityTypes } from "../api/activities";

interface IProps {
  getActivity: (type: ActivityTypes) => void
}

export const ActivityCategoryPicker = ({getActivity}: IProps) => {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.category} onPress={() => getActivity(ActivityTypes.HEALTH)}>
        <Text style={styles.iconText}>Healthy</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.category} onPress={() => getActivity(ActivityTypes.CAREER)}>
        <Text style={styles.iconText}>Wealthy</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.category} onPress={() => getActivity(ActivityTypes.MIND)}>
        <Text style={styles.iconText}>Wise</Text>
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    borderWidth: 1,
    borderColor: "black",
  },
  category: {
    flex: 1,
    alignItems: "center",
  },
  iconText: {
    fontSize: 24,
  },
});
