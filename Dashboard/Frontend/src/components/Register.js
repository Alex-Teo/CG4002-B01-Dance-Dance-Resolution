import "./Register.css";

import { FaLock } from "react-icons/fa";
import { MdMail } from "react-icons/md";

import Axios from "axios";
import { useState } from "react";

function Register() {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  const register = () => {
    Axios.post("http://localhost:5000/api/user", {
      email: email,
      password: password,
    }).then((response) => {
      console.log(response);
      console.log("User successfully registered!");
      window.location.href = "http://localhost:3000";
    });
  };

  return (
    <form className="reg_form">
      <div className="reg_text">Register</div>
      <div className="input_wrapper">
        <MdMail className="reg_icon" />
        <input
          className="reg_email"
          type="text"
          name="email"
          placeholder="Email"
          onChange={(e) => {
            setEmail(e.target.value);
          }}
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="reg_icon" />
        <input
          className="reg_pw"
          type="password"
          name="password"
          placeholder="Password"
          onChange={(e) => {
            setPassword(e.target.value);
          }}
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="reg_icon" />
        <input
          className="reg_pw"
          type="password"
          name="password"
          placeholder="Re-enter Password"
        />
      </div>

      <input
        className="reg_submit"
        type="button"
        value="Register"
        onClick={() => register()}
      />
    </form>
  );
}

export default Register;
