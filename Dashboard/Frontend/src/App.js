import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// Components

// Screens
import Sidebar from "./components/Sidebar";
import DashboardScreen from "./screens/DashboardScreen";
import HistoryScreen from "./screens/HistoryScreen";

function App() {
  return (
    <div>
      <Router>
        <Sidebar />
        <div className="pageContainer">
          <Switch>
            <Route path="/dashboard" component={DashboardScreen} />
            <Route path="/history" component={HistoryScreen} />
          </Switch>
        </div>
      </Router>
    </div>
  );
}

export default App;
