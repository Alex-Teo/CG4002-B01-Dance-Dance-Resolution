const rawDataDummy = [];

for (var i = 0; i < 100; i++) {
  for (var id = 0; id < 3; id++) {
    const userID = id;
    const timestamp = Date.now();
    const aX = Math.random().toPrecision(4);
    const aY = Math.random().toPrecision(4);
    const aZ = Math.random().toPrecision(4);
    const gX = Math.random().toPrecision(4);
    const gY = Math.random().toPrecision(4);
    const gZ = Math.random().toPrecision(4);
    const emg = Math.random().toPrecision(3);

    rawDataDummy.push({
      userID: userID,
      timestamp: timestamp,
      aX: aX,
      aY: aY,
      aZ: aZ,
      gX: gX,
      gY: gY,
      gZ: gZ,
      emg: emg,
    });
  }
}

module.exports = rawDataDummy;
