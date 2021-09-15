import "./Dashboard.css";
import UserCard from "../components/UserCard";
import { useState, useEffect } from "react";

const MainDashboard = () => {
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
    <div>
      <div className="screenHeader">
        <div className="screenInfo">
          <h1>Dashboard</h1>
          <h2>A closer look at your performance</h2>
        </div>
        <div className="dateTime">
          <h1>{currentDateTime.toLocaleTimeString()}</h1>
          <h2>{currentDate}</h2>
          <h2>{currentDay}</h2>
        </div>
      </div>
      <div className="cardWrapper">
        <UserCard
          dancerId="Dancer 1"
          delay="Delay 1"
          currentDance="Dance 1"
          feedback="Feedback 1"
        />
        <UserCard
          dancerId="Dancer 2"
          delay="Delay 2"
          currentDance="Dance 2"
          feedback="Feedback 2"
        />
        <UserCard
          dancerId="Dancer 3"
          delay="Delay 3"
          currentDance="Dance 3"
          feedback="Feedback 3"
        />
      </div>
    </div>
  );
};

export default MainDashboard;
