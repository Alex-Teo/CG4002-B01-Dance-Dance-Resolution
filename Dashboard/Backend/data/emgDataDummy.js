const emgDataDummy = [];

for (var i = 0; i < 100; i++) {
  emgDataDummy.push({
    d1Emg: Math.random().toPrecision(4),
    d2Emg: Math.random().toPrecision(4),
    d3Emg: Math.random().toPrecision(4),
  });
}

module.exports = emgDataDummy;
