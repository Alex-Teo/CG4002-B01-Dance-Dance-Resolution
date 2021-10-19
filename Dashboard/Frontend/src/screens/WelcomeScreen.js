import "./WelcomeScreen.css";
import Button from "react-bootstrap/Button";

function WelcomeScreen() {
  return (
    <div className="welcome_wrapper">
      <div className="welcome_text">Welcome</div>
      <div className="start_dancing_wrapper">
        <Button
          className="start_dancing_button"
          variant="primary"
          size="lg"
          href="/dashboard"
        >
          Let's Dance
        </Button>{" "}
      </div>
    </div>
  );
}

export default WelcomeScreen;
