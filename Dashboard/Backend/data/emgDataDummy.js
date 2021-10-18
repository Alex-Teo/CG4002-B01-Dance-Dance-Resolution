const emgDataDummy = [];

for (var i = 0; i < 10000; i++) {
  emgDataDummy.push({
    emgMean: Math.random().toPrecision(4),
  });
}

module.exports = emgDataDummy;
