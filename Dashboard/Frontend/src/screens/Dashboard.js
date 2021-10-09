import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Analytics from "../components/Analytics";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect, useState } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // ---------------- useState ---------------- //

  // Use state for raw data
  // Array of objects
  const [emgArray, setEmgArray] = useState([
    {
      d1Emg: 0,
      d2Emg: 0,
      d3Emg: 0,
    },
  ]);

  // Array of objects - acc
  const [d1HandAccArray, setD1HandAccArray] = useState([
    {
      aX: 0,
      aY: 0,
      aZ: 0,
    },
  ]);
  const [d2HandAccArray, setD2HandAccArray] = useState([
    {
      aX: 0,
      aY: 0,
      aZ: 0,
    },
  ]);
  const [d3HandAccArray, setD3HandAccArray] = useState([
    {
      aX: 0,
      aY: 0,
      aZ: 0,
    },
  ]);

  // Array of objects - gyro
  const [d1HandGyroArray, setD1HandGyroArray] = useState([
    {
      gX: 0,
      gY: 0,
      gZ: 0,
    },
  ]);
  const [d2HandGyroArray, setD2HandGyroArray] = useState([
    {
      gX: 0,
      gY: 0,
      gZ: 0,
    },
  ]);
  const [d3HandGyroArray, setD3HandGyroArray] = useState([
    {
      gX: 0,
      gY: 0,
      gZ: 0,
    },
  ]);

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
      // console.log("coach", currentCoachData);
    });

    // Sockets for raw data
    // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}
    socket.on("newD1HandData", (FinalData) => {
      setD1HandAccArray([...d1HandAccArray, FinalData[acc]]);
      setD1HandGyroArray([...d1HandGyroArray, FinalData[gyro]]);
      console.log("d1", d1HandAccArray, d1HandGyroArray);
    });

    socket.on("newD2HandData", (FinalData) => {
      setD2HandAccArray([...d2HandAccArray, FinalData[acc]]);
      setD2HandGyroArray([...d2HandGyroArray, FinalData[gyro]]);
      console.log("d2", d2HandAccArray, d2HandGyroArray);
    });

    socket.on("newD3HandData", (FinalData) => {
      setD3HandAccArray([...d3HandAccArray, FinalData[acc]]);
      setD3HandGyroArray([...d3HandGyroArray, FinalData[gyro]]);
      console.log("d3", d3HandAccArray, d3HandGyroArray);
    });

    // Socket for Emg data
    // {d1Emg:num, d2Emg:num, d3Emg:num}
    socket.on("newEmgData", (FinalData) => {
      setEmgArray([...emgArray, FinalData]);
      console.log("emg", emgArray);
    });

    // Sockets for processed data
    // {predictedDance:string, predictedPos:array}
    socket.on("newProcessedData", (ProcessedData) => {
      setCurrentProcessedData(ProcessedData);
    });
    console.log("processed", currentProcessedData);
  }, []);

  return (
    <div className="dashboardWrapper">
      {/* <ScreenHeader
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
            <Analytics />
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
      </div> */}
    </div>
  );
};

export default Dashboard;
