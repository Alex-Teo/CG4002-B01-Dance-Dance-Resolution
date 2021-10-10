import DropdownButton from "react-bootstrap/DropdownButton";
import Dropdown from "react-bootstrap/Dropdown";
import "./Analytics.css";
import Stream from "./Stream";
import Line from "./Line";
import { useEffect, useState } from "react";

function Analytics({
  d1HandAccArray,
  d2HandAccArray,
  d3HandAccArray,
  d1HandGyroArray,
  d2HandGyroArray,
  d3HandGyroArray,
  emgArray,
}) {
  const dropdownItems = [
    "Fatigue",
    "Gyroscope 1",
    "Accelerometer 1",
    "Gyroscope 2",
    "Accelerometer 2",
    "Gyroscope 3",
    "Accelerometer 3",
  ];
  const [title, setTitle] = useState("Fatigue");

  const handleChange = (item) => {
    setTitle(item);
  };

  const renderGraph = (choice) => {
    switch (choice) {
      case "Fatigue":
        console.log("emg2", emgArray);
        return <Stream data={emgArray} />;
    }
  };

  return (
    <div className="analyticsWrapper">
      <DropdownButton id="dropdown" title={title}>
        {dropdownItems.map((item) => (
          <Dropdown.Item onClick={() => handleChange(item)}>
            {item}
          </Dropdown.Item>
        ))}
      </DropdownButton>
      {renderGraph(title)}
    </div>
  );
}

export default Analytics;
