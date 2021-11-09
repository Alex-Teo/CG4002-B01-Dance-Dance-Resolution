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

    "Dancer 1 Accelerometer",
    "Dancer 1 Gyroscope",

    "Dancer 2 Accelerometer",
    "Dancer 2 Gyroscope",

    "Dancer 3 Accelerometer",
    "Dancer 3 Gyroscope",
  ];

  const [title, setTitle] = useState("EMG");

  const handleChange = (item) => {
    setTitle(item);
  };

  useEffect(() => {
    setTitle(title);
  });

  const renderGraph = (choice) => {
    switch (choice) {
      case "EMG":
        return <Stream data={emgArray} />;
      case "Dancer 1 Accelerometer":
        return <Line data={d1HandAcc} axis={"Accelerometer"} />;
      case "Dancer 1 Gyroscope":
        return <Line data={d1HandGyro} axis={"Gyroscope"} />;
      case "Dancer 2 Accelerometer":
        return <Line data={d2HandAcc} axis={"Accelerometer"} />;
      case "Dancer 2 Gyroscope":
        return <Line data={d2HandGyro} axis={"Gyroscope"} />;
      case "Dancer 3 Accelerometer":
        return <Line data={d3HandAcc} axis={"Accelerometer"} />;
      case "Dancer 3 Gyroscope":
        return <Line data={d3HandGyro} axis={"Gyroscope"} />;
      default:
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
