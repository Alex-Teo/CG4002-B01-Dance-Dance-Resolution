const processedDataDummy = [];

for (var i = 0; i < 100; i++) {
  for (var id = 0; id < 3; id++) {
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
    const userID = id;
    const timestamp = Date.now();
    const correctDance = dances[Math.floor(Math.random() * dances.length)];
    const predictedDance = dances[Math.floor(Math.random() * dances.length)];
    const syncDelay = Math.random().toPrecision(1);
    processedDataDummy.push({
      userID: userID,
      timestamp: timestamp,
      correctDance: correctDance,
      predictedDance: predictedDance,
      syncDelay: syncDelay,
    });
  }
}

module.exports = processedDataDummy;
