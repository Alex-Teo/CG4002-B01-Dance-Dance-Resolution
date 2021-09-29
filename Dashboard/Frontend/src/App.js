import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import Sidebar from "./components/Sidebar";
import History from "./screens/History";
import Dashboard from "./screens/Dashboard";

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
