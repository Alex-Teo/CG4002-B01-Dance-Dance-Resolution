import "./Dashboard.css";
import UserCard from "../components/UserCard";
import { useState } from "react";

const MainDashboard = () => {
  return (
    <div>
      <div className="screenHeader">
        <div className="screenInfo">
          <h1>Dashboard</h1>
          <h2>A closer look at your performance</h2>
        </div>
        <div className="dateTime">
          <h1>Time</h1>
          <h2>Date</h2>
          <h2>Day</h2>
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
