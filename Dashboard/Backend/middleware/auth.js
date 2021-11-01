require("dotenv").config();
const jwt = require("jsonwebtoken");

// Used to protect certain API routes
function auth(req, res, next) {
  const token = req.header("x-auth-token");

  // check for token
  if (!token)
    res.status(401).json({ message: "No token, authorization denied." });

  try {
    // verify token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);

    // Add user from payload
    req.user = decoded;
    next();
  } catch (e) {
    res.status(400).json({ message: "Token is not valid." });
  }
}

module.exports = auth;
