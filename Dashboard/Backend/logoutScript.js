require("dotenv").config();
const mongoose = require("mongoose");

// Import Models

const ProcessedData = require("./models/ProcessedData");

// Connect to MongoDB Atlas
mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const connection = mongoose.connection;
connection.on(
  "error",
  console.error.bind(console, "MongoDB: Connection error: ")
);

connection.once("open", async () => {
  console.log("MongoDB: Connected");
  console.log(" Sending logout request");
  logout();
});

// Fxn importData() used for testing -> importing of dummy data
const logout = async () => {
  try {
    await ProcessedData.insertOne({
      predictedDance1: "Logout",
      predictedDance2: "Logout",
      predictedDance3: "Logout",
      predictedPos: "1|2|3",
      syncDelay: 0,
    });
    process.exit();
  } catch (error) {
    console.error(" MongoDB: Error logout request", error);
    process.exit(1);
  }
};
