import "./Dashboard.css";
import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Analytics from "../components/Analytics";
import ScreenHeader from "../components/ScreenHeader";

import { useEffect, useState } from "react";
import { io } from "socket.io-client";

const Dashboard = () => {
  // ---------------- Constants ---------------- //
  const initialAccDataset = [
    {
      id: "AccX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "AccY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "AccZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ];

  const initialGyroDataset = [
    {
      id: "GyroX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "GyroY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "GyroZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ];

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
  const [d1HandAcc, setD1HandAcc] = useState(initialAccDataset);
  const [d2HandAcc, setD2HandAcc] = useState(initialAccDataset);
  const [d3HandAcc, setD3HandAcc] = useState(initialAccDataset);

  // Array of objects - gyro
  const [d1HandGyro, setD1HandGyro] = useState(initialGyroDataset);
  const [d2HandGyro, setD2HandGyro] = useState(initialGyroDataset);
  const [d3HandGyro, setD3HandGyro] = useState(initialGyroDataset);

  //useState for processed data
  const [processedData, setProcessedData] = useState({
    predictedDance: "Inactive",
    predictedPos: [1, 2, 3],
    syncDelay: "-",
  });

  // var data = 0;

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
    var d1Time = 1;
    var d2Time = 1;
    var d3Time = 1;
    // Sockets for raw data
    // {aX:num, aY:num, aZ:num, gX:num, gY:num, gZ:num}
    socket.on("newD1HandData", (FinalData) => {
      let tempD1HandAcc = d1HandAcc;
      let tempD1HandGyro = d1HandGyro;

      if (tempD1HandAcc[0].data.length > 10) {
        tempD1HandAcc[0].data.shift();
        tempD1HandAcc[1].data.shift();
        tempD1HandAcc[2].data.shift();
      }
      if (tempD1HandGyro[0].data.length > 10) {
        tempD1HandGyro[0].data.shift();
        tempD1HandGyro[1].data.shift();
        tempD1HandGyro[2].data.shift();
      }
      tempD1HandAcc[0].data.push({ x: d1Time, y: FinalData.acc.aX });
      tempD1HandAcc[1].data.push({ x: d1Time, y: FinalData.acc.aY });
      tempD1HandAcc[2].data.push({ x: d1Time, y: FinalData.acc.aZ });

      tempD1HandGyro[0].data.push({ x: d1Time, y: FinalData.gyro.gX });
      tempD1HandGyro[1].data.push({ x: d1Time, y: FinalData.gyro.gY });
      tempD1HandGyro[2].data.push({ x: d1Time, y: FinalData.gyro.gZ });

      d1Time += 1;
      setD1HandAcc(tempD1HandAcc);
      setD1HandGyro(tempD1HandGyro);
      // console.log(`Data Group ${data}`);
      // data += 1;
      // console.log("d1", d1HandAcc, d1HandGyro);
    });

    socket.on("newD2HandData", (FinalData) => {
      let tempD2HandAcc = d2HandAcc;
      let tempD2HandGyro = d2HandGyro;

      if (tempD2HandAcc[0].data.length > 10) {
        tempD2HandAcc[0].data.shift();
        tempD2HandAcc[1].data.shift();
        tempD2HandAcc[2].data.shift();
      }
      if (tempD2HandGyro[0].data.length > 10) {
        tempD2HandGyro[0].data.shift();
        tempD2HandGyro[1].data.shift();
        tempD2HandGyro[2].data.shift();
      }
      tempD2HandAcc[0].data.push({ x: d1Time, y: FinalData.acc.aX });
      tempD2HandAcc[1].data.push({ x: d1Time, y: FinalData.acc.aY });
      tempD2HandAcc[2].data.push({ x: d1Time, y: FinalData.acc.aZ });

      tempD2HandGyro[0].data.push({ x: d1Time, y: FinalData.gyro.gX });
      tempD2HandGyro[1].data.push({ x: d1Time, y: FinalData.gyro.gY });
      tempD2HandGyro[2].data.push({ x: d1Time, y: FinalData.gyro.gZ });

      d2Time += 1;
      setD2HandAcc(tempD2HandAcc);
      setD2HandGyro(tempD2HandGyro);
      // console.log("d2", d2HandAcc, d2HandGyro);
    });

    socket.on("newD3HandData", (FinalData) => {
      let tempD3HandAcc = d3HandAcc;
      let tempD3HandGyro = d3HandGyro;

      if (tempD3HandAcc[0].data.length > 10) {
        tempD3HandAcc[0].data.shift();
        tempD3HandAcc[1].data.shift();
        tempD3HandAcc[2].data.shift();
      }
      if (tempD3HandGyro[0].data.length > 10) {
        tempD3HandGyro[0].data.shift();
        tempD3HandGyro[1].data.shift();
        tempD3HandGyro[2].data.shift();
      }
      tempD3HandAcc[0].data.push({ x: d1Time, y: FinalData.acc.aX });
      tempD3HandAcc[1].data.push({ x: d1Time, y: FinalData.acc.aY });
      tempD3HandAcc[2].data.push({ x: d1Time, y: FinalData.acc.aZ });

      tempD3HandGyro[0].data.push({ x: d1Time, y: FinalData.gyro.gX });
      tempD3HandGyro[1].data.push({ x: d1Time, y: FinalData.gyro.gY });
      tempD3HandGyro[2].data.push({ x: d1Time, y: FinalData.gyro.gZ });

      d3Time += 1;
      setD3HandAcc(tempD3HandAcc);
      setD3HandGyro(tempD3HandGyro);
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
          <UserCard //TODO: Replce with real values after week 9
            dancerId="Dancer 2"
            // syncDelay={processedData.syncDelay}
            // currentDance={processedData.predictedDance}
            syncDelay={"-"}
            currentDance={"Inactive"}
            currentPos={processedData.predictedPos.indexOf(2)}
            coachDance={coachData.actualDance}
            coachPos={coachData.actualPositions}
          />
          <UserCard //TODO: Replce with real values after week 9
            dancerId="Dancer 3"
            // syncDelay={processedData.syncDelay}
            // currentDance={processedData.predictedDance}
            syncDelay={"-"}
            currentDance={"Inactive"}
            currentPos={processedData.predictedPos.indexOf(3)}
            coachDance={coachData.actualDance}
            coachPos={coachData.actualPositions}
          />
          <div className="graph">
            {/* {JSON.stringify(d1HandAcc)} */}
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
