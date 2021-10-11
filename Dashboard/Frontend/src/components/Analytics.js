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
  d1ChestAcc,
  d1ChestGyro,
}) {
  // FIXME: To add in relevant collections after week 9
  const dropdownItems = [
    // "EMG",

    "Dancer Chest Accelerometer",
    "Dancer Chest Gyroscope",

    // "Dancer 2 Accelerometer",
    // "Dancer 2 Gyroscope",

    // "Dancer 3 Accelerometer",
    // "Dancer 3 Gyroscope",
    "Dancer Hand Accelerometer",
    "Dancer Hand Gyroscope",
  ];
  const [title, setTitle] = useState("Dancer Hand Accelerometer");

  const handleChange = (item) => {
    setTitle(item);
  };

  // FIXME: To add in relevant collections after week 9
  const renderGraph = (choice) => {
    switch (choice) {
      // case "EMG":
      //   return <Stream data={emgArray} />;
      case "Dancer Chest Accelerometer":
        return <Line data={d1ChestAcc} axis={"Accelerometer"} />;
      case "Dancer Chest Gyroscope":
        return <Line data={d1ChestGyro} axis={"Gyroscope"} />;
      // case "Dancer 2 Accelerometer":
      //   return <Line data={d2HandAcc} axis={"Accelerometer"} />;
      // case "Dancer 2 Gyroscope":
      //   return <Line data={d2HandGyro} axis={"Gyroscope"} />;
      // case "Dancer 3 Accelerometer":
      //   return <Line data={d3HandAcc} axis={"Accelerometer"} />;
      // case "Dancer 3 Gyroscope":
      //   return <Line data={d3HandGyro} axis={"Gyroscope"} />;
      case "Dancer Hand Accelerometer":
        return <Line data={d1HandAcc} axis={"Accelerometer"} />;
      case "Dancer Hand Gyroscope":
        return <Line data={d1HandGyro} axis={"Gyroscope"} />;
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
