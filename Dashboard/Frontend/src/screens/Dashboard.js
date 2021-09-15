import "./Dashboard.css";
import UserCard from "../components/UserCard";

const MainDashboard = () => {
  return (
    <div className="dashboardWrapper">
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
  );
};

export default MainDashboard;
