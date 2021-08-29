import "./App.css";
import { useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import HomeScreen from "./screens/HomeScreen";

function App() {
  return (
    <div>
      <HomeScreen />
    </div>
  );
}

export default App;
