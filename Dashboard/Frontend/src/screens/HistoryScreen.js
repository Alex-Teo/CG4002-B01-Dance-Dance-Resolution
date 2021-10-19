import "./History.css";

import ScreenHeader from "../components/ScreenHeader";
import HistoryTable from "../components/HistoryTable";

function HistoryScreen() {
  return (
    <div className="history_wrapper">
      <ScreenHeader
        screenTitle="History"
        screenDesc="A trip back to the past"
      />
      <HistoryTable className="table_wrapper" />
    </div>
  );
}

export default HistoryScreen;
