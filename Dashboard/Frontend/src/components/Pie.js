import { ResponsivePie } from "@nivo/pie";

function Pie({ data }) {
  return (
    <ResponsivePie
      data={data}
      margin={{ top: 40, right: 100, bottom: 40, left: 100 }}
      innerRadius={0.4}
      padAngle={3}
      cornerRadius={3}
      activeOuterRadiusOffset={8}
      borderWidth={1}
      borderColor={{ from: "color", modifiers: [["darker", 0.2]] }}
      arcLinkLabelsSkipAngle={10}
      arcLinkLabelsTextColor="#333333"
      arcLinkLabelsThickness={2}
      arcLinkLabelsColor={{ from: "color" }}
      arcLabelsSkipAngle={10}
      arcLabelsTextColor={{ from: "color", modifiers: [["darker", 2]] }}
    />
  );
}

export default Pie;
