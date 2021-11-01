import "./HistoryScreen.css";

import ScreenHeader from "../components/ScreenHeader";
import Sidebar from "../components/Sidebar";
import HistoryTable from "../components/HistoryTable";

function HistoryScreen() {
  return (
    <div>
      <Sidebar />
      <div className="history_wrapper">
        <ScreenHeader
          screenTitle="History"
          screenDesc="A trip back to the past"
        />
        <HistoryTable className="table_wrapper" />
      </div>
    </div>
  );
}

export default HistoryScreen;
