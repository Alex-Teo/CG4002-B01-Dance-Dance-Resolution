import "./UserCard.css";
import { Card } from "react-bootstrap";
import { IoIosBody } from "react-icons/io";
import { CgStopwatch } from "react-icons/cg";

function UserCard({
  dancerId,
  syncDelay,
  currentDance,
  currentPos,
  coachDance,
  coachPos,
}) {
  return (
    <Card>
      <Card.Body>
        <Card.Title className="cardTitle">
          {dancerId} <br />
          <div className="cardTitleCorrect">(Pos: {currentPos})</div>
        </Card.Title>
        <Card.Text>
          <div className="miniCard">
            <IoIosBody className="bodyIcon" />
            <div>
              <div className="valueHeader">Your Dance</div>
              <div className="valueCorrect">{currentDance}</div>
            </div>
          </div>
          <div className="miniCard">
            <CgStopwatch className="stopwatchIcon" />
            <div>
              <div className="valueHeader">Delay</div>
              <div className="value">{syncDelay}</div>
            </div>
          </div>
        </Card.Text>
      </Card.Body>
    </Card>
  );
}

export default UserCard;
