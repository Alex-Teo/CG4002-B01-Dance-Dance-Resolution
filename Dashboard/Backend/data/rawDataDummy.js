const d1RawHandDataDummy = [];
const d2RawHandDataDummy = [];
const d3RawHandDataDummy = [];

const d1RawChestDataDummy = [];
const d2RawChestDataDummy = [];
const d3RawChestDataDummy = [];

function generateData(id, tag) {
  return {
    userID: id,
    tag: tag,
    aX: Math.random().toPrecision(4),
    aY: Math.random().toPrecision(4),
    aZ: Math.random().toPrecision(4),
    gX: Math.random().toPrecision(4),
    gY: Math.random().toPrecision(4),
    gZ: Math.random().toPrecision(4),
  };
}

for (var i = 0; i < 10000; i++) {
  for (var id = 0; id < 3; id++) {
    switch (id) {
      case 0:
        d1RawHandDataDummy.push(generateData(id, "hand"));
        d1RawChestDataDummy.push(generateData(id, "chest"));
        break;
      case 1:
        d2RawHandDataDummy.push(generateData(id, "hand"));
        d2RawChestDataDummy.push(generateData(id, "chest"));
        break;
      case 2:
        d3RawHandDataDummy.push(generateData(id, "hand"));
        d3RawChestDataDummy.push(generateData(id, "chest"));
        break;
    }
  }
}

module.exports = {
  d1RawHandDataDummy,
  d2RawHandDataDummy,
  d3RawHandDataDummy,
  d1RawChestDataDummy,
  d2RawChestDataDummy,
  d3RawChestDataDummy,
};
