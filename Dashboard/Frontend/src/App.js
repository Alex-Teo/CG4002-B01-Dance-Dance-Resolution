import "./App.css";
import { useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import MainDashboard from "./screens/MainDashboard";

function App() {
  return (
    <div>
      <MainDashboard />
    </div>
  );
}

export default App;
