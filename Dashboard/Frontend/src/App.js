import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import Sidebar from "./components/Sidebar";
import DashboardScreen from "./screens/DashboardScreen";
import HistoryScreen from "./screens/HistoryScreen";
import WelcomeScreen from "./screens/WelcomeScreen";

function App() {
  return (
    <div>
      <Router>
        <Sidebar />
        <div className="pageContainer">
          <Switch>
            <Route exact path="/" component={WelcomeScreen} />
            <Route exact path="/dashboard" component={DashboardScreen} />
            <Route exact path="/history" component={HistoryScreen} />
          </Switch>
        </div>
      </Router>
    </div>
  );
}

export default App;
