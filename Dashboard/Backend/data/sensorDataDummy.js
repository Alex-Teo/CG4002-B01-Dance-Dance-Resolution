const sensorDataDummy = [];

for (var i = 0; i < 1; i++) {
  const dances = [
    "Window360",
    "Cowboy",
    "Scarecrow",
    "JamesBond",
    "Snake",
    "Dab",
    "Mermaid",
    "Pushback",
  ];
  const danceVal1 = dances[Math.floor(Math.random() * dances.length)];
  const danceVal2 = dances[Math.floor(Math.random() * dances.length)];
  const danceVal3 = dances[Math.floor(Math.random() * dances.length)];

  const xVal1 = Math.random().toPrecision(4);
  const yVal1 = Math.random().toPrecision(4);
  const zVal1 = Math.random().toPrecision(4);

  const xVal2 = Math.random().toPrecision(4);
  const yVal2 = Math.random().toPrecision(4);
  const zVal2 = Math.random().toPrecision(4);

  const xVal3 = Math.random().toPrecision(4);
  const yVal3 = Math.random().toPrecision(4);
  const zVal3 = Math.random().toPrecision(4);

  sensorDataDummy.push({
    user1_dance: danceVal1,
    user1_x: xVal1,
    user1_y: yVal1,
    user1_z: zVal1,
    user2_dance: danceVal2,
    user2_x: xVal2,
    user2_y: yVal2,
    user2_z: zVal2,
    user3_dance: danceVal3,
    user3_x: xVal3,
    user3_y: yVal3,
    user3_z: zVal3,
  });
}

module.exports = sensorDataDummy;
