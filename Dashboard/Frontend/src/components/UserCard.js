import "./UserCard.css";
import { Card } from "react-bootstrap";
import { IoIosBody } from "react-icons/io";
import { CgStopwatch } from "react-icons/cg";

function UserCard({ dancerId, currentDance, delay }) {
  return (
    <Card>
      <Card.Body>
        <Card.Title className="cardTitle">{dancerId}</Card.Title>
        <Card.Text>
          <div className="miniCard">
            <IoIosBody className="bodyIcon" />
            <div>
              <div className="valueHeader">Your Dance</div>
              <div className="value">{currentDance}</div>
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
