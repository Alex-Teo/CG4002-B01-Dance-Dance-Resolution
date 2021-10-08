import DropdownButton from "react-bootstrap/DropdownButton";
import Dropdown from "react-bootstrap/Dropdown";
import "./Analytics.css";
import Stream from "./Stream";
import { useEffect, useState } from "react";

function Analytics({ emgData }) {
  const [title, setTitle] = useState("Fatigue");
  const [dropdownItems, setDropdownItems] = useState([
    "Gyroscope",
    "Accelerometer",
  ]);

  const handleChange = (item) => {
    setTitle(item);
  };

  useEffect(() => {
    const options = ["Gyroscope", "Accelerometer", "Fatigue"];
    const index = options.indexOf(title);
    options.splice(index, 1);
    setDropdownItems(options);
  });

  return (
    <div className="analyticsWrapper">
      <DropdownButton id="dropdown" title={title}>
        {dropdownItems.map((item) => (
          <Dropdown.Item href="#/action-1" onClick={() => handleChange(item)}>
            {item}
          </Dropdown.Item>
        ))}
      </DropdownButton>
      <Stream data={emgData} />
    </div>
  );
}

export default Analytics;
