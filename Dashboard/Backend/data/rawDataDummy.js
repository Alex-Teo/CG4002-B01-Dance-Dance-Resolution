const dancer1RawDataDummy = [];
const dancer2RawDataDummy = [];
const dancer3RawDataDummy = [];

for (var i = 0; i < 100; i++) {
  const timestamp = Date.now();
  for (var id = 0; id < 3; id++) {
    const userID = id;
    const aX = Math.random().toPrecision(4);
    const aY = Math.random().toPrecision(4);
    const aZ = Math.random().toPrecision(4);
    const gX = Math.random().toPrecision(4);
    const gY = Math.random().toPrecision(4);
    const gZ = Math.random().toPrecision(4);
    let emg = 0;
    while (emg === 0) {
      emg = Math.random().toPrecision(3);
    }

    if (id == 0) {
      dancer1RawDataDummy.push({
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
    } else if (id == 1) {
      dancer2RawDataDummy.push({
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
    } else if (id == 2) {
      dancer3RawDataDummy.push({
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
}

module.exports = {
  dancer1RawDataDummy,
  dancer2RawDataDummy,
  dancer3RawDataDummy,
};
