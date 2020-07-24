import React from "react";
import { View, Text, StyleSheet, TouchableOpacity } from "react-native";

const ActivityCategoryPicker = ({ getActivity }) => {
  return (
    <View style={styles.container}>
      <TouchableOpacity style={styles.category} onPress={getActivity}>
        <Text style={styles.iconText}>Healthy</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.category} onPress={getActivity}>
        <Text style={styles.iconText}>Wealthy</Text>
      </TouchableOpacity>
      <TouchableOpacity style={styles.category} onPress={getActivity}>
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

export default ActivityCategoryPicker;
