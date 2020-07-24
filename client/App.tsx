import { StatusBar } from "expo-status-bar";
import React, { useEffect, useState } from "react";
import { StyleSheet, Text, SafeAreaView, TouchableOpacity } from "react-native";

import Header from "./components/Header";
import ActivityCategoryPicker from "./components/ActivityCategoryPicker";
import ActivityPicker from "./components/ActivityPicker";

import StartView from "./views/StartView";

import { findRandom, findAnother } from "./api/activities";

enum States {
  START = "START",
  SELECTING = "SELECTING",
  ALTERNATIVE = "ALTERNATIVE",
  FINISHED = "FINISHED",
}

export default function App() {
  const [activity, setActivity] = useState("");
  const [state, setState] = useState(States.START);

  const getView = () => {
    switch (state) {
      case States.START:
        return <StartView style={styles.middle} />;
      case States.SELECTING:
        return (
          <ActivityPicker
            activity={activity}
            tooHardClick={() => {
              findAnother().then((newActivity) => {
                setActivity(newActivity);
              });
            }}
          />
        );
      default:
        break;
    }
  };

  return (
    <SafeAreaView style={styles.container}>
      <Header title="MakeMe" style={styles.top} />
      {getView()}
      <ActivityCategoryPicker
        style={styles.bottom}
        getActivity={() => {
          findRandom().then((newActivity) => {
            setActivity(newActivity);
            setState(States.SELECTING);
          });
        }}
      />
      <StatusBar style="auto" />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
  },
  top: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "flex-start",
    borderWidth: 2,
    borderColor: "red",
  },
  middle: {
    flex: 3,
    borderWidth: 2,
    borderColor: "blue",
  },
  bottom: {
    flex: 1,
    borderWidth: 2,
    borderColor: "green",
  },
});
