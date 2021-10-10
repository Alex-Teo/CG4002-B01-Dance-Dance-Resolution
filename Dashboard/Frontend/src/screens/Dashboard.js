import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Analytics from "../components/Analytics";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect, useState } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // FIXME: Sockets are correctly receiving data from server, but setState not working
  // ---------------- useState ---------------- //

  // useState for coach data
  const [currentCoachData, setCurrentCoachData] = useState({
    actualDance: " ",
    actualPositions: [],
  });

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

  //useState for processed data
  const [currentProcessedData, setCurrentProcessedData] = useState({
    predictedDance: "Not Dancing",
    predictedPos: [1, 2, 3],
    syncDelay: 0,
  });
  var data = 0;

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
      let accArray = d1HandAccArray;
      let gyroArray = d1HandGyroArray;
      accArray.push(FinalData.acc);
      gyroArray.push(FinalData.gyro);
      setD1HandAccArray(accArray);
      setD1HandGyroArray(gyroArray);
      console.log(`Data Group ${data}`);
      data += 1;
      // console.log("d1", d1HandAccArray, d1HandGyroArray);
    });

    socket.on("newD2HandData", (FinalData) => {
      let accArray = d2HandAccArray;
      let gyroArray = d2HandGyroArray;
      accArray.push(FinalData.acc);
      gyroArray.push(FinalData.gyro);
      setD2HandAccArray(accArray);
      setD2HandGyroArray(gyroArray);
      // console.log("d2", d2HandAccArray, d2HandGyroArray);
    });

    socket.on("newD3HandData", (FinalData) => {
      let accArray = d3HandAccArray;
      let gyroArray = d3HandGyroArray;
      accArray.push(FinalData.acc);
      gyroArray.push(FinalData.gyro);
      setD3HandAccArray(accArray);
      setD3HandGyroArray(gyroArray);
      // console.log("d3", d3HandAccArray, d3HandGyroArray);
    });

    // Socket for Emg data
    // {d1Emg:num, d2Emg:num, d3Emg:num}
    socket.on("newEmgData", (FinalData) => {
      let newArray = emgArray;
      newArray.push(FinalData);
      setEmgArray([...emgArray, newArray]);
      // console.log("emg", emgArray);
    });

    // Sockets for processed data
    // {predictedDance:string, predictedPos:array, syncDelay:number}
    socket.on("newProcessedData", (ProcessedData) => {
      setCurrentProcessedData({
        ...currentProcessedData,
        predictedDance: ProcessedData.predictedDance,
        predictedPos: ProcessedData.predictedPos,
        syncDelay: ProcessedData.syncDelay,
      });

      console.log("processed2", currentProcessedData);
    });
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
