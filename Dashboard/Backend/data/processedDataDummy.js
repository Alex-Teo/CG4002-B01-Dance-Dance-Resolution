const dancer1ProcessedDataDummy = [];
const dancer2ProcessedDataDummy = [];
const dancer3ProcessedDataDummy = [];
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

  const positions = ["1 2 3", "1 3 2", "2 1 3", "2 3 1", "3 2 1", "3 1 2"];
  const timestamp = Date.now();
  const actualDance = dances[Math.floor(Math.random() * dances.length)];
  const actualPositions =
    positions[Math.floor(Math.random() * positions.length)];

  for (var id = 0; id < 3; id++) {
    const userID = id;
    const predictedDance = dances[Math.floor(Math.random() * dances.length)];
    const syncDelay = Math.random().toPrecision(1);

    coachDataDummy.push({
      timestamp: timestamp,
      actualDance: actualDance,
      actualPositions: actualPositions,
      dancer1Feedback: `Please dance ${actualDance}`,
      dancer2Feedback: `Please dance ${actualDance}`,
      dancer3Feedback: `Please dance ${actualDance}`,
    });

    if (id == 0) {
      dancer1ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        predictedDance: predictedDance,
        syncDelay: syncDelay,
      });
    } else if (id == 1) {
      dancer2ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        predictedDance: predictedDance,
        syncDelay: syncDelay,
      });
    } else if (id == 2) {
      dancer3ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        predictedDance: predictedDance,
        syncDelay: syncDelay,
      });
    }
  }
}

module.exports = {
  dancer1ProcessedDataDummy,
  dancer2ProcessedDataDummy,
  dancer3ProcessedDataDummy,
  coachDataDummy,
};
