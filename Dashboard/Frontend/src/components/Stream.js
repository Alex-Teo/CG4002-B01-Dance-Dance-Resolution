import { ResponsiveStream } from "@nivo/stream";

function Stream() {
  return (
    <ResponsiveStream
      data={[
        {
          Dancer1: 97,
          Dancer2: 120,
          Dancer3: 23,
        },
        {
          Dancer1: 34,
          Dancer2: 103,
          Dancer3: 45,
        },
        {
          Dancer1: 80,
          Dancer2: 133,
          Dancer3: 52,
        },
        {
          Dancer1: 174,
          Dancer2: 87,
          Dancer3: 167,
        },
        {
          Dancer1: 145,
          Dancer2: 173,
          Dancer3: 189,
        },
        {
          Dancer1: 77,
          Dancer2: 166,
          Dancer3: 74,
        },
        {
          Dancer1: 191,
          Dancer2: 74,
          Dancer3: 130,
        },
        {
          Dancer1: 48,
          Dancer2: 178,
          Dancer3: 33,
        },
        {
          Dancer1: 54,
          Dancer2: 20,
          Dancer3: 198,
        },
      ]}
      keys={["Dancer1", "Dancer2", "Dancer3"]}
      margin={{ top: 50, right: 110, bottom: 50, left: 60 }}
      axisTop={null}
      axisRight={null}
      axisBottom={{
        orient: "bottom",
        tickSize: 5,
        tickPadding: 5,
        tickRotation: 0,
        legend: "",
        legendOffset: 36,
      }}
      axisLeft={{
        orient: "left",
        tickSize: 5,
        tickPadding: 5,
        tickRotation: 0,
        legend: "",
        legendOffset: -40,
      }}
      offsetType="silhouette"
      colors={{ scheme: "nivo" }}
      fillOpacity={0.85}
      borderColor={{ theme: "background" }}
      defs={[
        {
          id: "dots",
          type: "patternDots",
          background: "inherit",
          color: "#2c998f",
          size: 4,
          padding: 2,
          stagger: true,
        },
        {
          id: "squares",
          type: "patternSquares",
          background: "inherit",
          color: "#e4c912",
          size: 6,
          padding: 2,
          stagger: true,
        },
      ]}
      fill={[
        {
          match: {
            id: "Dancer2",
          },
          id: "dots",
        },
        {
          match: {
            id: "Dancer3",
          },
          id: "squares",
        },
      ]}
      dotSize={8}
      dotColor={{ from: "color" }}
      dotBorderWidth={2}
      dotBorderColor={{ from: "color", modifiers: [["darker", 0.7]] }}
      legends={[
        {
          anchor: "bottom-right",
          direction: "column",
          translateX: 100,
          itemWidth: 80,
          itemHeight: 20,
          itemTextColor: "#999999",
          symbolSize: 12,
          symbolShape: "circle",
          effects: [
            {
              on: "hover",
              style: {
                itemTextColor: "#000000",
              },
            },
          ],
        },
      ]}
    />
  );
}

export default Stream;
