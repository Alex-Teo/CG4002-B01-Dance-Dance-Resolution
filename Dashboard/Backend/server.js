require("dotenv").config();

const cors = require("cors");
const express = require("express");
const connectDB = require("./config/db");

const app = express();
const server = require("http").createServer(app);
const PORT = process.env.PORT || 5000;

app.use(cors());
app.use(express.json());

// Setup server-side socket.io
const io = require("socket.io")(server, {
  cors: {
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST"],
  },
});

// Function runs everytime a client connects to the server
io.on("connection", (socket) => {
  console.log("Socket.io client-server connection established", socket.id);
});

// Connect MongoDB
connectDB();

// Routes: Handling HTTP requests
const rawDataRoute = require("./routes/rawDataRoute");
const processedDataRoute = require("./routes/processedDataRoute");

app.use("/rawData", rawDataRoute);
app.use("/processedData", processedDataRoute);

server.listen(PORT, () => console.log(`Server running on port ${PORT}`));
