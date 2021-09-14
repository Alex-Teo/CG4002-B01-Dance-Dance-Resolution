import "./App.css";
import { useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import Sidebar from "./components/Sidebar";
import Dashboard from "./screens/Dashboard";
import History from "./screens/History";

function App() {
  return (
    <div>
      <Router>
        <Sidebar />
        <div className="pageContainer">
          <Switch>
            <Route path="/dashboard" component={Dashboard} />
            <Route path="/history" component={History} />
          </Switch>
        </div>
      </Router>
    </div>
  );
}

export default App;
