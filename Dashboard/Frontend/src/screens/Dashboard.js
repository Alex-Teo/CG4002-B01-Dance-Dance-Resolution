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
  const [coachData, setCoachData] = useState({
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
  const [d1HandAcc, setD1HandAcc] = useState([
    {
      id: "AccX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: Math.floor(Date.now() / 1000),
          y: 0,
        },
      ],
    },
    {
      id: "AccY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: Math.floor(Date.now() / 1000),
          y: 0,
        },
      ],
    },
    {
      id: "AccZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: Math.floor(Date.now() / 1000),
          y: 0,
        },
      ],
    },
  ]);
  const [d2HandAcc, setD2HandAcc] = useState({
    aX: 0,
    aY: 0,
    aZ: 0,
  });
  const [d3HandAcc, setD3HandAcc] = useState({
    aX: 0,
    aY: 0,
    aZ: 0,
  });

  // Array of objects - gyro
  const [d1HandGyro, setD1HandGyro] = useState({
    gX: 0,
    gY: 0,
    gZ: 0,
  });
  const [d2HandGyro, setD2HandGyro] = useState({
    gX: 0,
    gY: 0,
    gZ: 0,
  });
  const [d3HandGyro, setD3HandGyro] = useState({
    gX: 0,
    gY: 0,
    gZ: 0,
  });

  //useState for processed data
  const [processedData, setProcessedData] = useState({
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
      setCoachData(coachData);
      // console.log("coach", currentCoachData);
    });

    // Sockets for raw data
    // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}
    socket.on("newD1HandData", (FinalData) => {
      let tempD1HandAcc = d1HandAcc;
      let time = Math.floor(Date.now() / 1000);
      tempD1HandAcc[0].data.push({ x: time, y: FinalData.acc.aX });
      tempD1HandAcc[1].data.push({ x: time, y: FinalData.acc.aY });
      tempD1HandAcc[2].data.push({ x: time, y: FinalData.acc.aZ });
      setD1HandAcc(tempD1HandAcc);
      // setD1HandAcc(FinalData.acc);
      setD1HandGyro(FinalData.gyro);
      // console.log(`Data Group ${data}`);
      // data += 1;
      // console.log("d1", d1HandAcc, d1HandGyro);
    });

    socket.on("newD2HandData", (FinalData) => {
      setD2HandAcc(FinalData.acc);
      setD2HandGyro(FinalData.gyro);
      // console.log("d2", d2HandAcc, d2HandGyro);
    });

    socket.on("newD3HandData", (FinalData) => {
      setD3HandAcc(FinalData.acc);
      setD2HandGyro(FinalData.gyro);
      // console.log("d3", d3HandAcc, d3HandGyro);
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
      setProcessedData(ProcessedData);
      // console.log("processed", processedData);
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
            syncDelay={processedData.syncDelay}
            currentDance={processedData.predictedDance}
            currentPos={processedData.predictedPos.indexOf(1)}
            coachDance={coachData.actualDance}
            coachPos={coachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 2"
            syncDelay={processedData.syncDelay}
            currentDance={processedData.predictedDance}
            currentPos={processedData.predictedPos.indexOf(2)}
            coachDance={coachData.actualDance}
            coachPos={coachData.actualPositions}
          />
          <UserCard
            dancerId="Dancer 3"
            syncDelay={processedData.syncDelay}
            currentDance={processedData.predictedDance}
            currentPos={processedData.predictedPos.indexOf(3)}
            coachDance={coachData.actualDance}
            coachPos={coachData.actualPositions}
          />
          <div className="graph">
            <Analytics
              d1HandAcc={d1HandAcc}
              d2HandAcc={d2HandAcc}
              d3HandAcc={d3HandAcc}
              d1HandGyro={d1HandGyro}
              d2HandGyro={d2HandGyro}
              d3HandGyro={d3HandGyro}
              emgArray={emgArray.slice(-20)}
            />
          </div>
        </div>

        <div className="coach">
          <CoachCard
            currentDance={coachData.actualDance}
            actualPositions={coachData.actualPositions}
            dancerDance={processedData.predictedDance}
            dancerPos={processedData.predictedPos}
          />
        </div>
      </div>
    </div>
  );
};

export default Dashboard;
