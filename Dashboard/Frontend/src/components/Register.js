import "./Register.css";

import { FaLock } from "react-icons/fa";
import { MdMail } from "react-icons/md";

function Register() {
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
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="reg_icon" />
        <input
          className="reg_pw"
          type="text"
          name="password"
          placeholder="Password"
        />
      </div>
      <div className="input_wrapper">
        <FaLock className="reg_icon" />
        <input
          className="reg_pw"
          type="text"
          name="password"
          placeholder="Re-enter Password"
        />
      </div>

      <input className="reg_submit" type="submit" value="Register" />
    </form>
  );
}

export default Register;
