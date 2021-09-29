import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Stream from "../components/Stream";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // const [response, setResponse] = useState("");
  useEffect(() => {
    const socket = io.connect("http://localhost:5000");
    socket.on("connect", () => {
      console.log(`Client connected with socket.io ID: ${socket.id}`);
    });
  }, []);
  return (
    <div className="dashboardWrapper">
      <ScreenHeader
        screenTitle="Dashboard"
        screenDesc="A closer look at your performance"
      />

      <div className="analytics">
        <div className="users">
          <UserCard
            dancerId="Dancer 1"
            delay="Delay 1"
            currentDance="Dance 1"
            feedback="Feedback 1"
          />
          <UserCard
            dancerId="Dancer 2"
            delay="Delay 2"
            currentDance="Dance 2"
            feedback="Feedback 2"
          />
          <UserCard
            dancerId="Dancer 3"
            delay="Delay 3"
            currentDance="Dance 3"
            feedback="Feedback 3"
          />
          <div className="graph">
            <div className="fatigue">Overall Fatigue</div>
            <Stream />
          </div>
        </div>

        <div className="coach">
          <CoachCard
            currentDance="Correct Dance"
            currentPosition={[1, 2, 3]}
            feedback={["Feedback 1", "Feedback 2", "Feedback 3"]}
          />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
