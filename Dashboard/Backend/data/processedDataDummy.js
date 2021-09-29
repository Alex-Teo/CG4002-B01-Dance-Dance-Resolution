const dancer1ProcessedDataDummy = [];
const dancer2ProcessedDataDummy = [];
const dancer3ProcessedDataDummy = [];

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
  const timestamp = Date.now();
  const correctDance = dances[Math.floor(Math.random() * dances.length)];
  for (var id = 0; id < 3; id++) {
    const userID = id;
    const predictedDance = dances[Math.floor(Math.random() * dances.length)];
    const syncDelay = Math.random().toPrecision(1);
    if (id == 0) {
      dancer1ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        correctDance: correctDance,
        predictedDance: predictedDance,
        syncDelay: syncDelay,
      });
    } else if (id == 1) {
      dancer2ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        correctDance: correctDance,
        predictedDance: predictedDance,
        syncDelay: syncDelay,
      });
    } else if (id == 2) {
      dancer3ProcessedDataDummy.push({
        userID: userID,
        timestamp: timestamp,
        correctDance: correctDance,
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
};
