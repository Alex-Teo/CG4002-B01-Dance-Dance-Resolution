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
    actualDance: "No Coach",
    actualPositions: [1, 2, 3],
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
      // console.log(`Data Group ${data}`);
      // data += 1;
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
      setEmgArray(newArray);
      // console.log("emg1", emgArray);
    });

    // Sockets for processed data
    // {predictedDance:string, predictedPos:array, syncDelay:number}
    socket.on("newProcessedData", (ProcessedData) => {
      setCurrentProcessedData(ProcessedData);
      // console.log("processed", currentProcessedData);
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
            syncDelay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.predictedPos.indexOf(1)}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 2"
            syncDelay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.predictedPos.indexOf(2)}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 3"
            syncDelay={currentProcessedData.syncDelay}
            currentDance={currentProcessedData.predictedDance}
            currentPos={currentProcessedData.predictedPos.indexOf(3)}
            coachDance={currentCoachData.actualDance}
            coachPos={currentCoachData.actualPositions}
          />
          <div className="graph">
            <Analytics
              d1HandAccArray={d1HandAccArray.slice(-20)}
              d2HandAccArray={d2HandAccArray.slice(-20)}
              d3HandAccArray={d3HandAccArray.slice(-20)}
              d1HandGyroArray={d1HandGyroArray.slice(-20)}
              d2HandGyroArray={d2HandGyroArray.slice(-20)}
              d3HandGyroArray={d3HandGyroArray.slice(-20)}
              emgArray={emgArray.slice(-20)}
            />
          </div>
        </div>

        <div className="coach">
          <CoachCard
            currentDance={currentCoachData.actualDance}
            actualPositions={currentCoachData.actualPositions}
            dancerDance={currentProcessedData.predictedDance}
            dancerPos={currentProcessedData.predictedPos}
          />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
