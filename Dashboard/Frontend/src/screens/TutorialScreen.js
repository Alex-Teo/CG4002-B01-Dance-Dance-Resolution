import "./TutorialScreen.css";
import ScreenHeader from "../components/ScreenHeader";
import Sidebar from "../components/Sidebar";
import { useState } from "react";
import ReactPlayer from "react-player";

function TutorialScreen() {
  const [vid, setVid] = useState();
  const [empty, setEmpty] = useState(true);
  const handleClick = (dance) => {
    setEmpty(false);
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
    <div>
      <Sidebar />
      <div className="tutorial_wrapper">
        <ScreenHeader
          screenTitle="Tutorial"
          screenDesc="To make you a beter dancer"
        />
        <div className="sub_tutorial_wrapper">
          {empty ? (
            <div className="inst">
              Choose <br /> Dance Move
            </div>
          ) : (
            <div className="video_wrapper">
              <ReactPlayer
                className="player"
                url={vid}
                height="80vh"
                width="30vw"
                volume={0}
                loop={true}
                playing={true}
              />
            </div>
          )}

          <div className="grid_wrapper">
            <div className="img_overlay">
              <div className="ovl">Cowboy</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/cowboy.jpg"
                alt="cowboy"
                onClick={() => handleClick("cowboy")}
              />
            </div>
            <div className="img_overlay">
              <div className="ovl">Dab</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/dab.jpg"
                alt="dab"
                onClick={() => handleClick("dab")}
              />
            </div>
            <div className="img_overlay">
              <div className="ovl">JamesBond</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/jamesbond.jpg"
                alt="jamesbond"
                onClick={() => handleClick("jamesbond")}
              />
            </div>

            <div className="img_overlay">
              <div className="ovl">Mermaid</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/mermaid.jpg"
                alt="mermaid"
                onClick={() => handleClick("mermaid")}
              />
            </div>

            <div className="img_overlay">
              <div className="ovl">Pushback</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/pushback.jpg"
                alt="pushback"
                onClick={() => handleClick("pushback")}
              />
            </div>

            <div className="img_overlay">
              <div className="ovl">Scarecrow</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/scarecrow.jpg"
                alt="scarecrow"
                onClick={() => handleClick("scarecrow")}
              />
            </div>

            <div className="img_overlay">
              <div className="ovl">Snake</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/snake.jpg"
                alt="snake"
                onClick={() => handleClick("snake")}
              />
            </div>
            <div className="img_overlay">
              <div className="ovl">Window360</div>
              <img
                className="thumbnail_img"
                src="thumbnailimages/window360.png"
                alt="window360"
                onClick={() => handleClick("window360")}
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}

export default TutorialScreen;
