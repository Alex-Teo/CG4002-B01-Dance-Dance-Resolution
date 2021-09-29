import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Stream from "../components/Stream";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect, useState } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // ---------------- useState ---------------- //
  // useState for coach data
  const [currentCoachData, setCurrentCoachData] = useState({
    timestamp: Date.now(),
    actualDance: " ",
    actualPositions: " ",
    dancer1Feedback: " ",
    dancer2Feedback: " ",
    dancer3Feedback: " ",
  });

  // useState for raw data
  const [currentDancer1RawData, setCurrentDancer1RawData] = useState({
    userID: " ",
    timestamp: Date.now(),
    aX: " ",
    aY: " ",
    aZ: " ",
    gX: " ",
    gY: " ",
    gZ: " ",
    emg: " ",
  });
  const [currentDancer2RawData, setCurrentDancer2RawData] = useState({
    userID: " ",
    timestamp: Date.now(),
    aX: " ",
    aY: " ",
    aZ: " ",
    gX: " ",
    gY: " ",
    gZ: " ",
    emg: " ",
  });
  const [currentDancer3RawData, setCurrentDancer3RawData] = useState({
    userID: " ",
    timestamp: Date.now(),
    aX: " ",
    aY: " ",
    aZ: " ",
    gX: " ",
    gY: " ",
    gZ: " ",
    emg: " ",
  });

  const [currentEmgData, setCurrentEmgData] = useState([
    {
      Dancer1: 0,
      Dancer2: 0,
      Dancer3: 0,
    },
  ]);

  // useState for processed data
  const [dancer1ProcessedData, setCurrentDancer1ProcessedData] = useState({
    userID: " ",
    timestamp: Date.now(),
    predictedDance: " ",
    predictedPos: " ",
    syncDelay: " ",
  });
  const [dancer2ProcessedData, setCurrentDancer2ProcessedData] = useState({
    userID: " ",
    timestamp: Date.now(),
    predictedDance: " ",
    predictedPos: " ",
    syncDelay: " ",
  });
  const [dancer3ProcessedData, setCurrentDancer3ProcessedData] = useState({
    userID: " ",
    timestamp: Date.now(),
    predictedDance: " ",
    predictedPos: " ",
    syncDelay: " ",
  });

  // ---------------- Sockets ---------------- //
  useEffect(() => {
    const socket = io.connect("http://localhost:5000");

    // Client-server socket initialized
    socket.on("connect", () => {
      console.log(`Client connected with socket.io ID: ${socket.id}`);
    });

    // Sockets for coach data
    socket.on("newCoachData", (coachData) => {
      setCurrentCoachData(coachData);
    });

    // Sockets for raw data
    socket.on("newDancer1RawData", (dancer1RawData) => {
      setCurrentDancer1RawData(dancer1RawData);

      if (currentEmgData.length > 20) {
        currentEmgData.shift();
      }
      currentEmgData.push({
        Dancer1: Number(currentDancer1RawData["emg"]),
        Dancer2: currentEmgData[currentEmgData.length - 1]["Dancer2"],
        Dancer3: currentEmgData[currentEmgData.length - 1]["Dancer3"],
      });
    });
    socket.on("newDancer2RawData", (dancer2RawData) => {
      setCurrentDancer2RawData(dancer2RawData);
      if (currentEmgData.length > 20) {
        currentEmgData.shift();
      }
      currentEmgData.push({
        Dancer1: currentEmgData[currentEmgData.length - 1]["Dancer1"],
        Dancer2: Number(currentDancer2RawData["emg"]),
        Dancer3: currentEmgData[currentEmgData.length - 1]["Dancer3"],
      });
    });
    socket.on("newDancer3RawData", (dancer3RawData) => {
      setCurrentDancer3RawData(dancer3RawData);
      if (currentEmgData.length > 20) {
        currentEmgData.shift();
      }
      currentEmgData.push({
        Dancer1: currentEmgData[currentEmgData.length - 1]["Dancer1"],
        Dancer2: currentEmgData[currentEmgData.length - 1]["Dancer2"],
        Dancer3: Number(currentDancer3RawData["emg"]),
      });

      console.log(currentEmgData);
    });

    // Sockets for processed data
    socket.on("newDancer1ProcessedData", (dancer1ProcessedData) => {
      setCurrentDancer1ProcessedData(dancer1ProcessedData);
    });

    socket.on("newDancer2ProcessedData", (dancer2ProcessedData) => {
      setCurrentDancer2ProcessedData(dancer2ProcessedData);
    });

    socket.on("newDancer3ProcessedData", (dancer3ProcessedData) => {
      setCurrentDancer3ProcessedData(dancer3ProcessedData);
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
            delay={dancer1ProcessedData.syncDelay}
            currentDance={dancer1ProcessedData.predictedDance}
            currentPos={dancer1ProcessedData.predictedPos}
            danceFlag={
              dancer1ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
            posFlag={
              currentCoachData.actualPositions.split(" ")[0] ===
              dancer1ProcessedData.predictedPos
                ? 1
                : 0
            }
          />
          <UserCard
            dancerId="Dancer 2"
            delay={dancer2ProcessedData.syncDelay}
            currentDance={dancer2ProcessedData.predictedDance}
            currentPos={dancer2ProcessedData.predictedPos}
            danceFlag={
              dancer2ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
            posFlag={
              currentCoachData.actualPositions.split(" ")[1] ===
              dancer2ProcessedData.predictedPos
                ? 1
                : 0
            }
          />
          <UserCard
            dancerId="Dancer 3"
            delay={dancer3ProcessedData.syncDelay}
            currentDance={dancer3ProcessedData.predictedDance}
            currentPos={dancer3ProcessedData.predictedPos}
            danceFlag={
              dancer3ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
            posFlag={
              currentCoachData.actualPositions.split(" ")[2] ===
              dancer3ProcessedData.predictedPos
                ? 1
                : 0
            }
          />
          <div className="graph">
            <div className="fatigue">Overall Fatigue</div>
            <Stream currentEmgData={currentEmgData} />
          </div>
        </div>

        <div className="coach">
          <CoachCard
            currentDance={currentCoachData.actualDance}
            actualPositions={currentCoachData.actualPositions.split(" ")}
            feedback={[
              currentCoachData.dancer1Feedback,
              currentCoachData.dancer2Feedback,
              currentCoachData.dancer3Feedback,
            ]}
            dancer1Flag={
              dancer1ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
            dancer2Flag={
              dancer2ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
            dancer3Flag={
              dancer3ProcessedData.predictedDance ===
              currentCoachData.actualDance
                ? 1
                : 0
            }
          />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
