import { useState, useEffect } from "react";
import { Accordion } from "react-bootstrap";
import { Line } from "react-chartjs-2";

// FIXME: Line graph still not working
function LineGraph({ data }) {
  var aXArray = [];
  var aYArray = [];
  var aZArray = [];

  const [acc, setAcc] = useState({
    aX: 0,
    aY: 0,
    aZ: 0,
  });

  useEffect(() => {
    setAcc(data);
    aXArray.push(acc.aX);
    aYArray.push(acc.aY);
    aZArray.push(acc.aZ);
    console.log(aXArray);
    console.log(aYArray);
    console.log(aZArray);
  }, [data]);
  return (
    <div>
      <Line
        data={{
          labels: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
          datasets: [
            {
              label: "Acc X",
              backgroundColor: "rgba(255,0,255,0.75)",
              data: aXArray,
            },
            {
              label: "Acc Y",
              backgroundColor: "rgba(255,255,0,0.75)",
              data: aYArray,
            },
            {
              label: "Acc Z",
              backgroundColor: "rgba(0,255,255,0.75)",
              data: aZArray,
            },
          ],
        }}
      />
    </div>
  );
}

export default LineGraph;
