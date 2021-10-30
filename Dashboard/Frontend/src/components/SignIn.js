import "./SignIn.css";

import Button from "react-bootstrap/Button";

function SignIn() {
  return (
    <form className="signin_form">
      <input
        className="signin_email"
        type="text"
        name="email"
        placeholder="Email"
      />
      <input
        className="signin_pw"
        type="text"
        name="password"
        placeholder="Password"
      />

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
