import "./History.css";
import axios from "axios";

import ScreenHeader from "../components/ScreenHeader";
import { useState, useEffect } from "react";

function HistoryScreen() {
  const [historyData, setHistoryData] = useState([]);

  useEffect(() => {
    axios.get("http://localhost:5000/api/history").then((res) => {
      setHistoryData(res.data);
    });
  }, []);

  return (
    <div>
      <ScreenHeader
        screenTitle="History"
        screenDesc="A trip back to the past"
      />
    </div>
  );
}

export default HistoryScreen;
