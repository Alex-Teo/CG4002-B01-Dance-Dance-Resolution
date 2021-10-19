import axios from "axios";
import MUIDataTable from "mui-datatables";
import { useState, useEffect } from "react";

import "./HistoryTable.css";

function HistoryTable() {
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
    tableBodyHeight: "500px",
    tableBodyMaxHeight: "500px",
  };

  useEffect(() => {
    axios.get("http://localhost:5000/api/history").then((res) => {
      var result = res.data;
      setHistoryData(result);
    });
  }, []);
  return (
    <div>
      <MUIDataTable
        className="history_table"
        title={"History"}
        data={historyData}
        columns={tableColumns}
        options={tableOptions}
      />
    </div>
  );
}

export default HistoryTable;
