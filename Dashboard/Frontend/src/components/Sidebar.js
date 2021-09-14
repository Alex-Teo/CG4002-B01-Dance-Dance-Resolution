// import { Navbar, Nav, Container } from "react-bootstrap";

import "boxicons";

import "./Sidebar.css";
import profilePlaceholder from "../images/profilePlaceholder.jpg";

function Sidebar() {
  const toggleNav = () => {
    let sb = document.getElementById("sidebar");
    sb.classList.toggle("open");
    menuBtnChange();
  };
  const menuBtnChange = () => {
    let sb = document.getElementById("sidebar");
    let mb = document.getElementById("btn");
    if (sb.classList.contains("open")) {
      mb.classList.replace("bx-menu", "bx-x");
    } else {
      mb.classList.replace("bx-x", "bx-menu");
    }
  };

  return (
    <div class="sidebar" id="sidebar">
      <div class="logoDetails">
        <i class="bx bx-menu" id="btn" onClick={toggleNav}></i>
      </div>
      <ul class="navList">
        <li>
          <a href="/dashboard">
            <i class="bx bx-line-chart"></i>
            <span class="linkName">Dashboard</span>
          </a>
          <span class="tooltip">Dashboard</span>
        </li>
        <li>
          <a href="/history">
            <i class="bx bx-time-five"></i>
            <span class="linkName">History</span>
          </a>
          <span class="tooltip">History</span>
        </li>
        <li class="profile">
          <div class="profileDetails">
            <img src={profilePlaceholder} />
            <div class="name_job">
              <div class="name">Amir Azhar</div>
              <div class="job">Dancing since 2021</div>
            </div>
          </div>
          <i class="bx bx-log-out" id="log_out"></i>
        </li>
      </ul>
    </div>
  );
}

export default Sidebar;
