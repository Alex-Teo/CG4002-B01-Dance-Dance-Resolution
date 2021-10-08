import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Analytics from "../components/Analytics";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect, useState } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // ---------------- useState ---------------- //
  // useState for coach data
  const [currentCoachData, setCurrentCoachData] = useState({
    actualDance: " ",
    actualPositions: [],
  });

  // useState for processed data
  const [currentProcessedData, setCurrentProcessedData] = useState({
    predictedDance: " ",
    dancer1PredictedPos: " ",
    dancer2PredictedPos: " ",
    dancer3PredictedPos: " ",
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
    // {actualDance:string, actualPositions:array}
    socket.on("newCoachData", (coachData) => {
      setCurrentCoachData(coachData);
    });

    // TODO: Sockets for raw data
    // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}

    // TODO: Socket for Emg data
    // {d1Emg:num, d2Emg:num, d3Emg:num}

    // TODO: Sockets for processed data
    socket.on("newProcessedData", (ProcessedData) => {
      setCurrentProcessedData({
        predictedDance: ProcessedData["predictedDance"], // dance
        dancer1PredictedPos: ProcessedData["predictedPos"].split(" | ")[0], // pos1 | pos2 | pos3
        dancer2PredictedPos: ProcessedData["predictedPos"].split(" | ")[1], // pos1 | pos2 | pos3
        dancer3PredictedPos: ProcessedData["predictedPos"].split(" | ")[2], // pos1 | pos2 | pos3
        syncDelay: ProcessedData["syncDelay"], // sync
      });
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
            delay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.dancer1PredictedPos}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 2"
            delay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.dancer2PredictedPos}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 3"
            delay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.dancer3PredictedPos}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <div className="graph">
            <Analytics
              emgData={emgArray.slice(-21)}
              gyro1Data={gyro1Array.slice(-21)}
              gyro2Data={gyro2Array.slice(-21)}
              gyro3Data={gyro3Array.slice(-21)}
            />
          </div>
        </div>

        <div className="coach">
          <CoachCard
            currentDance={currentCoachData.actualDance}
            actualPositions={currentCoachData.actualPositions}
            feedback={[
              currentCoachData.dancer1Feedback,
              currentCoachData.dancer2Feedback,
              currentCoachData.dancer3Feedback,
            ]}
            dancerDance={currentProcessedData.predictedDance}
            dancerPos={[
              currentProcessedData.dancer1PredictedPos,
              currentProcessedData.dancer2PredictedPos,
              currentProcessedData.dancer3PredictedPos,
            ]}
          />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
