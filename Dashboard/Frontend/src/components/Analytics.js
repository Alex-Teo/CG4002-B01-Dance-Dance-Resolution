import DropdownButton from "react-bootstrap/DropdownButton";
import Dropdown from "react-bootstrap/Dropdown";
import "./Analytics.css";
import Stream from "./Stream";
import Line from "./Line";

import { useEffect, useState } from "react";

function Analytics({
  d1HandAcc,
  d2HandAcc,
  d3HandAcc,
  d1HandGyro,
  d2HandGyro,
  d3HandGyro,
  emgArray,
}) {
  const dropdownItems = [
    "EMG",
    "Gyroscope 1",
    "Accelerometer 1",
    "Gyroscope 2",
    "Accelerometer 2",
    "Gyroscope 3",
    "Accelerometer 3",
  ];
  const [title, setTitle] = useState("Accelerometer 1");

  const handleChange = (item) => {
    setTitle(item);
  };

  const renderGraph = (choice) => {
    switch (choice) {
      case "EMG":
        return <Stream data={emgArray} />;
      case "Accelerometer 1":
        return <Line data={d1HandAcc} />;
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
