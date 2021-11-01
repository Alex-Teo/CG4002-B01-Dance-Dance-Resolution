import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import { SocketContext, socket } from "./context/socket";

// Screens
import DashboardScreen from "./screens/DashboardScreen";
import HistoryScreen from "./screens/HistoryScreen";
import WelcomeScreen from "./screens/WelcomeScreen";
import LoginScreen from "./screens/LoginScreen";
import TutorialScreen from "./screens/TutorialScreen";

function App() {
  return (
    <SocketContext.Provider value={socket}>
      <div>
        <Router>
          <Route exact path="/" component={LoginScreen} />
          <div className="pageContainer">
            <Switch>
              <Route exact path="/welcome" component={WelcomeScreen} />
              <Route exact path="/dashboard" component={DashboardScreen} />
              <Route exact path="/history" component={HistoryScreen} />
              <Route exact path="/tutorial" component={TutorialScreen} />
            </Switch>
          </div>
        </Router>
      </div>
    </SocketContext.Provider>
  );
}

export default App;
