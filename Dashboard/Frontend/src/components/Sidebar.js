import "./Sidebar.css";
import {
  ProSidebar,
  Menu,
  MenuItem,
  SubMenu,
  SidebarHeader,
  SidebarFooter,
  SidebarContent,
} from "react-pro-sidebar";
import "react-pro-sidebar/dist/css/styles.css";
import { GoGraph } from "react-icons/go";
import { FaHistory } from "react-icons/fa";
import { BiLogOut, BiUserCircle } from "react-icons/bi";
import { IoLogoApple } from "react-icons/io";

import logo from "../images/logo.png";

function Sidebar() {
  return (
    <ProSidebar>
      <SidebarHeader>
        <img src={logo} className="danceLogo" />
      </SidebarHeader>
      <SidebarContent>
        <Menu>
          <MenuItem icon={<BiUserCircle />} />
          <MenuItem icon={<GoGraph />} />
          <MenuItem icon={<FaHistory />} />
        </Menu>
      </SidebarContent>
      <SidebarFooter>
        <Menu>
          <MenuItem icon={<BiLogOut />} />
        </Menu>
      </SidebarFooter>
    </ProSidebar>
  );
}

export default Sidebar;
