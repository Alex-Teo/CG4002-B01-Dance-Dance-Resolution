import axios from "axios";
import MUIDataTable from "mui-datatables";
import { useState, useEffect } from "react";

import Button from "react-bootstrap/Button";

import Pie from "../components/Pie";

import "./HistoryTable.css";

function HistoryTable() {
  const [historyData, setHistoryData] = useState([]);
  const [modal, setModal] = useState(false);
  const [modalRes, setModalRes] = useState([]);
  const [dances, setDances] = useState([]);
  const [uniqueDances, setUniqueDances] = useState([]);
  const [aveSyncDelay, setAveSyncDelay] = useState([]);
  const [accList, setAccList] = useState([]);
  const [pieData, setPieData] = useState({});

  function getMode(array) {
    if (array.length == 0) return null;
    var modeMap = {};
    var maxEl = array[0],
      maxCount = 1;
    for (var i = 0; i < array.length; i++) {
      var el = array[i];
      if (modeMap[el] == null) modeMap[el] = 1;
      else modeMap[el]++;
      if (modeMap[el] > maxCount) {
        maxEl = el;
        maxCount = modeMap[el];
      }
    }
    return maxEl;
  }

  function getAveSync(array) {
    var sum = 0;
    array.forEach(function (item) {
      sum += Number(item.syncDelay);
    });
    return sum.toFixed(2);
  }

  function getAccuracy(array) {
    var mode = "";
    var accuracy = [0, 0, 0];
    array.forEach(function (item) {
      mode = getMode([
        item.predictedDance1,
        item.predictedDance2,
        item.predictedDance3,
      ]);
      if (item.predictedDance1 === mode) accuracy[0] += 1;
      if (item.predictedDance2 === mode) accuracy[1] += 1;
      if (item.predictedDance3 === mode) accuracy[2] += 1;
    });
    return accuracy;
  }

  function getPieData(array) {
    const map = {
      Window360: 0,
      Cowboy: 0,
      Scarecrow: 0,
      JamesBond: 0,
      Snake: 0,
      Dab: 0,
      Mermaid: 0,
      Pushback: 0,
      Logout: 0,
    };
    array.forEach(function (item) {
      var mode = getMode([
        item.predictedDance1,
        item.predictedDance2,
        item.predictedDance3,
      ]);
      map[mode] += 1;
    });
    return map;
  }

  const handleRowClick = (rowData, rowMeta) => {
    var id = rowData[0];
    axios.get(`http://localhost:5000/api/history/${id}`).then((res) => {
      toggleModal();
      console.log(res.data[0]);
      setModalRes(res.data[0]);
      var dancesList = res.data[0].overallProcessedData.map(
        (item) => item.predictedDance1
      );
      var uniqueDancesSet = new Set(dancesList);
      setDances(dancesList);
      setUniqueDances(uniqueDancesSet);
      setAveSyncDelay(getAveSync(res.data[0].overallProcessedData));
      setAccList(getAccuracy(res.data[0].overallProcessedData));
      setPieData(getPieData(res.data[0].overallProcessedData));
    });
  };

  const toggleModal = () => {
    setModal(!modal);
  };

  const tableColumns = [
    {
      name: "_id",
      label: "ID",
      options: {
        filter: false,
        sort: true,
        display: false,
      },
    },
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
      label: "Duration (sec)",
      options: {
        filter: false,
        sort: true,
      },
    },
    {
      name: "",
      options: {
        customBodyRender: (value, tableMeta, updateValue) => {
          return (
            <Button className="option_btn" variant="outline-success">
              View
            </Button>
          );
        },
        sort: false,
      },
    },
  ];

  const tableOptions = {
    filterType: "checkbox",
    tableBodyHeight: "500px",
    tableBodyMaxHeight: "500px",
    selectableRows: "none",
    expandableRowsOnClick: true,
    onRowClick: handleRowClick,
  };

  useEffect(() => {
    axios.get("http://localhost:5000/api/history").then((res) => {
      var result = res.data;
      setHistoryData(result);
    });
  }, []);
  return (
    <div>
      <div
        className={modal ? "history_bg" : "history_bg_hidden"}
        onClick={() => toggleModal()}
      ></div>
      <div className={modal ? "history_modal" : "history_modal_hidden"}>
        <div className="modal_header">
          <div className="modal_header_component">
            <div className="sub_header">Date</div> <br />
            {modalRes.date}
          </div>
          <div className="modal_header_component">
            <div className="sub_header">Time</div>
            <br />
            {modalRes.time}
          </div>
          <div className="modal_header_component">
            <div className="sub_header">Session Duration</div>
            <br />
            {modalRes.duration}s
          </div>
        </div>
        <div className="modal_content">
          <div className="modal_content_1">
            <div className="sub2_header">Dances Performed</div>
            <Pie
              data={[
                {
                  id: "Window360",
                  label: "Window360",
                  value: pieData["Window360"],
                  color: "hsl(213, 70%, 50%)",
                },
                {
                  id: "Cowboy",
                  label: "Cowboy",
                  value: pieData["Cowboy"],
                  color: "hsl(30, 70%, 50%)",
                },
                {
                  id: "Scarecrow",
                  label: "Scarecrow",
                  value: pieData["Scarecrow"],
                  color: "hsl(114, 70%, 50%)",
                },
                {
                  id: "JamesBond",
                  label: "JamesBond",
                  value: pieData["JamesBond"],
                  color: "hsl(198, 70%, 50%)",
                },
                {
                  id: "Snake",
                  label: "Snake",
                  value: pieData["Snake"],
                  color: "hsl(117, 70%, 50%)",
                },
                {
                  id: "Dab",
                  label: "Dab",
                  value: pieData["Dab"],
                  color: "hsl(104, 70%, 50%)",
                },
                {
                  id: "Mermaid",
                  label: "Mermaid",
                  value: pieData["Mermaid"],
                  color: "hsl(98, 70%, 50%)",
                },
                {
                  id: "Pushback",
                  label: "Pushback",
                  value: pieData["Pushback"],
                  color: "hsl(120, 70%, 50%)",
                },
                // {
                //   id: "Logout",
                //   label: "Logout",
                //   value: pieData["Logout"],
                //   color: "hsl(147, 70%, 50%)",
                // },
              ]}
            />
          </div>
          <div className="modal_content_1">
            <div className="sub2_header">Dance Difficulty</div>
          </div>
          <div className="modal_content_1">
            <div className="sub2_header">Most Frequent Dance</div>
            <br />
            {getMode(dances)}
            <div className="sub2_header">Average Sync Delay</div>
            <br />
            {aveSyncDelay}s<div className="sub2_header">Dancer Accuracy</div>
            <br />
            Dancer 1 - {(accList[0] / dances.length) * 100}%
            <br />
            Dancer 2 - {(accList[1] / dances.length) * 100}%
            <br /> Dancer 3 - {(accList[2] / dances.length) * 100}%
          </div>
        </div>
      </div>
      <MUIDataTable
        className="history_table"
        // title={"History"}
        data={historyData}
        columns={tableColumns}
        options={tableOptions}
      />
    </div>
  );
}

export default HistoryTable;
