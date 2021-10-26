import "./CoachCard.css";

import { Card } from "react-bootstrap";
import { IoIosBody } from "react-icons/io";
import { IoChatbubbleOutline } from "react-icons/io5";

function CoachCard({ currentDance, actualPositions, dancerDance, dancerPos }) {
  return (
    <div>
      <div className="no_coach_overlay">
        <div className="no_coach_overlay_text">No Coach Selected</div>
      </div>
      <Card className="coach_card_wrapper">
        <Card.Body>
          <Card.Title className="card_title">Coach</Card.Title>
          <Card.Text>
            <div className="sub_card">
              <IoIosBody className="bodyIcon" />
              <div>
                <div className="value_title">Coach's Dance</div>
                <div className="value">{currentDance}</div>
              </div>
            </div>
            <div className="sub_card">
              <svg
                className="positionIcon"
                id="icons_Q2"
                data-name="icons Q2"
                xmlns="http://www.w3.org/2000/svg"
                width="48.505"
                height="44.905"
                viewBox="0 0 48.505 44.905"
              >
                <g id="Group_19" data-name="Group 19">
                  <circle
                    id="Ellipse_26"
                    data-name="Ellipse 26"
                    cx="6"
                    cy="6"
                    r="6"
                    transform="translate(0 32.905)"
                    fill="#2e417f"
                  />
                  <path
                    id="Path_16"
                    data-name="Path 16"
                    d="M24,31a6,6,0,1,0,6,6A6,6,0,0,0,24,31Zm0,8a2,2,0,1,1,2-2A2,2,0,0,1,24,39Z"
                    transform="translate(0.25 1.905)"
                    fill="#2e417f"
                  />
                  <circle
                    id="Ellipse_27"
                    data-name="Ellipse 27"
                    cx="6"
                    cy="6"
                    r="6"
                    transform="translate(36.5 32.905)"
                    fill="#2e417f"
                  />
                  <path
                    id="Path_17"
                    data-name="Path 17"
                    d="M40.932,19.6a2.237,2.237,0,0,0-1.723-.636,2.172,2.172,0,0,0-1.614.836,1.944,1.944,0,0,0,.222,2.7l4.45,3.9a2.278,2.278,0,0,0,3.115,0l4.45-3.9a2.123,2.123,0,0,0,.334-2.7,2.294,2.294,0,0,0-1.671-.839,2.36,2.36,0,0,0-1.777.639l-.667.6C45.8,10.259,36.639,2.379,25.58,2.6S5.755,11.059,6,21v2a2.121,2.121,0,0,0,2.225,2,2.121,2.121,0,0,0,2.225-2V21c-.276-7.732,6.472-14.2,15.074-14.45S41.323,12.368,41.6,20.1Z"
                    transform="translate(-2 -2.595)"
                    fill="#2e417f"
                  />
                </g>
              </svg>
              <div>
                <div className="value_title">Position</div>
                <div className="value" id="posValue">
                  <div>{actualPositions[0]}</div>
                  <div>{actualPositions[1]}</div>
                  <div>{actualPositions[2]}</div>
                </div>
              </div>
            </div>
            <div className="miniCard">
              <IoChatbubbleOutline className="feedbackIcon" />
              <div>
                <div className="value_title">Feedback</div>
                <div className="value" id="feedback_wrapper">
                  <div className="feedback_header">Dancer 1</div>
                  <div className="feedback_value">No Feedback</div>
                  <div className="feedback_header">Dancer 2</div>
                  <div className="feedback_value">No Feedback</div>
                  <div className="feedback_header">Dancer 3</div>
                  <div className="feedback_value">No Feedback</div>
                </div>
              </div>
            </div>
          </Card.Text>
        </Card.Body>
      </Card>
    </div>
  );
}

export default CoachCard;
