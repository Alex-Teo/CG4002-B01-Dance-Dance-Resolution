const processedDataDummy = [];
const coachDataDummy = [];

for (var i = 0; i < 100; i++) {
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

  const positions = [
    "1 | 2 | 3",
    "1 | 3 |  2",
    "2 | 1 | 3",
    "2 | 3 | 1",
    "3 | 2 | 1",
    "3 | 1 | 2",
  ];

  const actualDance = dances[Math.floor(Math.random() * dances.length)];
  const actualPositions =
    positions[Math.floor(Math.random() * positions.length)];
  const predictedPos = positions[Math.floor(Math.random() * positions.length)];

  coachDataDummy.push({
    actualDance: actualDance,
    actualPositions: actualPositions,
  });

  for (var id = 0; id < 3; id++) {
    const predictedDance = dances[Math.floor(Math.random() * dances.length)];
    const syncDelay = Math.random().toPrecision(1);

    processedDataDummy.push({
      predictedDance: predictedDance,
      predictedPos: predictedPos,
      syncDelay: syncDelay,
    });
  }
}

module.exports = {
  processedDataDummy,
  coachDataDummy,
};
