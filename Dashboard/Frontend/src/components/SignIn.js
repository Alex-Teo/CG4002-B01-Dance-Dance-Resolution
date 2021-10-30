import "./SignIn.css";

import Button from "react-bootstrap/Button";
import { FaUserAlt, FaLock } from "react-icons/fa";

function SignIn() {
  return (
    <form className="signin_form">
      <div className="input_wrapper">
        <FaUserAlt className="signin_icon" />
        <input
          className="signin_email"
          type="text"
          name="email"
          placeholder="Email"
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="signin_icon" />
        <input
          className="signin_pw"
          type="text"
          name="password"
          placeholder="Password"
        />
      </div>

      <input className="signin_submit" type="submit" value="Login" />
      <div className="split">
        <hr />
        <div className="or">or </div>
        <hr />
      </div>
      <Button className="goto_reg">Register</Button>
    </form>
  );
}

export default SignIn;
