import { ResponsiveBar } from "@nivo/bar";

function Bar({ data }) {
  return (
    <ResponsiveBar
      data={data}
      keys={[
        "window360",
        "cowboy",
        "scarecrow",
        "jamesbond",
        "snake",
        "dab",
        "mermaid",
        "pushback",
      ]}
      indexBy="dance"
      margin={{ top: 30, right: 20, bottom: 50, left: 150 }}
      padding={0.3}
      layout="horizontal"
      valueScale={{ type: "linear" }}
      indexScale={{ type: "band", round: true }}
      colors={{ scheme: "nivo" }}
      borderColor={{ from: "color", modifiers: [["darker", 1.6]] }}
      axisTop={null}
      axisRight={null}
      axisBottom={null}
      axisLeft={{
        tickSize: 5,
        tickPadding: 5,
        tickRotation: 0,
        legend: "Dance",
        legendPosition: "middle",
        legendOffset: -100,
      }}
      labelSkipWidth={12}
      labelSkipHeight={12}
      labelTextColor={{ from: "color", modifiers: [["darker", 1.6]] }}
    />
  );
}

export default Bar;
