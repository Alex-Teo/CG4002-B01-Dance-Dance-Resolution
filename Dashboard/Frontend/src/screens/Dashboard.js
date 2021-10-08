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

  //useState for emgArray
  const [emgArray, setEmgArray] = useState([
    {
      Dancer1: 0,
      Dancer2: 0,
      Dancer3: 0,
    },
  ]);

  //useState for emgArray
  const [gyro1Array, setgyro1Array] = useState([
    {
      x: 0,
      y: 0,
      z: 0,
    },
  ]);

  const [gyro2Array, setgyro2Array] = useState([
    {
      x: 0,
      y: 0,
      z: 0,
    },
  ]);

  const [gyro3Array, setgyro3Array] = useState([
    {
      x: 0,
      y: 0,
      z: 0,
    },
  ]);

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
    socket.on("newCoachData", (coachData) => {
      setCurrentCoachData({
        actualDance: coachData["actualDance"],
        actualPositions: coachData["actualPositions"].split(" | "),
      });
    });

    // Sockets for raw data
    socket.on("newRawData", (RawData) => {
      var currUserID = RawData["userID"];
      var currentEmgData = emgArray;
      if (currentEmgData.length > 20) currentEmgData.pop();

      var dancer1Emg,
        dancer2Emg,
        dancer3Emg,
        gX1,
        gY1,
        gZ1,
        gX2,
        gY2,
        gZ2,
        gX3,
        gY3,
        gZ3 = 0;

      switch (currUserID) {
        case "0":
          dancer1Emg = Number(RawData["emg"]);
          dancer2Emg = Number(currentEmgData.at(-1)["Dancer2"]);
          dancer3Emg = Number(currentEmgData.at(-1)["Dancer3"]);
          gX1 = Number(RawData["gX"]);
          gY1 = Number(RawData["gY"]);
          gZ1 = Number(RawData["gZ"]);
          break;
        case "1":
          dancer2Emg = Number(RawData["emg"]);
          dancer1Emg = Number(currentEmgData.at(-1)["Dancer1"]);
          dancer3Emg = Number(currentEmgData.at(-1)["Dancer3"]);
          gX2 = Number(RawData["gX"]);
          gY2 = Number(RawData["gY"]);
          gZ1 = Number(RawData["gZ"]);
          break;
        case "2":
          dancer3Emg = Number(RawData["emg"]);
          dancer1Emg = Number(currentEmgData.at(-1)["Dancer1"]);
          dancer2Emg = Number(currentEmgData.at(-1)["Dancer2"]);
          gX3 = Number(RawData["gX"]);
          gY3 = Number(RawData["gY"]);
          gZ3 = Number(RawData["gZ"]);
          break;
        default:
          dancer1Emg = Number(currentEmgData.at(-1)["Dancer1"]);
          dancer2Emg = Number(currentEmgData.at(-1)["Dancer2"]);
          dancer3Emg = Number(currentEmgData.at(-1)["Dancer3"]);
      }

      setEmgArray((emgArray) => [
        ...emgArray,
        { Dancer1: dancer1Emg, Dancer2: dancer2Emg, Dancer3: dancer3Emg },
      ]);
      setgyro1Array((gyro1Array) => [
        ...gyro1Array,
        { x: gX1, y: gY1, z: gZ1 },
      ]);

      setgyro2Array((gyro2Array) => [
        ...gyro2Array,
        { x: gX2, y: gY2, z: gZ2 },
      ]);

      setgyro3Array((gyro3Array) => [
        ...gyro3Array,
        { x: gX3, y: gY3, z: gZ3 },
      ]);
    });

    // Sockets for processed data
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
