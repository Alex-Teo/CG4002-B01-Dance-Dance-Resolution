import "./SignIn.css";

import Button from "react-bootstrap/Button";
import { FaLock } from "react-icons/fa";
import { MdMail } from "react-icons/md";
import Axios from "axios";
import { useState } from "react";

function SignIn() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const login = () => {
    Axios.post("http://localhost:5000/api/auth", {
      email: email,
      password: password,
    }).then((response) => {
      console.log(response);
      console.log("User successfully login!");
      window.location.href = "http://localhost:3000";
    });
  };
  return (
    <form className="signin_form">
      <div className="signin_text">Sign In</div>
      <div className="input_wrapper">
        <MdMail className="signin_icon" />
        <input
          className="signin_email"
          type="text"
          name="email"
          placeholder="Email"
          onChange={(e) => {
            setEmail(e.target.value);
          }}
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="signin_icon" />
        <input
          className="signin_pw"
          type="password"
          name="password"
          placeholder="Password"
          onChange={(e) => {
            setPassword(e.target.value);
          }}
        />
      </div>
      <input
        className="signin_submit"
        type="button"
        value="Login"
        onClick={() => login()}
      />
      <div className="split">
        <hr />
        <div className="or">or </div>
        <hr />
      </div>
      <Button className="goto_reg"> Register</Button>
    </form>
  );
}

export default SignIn;
