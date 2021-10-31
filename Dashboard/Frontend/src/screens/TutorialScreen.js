import "./TutorialScreen.css";
import ScreenHeader from "../components/ScreenHeader";
import { useState } from "react";
import ReactPlayer from "react-player";

function TutorialScreen() {
  const [vid, setVid] = useState();
  const handleClick = (dance) => {
    console.log(dance);
    switch (dance) {
      case "cowboy":
        setVid("/videos/cowboy.mp4");
        break;
      case "dab":
        setVid("/videos/dab.mp4");
        break;
      case "jamesbond":
        setVid("/videos/jamesbond.mp4");
        break;
      case "mermaid":
        setVid("/videos/mermaid.mov");
        break;
      case "pushback":
        setVid("/videos/pushback.mov");
        break;
      case "scarecrow":
        setVid("/videos/scarecrow.mov");
        break;
      case "snake":
        setVid("/videos/snake.mp4");
        break;
      case "window360":
        setVid("/videos/window360.mov");
        break;
    }
  };
  return (
    <div className="tutorial_wrapper">
      <ScreenHeader
        screenTitle="Tutorial"
        screenDesc="To make you a beter dancer"
      />
      <div className="sub_tutorial_wrapper">
        <div className="video_wrapper">
          <ReactPlayer
            url={vid}
            height="80vh"
            volume={0}
            loop={true}
            playing={true}
          />
        </div>
        <div className="grid_wrapper">
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="cowboy"
            onClick={() => handleClick("cowboy")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="dab"
            onClick={() => handleClick("dab")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="jamesbond"
            onClick={() => handleClick("jamesbond")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="mermaid"
            onClick={() => handleClick("mermaid")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="pushback"
            onClick={() => handleClick("pushback")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="scarecrow"
            onClick={() => handleClick("scarecrow")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="snake"
            onClick={() => handleClick("snake")}
          />
          <img
            className="thumbnail_img"
            src="https://via.placeholder.com/1024x768/eee?text=4:3"
            alt="window360"
            onClick={() => handleClick("window360")}
          />
        </div>
      </div>
    </div>
  );
}

export default TutorialScreen;
