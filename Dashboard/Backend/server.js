require("dotenv").config();

const cors = require("cors");
const express = require("express");
const connectDB = require("./config/db");

connectDB();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Routes: Handling HTTP requests
const rawDataRoute = require("./routes/rawDataRoute");
const processedDataRoute = require("./routes/processedDataRoute");

app.use("/rawData", rawDataRoute);
app.use("/processedData", processedDataRoute);

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
