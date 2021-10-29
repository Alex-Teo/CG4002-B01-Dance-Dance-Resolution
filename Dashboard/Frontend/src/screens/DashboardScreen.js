import "./Dashboard.css";

import UserCard from "../components/UserCard";
import CoachCard from "../components/CoachCard";
import Analytics from "../components/Analytics";
import ScreenHeader from "../components/ScreenHeader";

import { SocketContext } from "../context/socket";

import { useContext, useEffect, useState } from "react";
import Button from "react-bootstrap/Button";

const DashboardScreen = () => {
  // ---------------- Socket ---------------- //
  const socket = useContext(SocketContext);
  socket.on("connect", () => {
    console.log(`Client connected with socket.io ID: ${socket.id}`);
  });

  // ---------------- onClick Fxn ---------------- //

  const toggleDisplayLogout = () => {
    setDisplayLogout(!displayLogout);
    console.log("Manual logout clicked!");
    socket.emit("CLIENT_LOGOUT");
  };

  const manualLogout = () => {
    toggleDisplayLogout();
  };

  // ---------------- useState ---------------- //
  const [displayLogout, setDisplayLogout] = useState(false);

  // ---------------- useState (Data) ---------------- //
  const [coachData, setCoachData] = useState({
    actualDance: "No Coach",
    actualPositions: [1, 2, 3],
  });

  const [emgArray, setEmgArray] = useState([
    {
      emgMean: 0,
    },
  ]);

  const [processedData, setProcessedData] = useState({
    predictedDance1: "Inactive",
    predictedDance2: "Inactive",
    predictedDance3: "Inactive",
    predictedPos: [1, 2, 3],
    syncDelay: 0,
  });

  const [predictedPos, setPredictedPos] = useState([1, 2, 3]);

  const [d1HandAcc, setD1HandAcc] = useState([
    {
      id: "D1 AccX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D1 AccY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D1 AccZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);
  const [d2HandAcc, setD2HandAcc] = useState([
    {
      id: "D2 AccX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D2 AccY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D2 AccZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);
  const [d3HandAcc, setD3HandAcc] = useState([
    {
      id: "D3 AccX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D3 AccY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D3 AccZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);

  const [d1HandGyro, setD1HandGyro] = useState([
    {
      id: "D1 GyroX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D1 GyroY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D1 GyroZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);
  const [d2HandGyro, setD2HandGyro] = useState([
    {
      id: "D2 GyroX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D2 GyroY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D2 GyroZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);
  const [d3HandGyro, setD3HandGyro] = useState([
    {
      id: "D3 GyroX",
      color: "hsl(91, 70%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D3 GyroY",
      color: "hsl(10, 20%, 50%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
    {
      id: "D3 GyroZ",
      color: "hsl(60, 70%, 90%)",
      data: [
        {
          x: 0,
          y: 0,
        },
      ],
    },
  ]);

  // ---------------- Sockets ---------------- //
  useEffect(() => {
    var d1Time = 1;
    var d2Time = 1;
    var d3Time = 1;

    socket.on("SERVER_D1_DATA", (FinalData) => {
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
      tempD1HandAcc[0].data.push({ x: d1Time, y: FinalData.aX });
      tempD1HandAcc[1].data.push({ x: d1Time, y: FinalData.aY });
      tempD1HandAcc[2].data.push({ x: d1Time, y: FinalData.aZ });

      tempD1HandGyro[0].data.push({ x: d1Time, y: FinalData.gX });
      tempD1HandGyro[1].data.push({ x: d1Time, y: FinalData.gY });
      tempD1HandGyro[2].data.push({ x: d1Time, y: FinalData.gZ });

      d1Time += 1;
      setD1HandAcc(tempD1HandAcc);
      setD1HandGyro(tempD1HandGyro);
    });

    socket.on("SERVER_D2_DATA", (FinalData) => {
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
      tempD2HandAcc[0].data.push({ x: d2Time, y: FinalData.aX });
      tempD2HandAcc[1].data.push({ x: d2Time, y: FinalData.aY });
      tempD2HandAcc[2].data.push({ x: d2Time, y: FinalData.aZ });

      tempD2HandGyro[0].data.push({ x: d2Time, y: FinalData.gX });
      tempD2HandGyro[1].data.push({ x: d2Time, y: FinalData.gY });
      tempD2HandGyro[2].data.push({ x: d2Time, y: FinalData.gZ });

      d2Time += 1;
      setD2HandAcc(tempD2HandAcc);
      setD2HandGyro(tempD2HandGyro);
    });

    socket.on("SERVER_D3_DATA", (FinalData) => {
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
      tempD3HandAcc[0].data.push({ x: d3Time, y: FinalData.aX });
      tempD3HandAcc[1].data.push({ x: d3Time, y: FinalData.aY });
      tempD3HandAcc[2].data.push({ x: d3Time, y: FinalData.aZ });

      tempD3HandGyro[0].data.push({ x: d3Time, y: FinalData.gX });
      tempD3HandGyro[1].data.push({ x: d3Time, y: FinalData.gY });
      tempD3HandGyro[2].data.push({ x: d3Time, y: FinalData.gZ });

      d3Time += 1;
      setD3HandAcc(tempD3HandAcc);
      setD3HandGyro(tempD3HandGyro);
    });

    socket.on("SERVER_EMG_DATA", (FinalData) => {
      let newArray = emgArray;
      newArray.push(FinalData);
      setEmgArray(newArray);
    });

    socket.on("SERVER_PROCESSED_DATA", (ProcessedData) => {
      setProcessedData(ProcessedData);
      setPredictedPos(ProcessedData.predictedPos);
    });

    socket.on("SERVER_COACH_DATA", (coachData) => {
      setCoachData(coachData);
    });

    socket.on("SERVER_LOGOUT", () => {
      toggleDisplayLogout();
    });
  }, []);
  return (
    <div className="dashboard_wrapper">
      <ScreenHeader
        screenTitle="Dashboard"
        screenDesc="A closer look at your performance"
      />
      <div className={displayLogout ? "logout_bg" : "logout_bg_hidden"}></div>
      <div className={displayLogout ? "logout_prompt" : "logout_prompt_hidden"}>
        <div className="logout_msg">
          We have detected a logout dance move!
          <div className="sub_msg">Would you like to end the session?</div>
        </div>
        <div className="logout_options">
          <Button
            className="option_btn"
            variant="outline-secondary"
            onClick={() => toggleDisplayLogout()}
          >
            Continue Dancing
          </Button>{" "}
          <Button className="option_btn" variant="danger">
            End Session
          </Button>{" "}
        </div>
      </div>

      <div className="sub_dashboard_wrapper">
        <div className="info_wrapper">
          <div className="users_wrapper">
            <UserCard
              dancerId="Jess"
              syncDelay={processedData.syncDelay}
              currentDance={processedData.predictedDance1}
              currentPos={predictedPos.indexOf(1)}
              coachDance={coachData.actualDance}
              coachPos={coachData.actualPositions}
            />
            <UserCard
              dancerId="Amir"
              syncDelay={processedData.syncDelay}
              currentDance={processedData.predictedDance2}
              currentPos={predictedPos.indexOf(2)}
              coachDance={coachData.actualDance}
              coachPos={coachData.actualPositions}
            />
            <UserCard
              dancerId="Billy"
              syncDelay={processedData.syncDelay}
              currentDance={processedData.predictedDance3}
              currentPos={predictedPos.indexOf(3)}
              coachDance={coachData.actualDance}
              coachPos={coachData.actualPositions}
            />
          </div>
          <div className="graph_wrapper">
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

        <div className="coach_wrapper">
          <CoachCard
            currentDance={coachData.actualDance}
            actualPositions={coachData.actualPositions}
            dancerDance={processedData.predictedDance}
            dancerPos={processedData.predictedPos}
          />
          <Button onClick={manualLogout}>TEST</Button>
        </div>
      </div>
    </div>
  );
};

export default DashboardScreen;
