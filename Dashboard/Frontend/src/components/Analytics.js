import DropdownButton from "react-bootstrap/DropdownButton";
import Dropdown from "react-bootstrap/Dropdown";
import "./Analytics.css";
import Stream from "./Stream";
import Line from "./Line";
import { useEffect, useState } from "react";

function Analytics({ emgData, gyro1Data, gyro2Data, gyro3Data }) {
  const [title, setTitle] = useState("Fatigue");
  const [dropdownItems, setDropdownItems] = useState([
    "Fatigue",
    "Gyroscope 1",
    "Accelerometer 1",
    "Gyroscope 2",
    "Accelerometer 2",
    "Gyroscope 3",
    "Accelerometer 3",
  ]);

  const handleChange = (item) => {
    setTitle(item);
  };

  const renderGraph = (choice) => {
    switch (choice) {
      case "Fatigue":
        return (
          <Stream data={emgData} keys={["Dancer1", "Dancer2", "Dancer3"]} />
        );
      case "Gyroscope 1":
        return <Stream data={gyro1Data} keys={["x", "y", "z"]} />;
      case "Gyroscope 2":
        return <Stream data={gyro2Data} keys={["x", "y", "z"]} />;
      case "Gyroscope 3":
        return <Stream data={gyro3Data} keys={["x", "y", "z"]} />;
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
