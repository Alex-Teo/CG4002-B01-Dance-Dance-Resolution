import "./History.css";
import axios from "axios";

import ScreenHeader from "../components/ScreenHeader";
import { useState, useEffect } from "react";

import MUIDataTable from "mui-datatables";

function HistoryScreen() {
  const [historyData, setHistoryData] = useState([]);

  const tableColumns = [
    {
      name: "date",
      label: "Date",
      options: {
        filter: false,
        sort: true,
      },
    },
    {
      name: "time",
      label: "Time",
      options: {
        filter: false,
        sort: true,
      },
    },
    {
      name: "duration",
      label: "Duration",
      options: {
        filter: false,
        sort: true,
      },
    },
  ];

  const tableOptions = {
    filterType: "checkbox",
  };

  useEffect(() => {
    axios.get("http://localhost:5000/api/history").then((res) => {
      var result = res.data;
      setHistoryData(result);
    });
  }, []);

  return (
    <div>
      <ScreenHeader
        screenTitle="History"
        screenDesc="A trip back to the past"
      />
      <MUIDataTable
        // title={"Employee List"}
        data={historyData}
        columns={tableColumns}
        options={tableOptions}
      />
    </div>
  );
}

export default HistoryScreen;
