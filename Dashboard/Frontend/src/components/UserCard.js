import "./UserCard.css";
import { Card } from "react-bootstrap";
import { IoIosBody } from "react-icons/io";
import { CgStopwatch } from "react-icons/cg";

function UserCard({
  dancerId,
  currentDance,
  currentPos,
  delay,
  danceFlag,
  posFlag,
}) {
  return (
    <Card>
      <Card.Body>
        <Card.Title className="cardTitle">
          {dancerId} <br />
          <div className={posFlag ? "cardTitle_correct" : "cardTitle_wrong"}>
            (Pos: {currentPos})
          </div>
        </Card.Title>
        <Card.Text>
          <div className="miniCard">
            <IoIosBody className="bodyIcon" />
            <div>
              <div className="valueHeader">Your Dance</div>
              <div className={danceFlag ? "value_correct" : "value_wrong"}>
                {currentDance}
              </div>
            </div>
          </div>
          <div className="miniCard">
            <CgStopwatch className="stopwatchIcon" />
            <div>
              <div className="valueHeader">Delay</div>
              <div className="value">{delay}</div>
            </div>
          </div>
        </Card.Text>
      </Card.Body>
    </Card>
  );
}

export default UserCard;
