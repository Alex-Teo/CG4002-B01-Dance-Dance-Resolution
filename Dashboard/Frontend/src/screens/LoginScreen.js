import "./LoginScreen.css";
import loginPhoto from "../images/loginPhoto.jpg";
import blob1 from "../images/blob1.svg";
import blob2 from "../images/blob2.svg";

import Register from "../components/Register";
import SignIn from "../components/SignIn";
import { useState } from "react";

function LoginScreen() {
  const [signIn, setSignIn] = useState(true);

  const toggleForm = () => {
    setSignIn(!signIn);
  };

  return (
    <div className="login_wrapper">
      <div className="login_photo">
        <img src={loginPhoto} alt="LoginPhoto" />
      </div>
      <div className="login_form_wrapper">
        <img className="blob1" src={blob1} alt="blob" />
        <img
          className="blob2"
          src={blob2}
          onClick={() => toggleForm()}
          alt="blob"
        />
        <div className="login_form">{signIn ? <SignIn /> : <Register />}</div>
      </div>
    </div>
  );
}

export default LoginScreen;
