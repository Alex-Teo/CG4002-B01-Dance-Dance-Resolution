require("dotenv").config();

const cors = require("cors");
const express = require("express");
const sensorDataRoute = require("./routes/sensorDataRoute");
const connectDB = require("./config/db");

connectDB();

const app = express();
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

app.use("/sensor", sensorDataRoute);

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
