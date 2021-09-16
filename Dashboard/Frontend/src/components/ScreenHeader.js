import "./ScreenHeader.css";
import { useState, useEffect } from "react";

function ScreenHeader({ screenTitle, screenDesc }) {
  const [currentDateTime, setDateTime] = useState(new Date());
  const [currentDay, setDay] = useState("");
  const [currentTime, setTime] = useState("");
  const [currentDate, setDate] = useState("");

  useEffect(() => {
    const timerId = setInterval(refreshClock, 1000);
    return function cleanup() {
      clearInterval(timerId);
    };
  }, []);

  function refreshClock() {
    setDateTime(new Date());
    var dateArray = String(currentDateTime).split(" ");
    console.log(dateArray);
    setDay(dateArray[0]);
    setTime(dateArray[4]);
    setDate(dateArray[2] + " " + dateArray[1] + " " + dateArray[3]);
  }
  return (
    <div className="header">
      <div className="dashboardDesc">
        <h1>{screenTitle}</h1>
        <h2>{screenDesc}</h2>
      </div>
      <div className="timestamp">
        <h1>{currentDateTime.toLocaleTimeString()}</h1>
        <h2>{currentDate}</h2>
        <h2>{currentDay}</h2>
      </div>
    </div>
  );
}

export default ScreenHeader;
