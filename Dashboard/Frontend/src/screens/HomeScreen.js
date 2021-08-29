import "./HomeScreen.css";
import { useState, useEffect } from "react";
import axios from "axios";
import { Row, Col } from "react-bootstrap";
import UserCard from "../components/UserCard";

const HomeScreen = () => {
  const [state, setState] = useState({ data: [] });
  useEffect(() => {
    axios
      .get("http://localhost:5000/sensor/")
      .then((response) => {
        setState({ data: response.data });
      })
      .catch((error) => {
        console.log(error);
      });
  });
  return (
    <div>
      {state.data.map((current) => (
        <Row>
          <Col>
            <UserCard
              title="User1"
              dance={current.danceVal1}
              x={current.xVal1}
              y={current.yVal1}
              z={current.zVal1}
            />
          </Col>
          <Col>
            <UserCard
              title="User2"
              dance={current.danceVal2}
              x={current.xVal2}
              y={current.yVal2}
              z={current.zVal2}
            />
          </Col>
          <Col>
            <UserCard
              title="User3"
              dance={current.danceVal3}
              x={current.xVa3}
              y={current.yVal3}
              z={current.zVal3}
            />
          </Col>
        </Row>
      ))}
    </div>
  );
};

export default HomeScreen;
