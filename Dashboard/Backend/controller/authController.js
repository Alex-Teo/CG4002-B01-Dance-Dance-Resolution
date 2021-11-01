require("dotenv").config();

const User = require("../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

//  @route  POST api/auth
//  @desc   Authenticate new user
//  @access Public
const authUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Simple validation
    if (!email || !password)
      return res.status(400).json({ message: "Please enter all fields" });

    // Check existing user
    User.findOne({ email }).then((user) => {
      if (!user)
        return res.status(400).json({ message: "User does not exist!" });

      // Validate password
      bcrypt.compare(password, user.password).then((isMatch) => {
        if (!isMatch)
          return res.status(400).json({ message: "Invalid credentials!" });
        jwt.sign(
          {
            id: user.id,
          },
          process.env.JWT_SECRET,
          { expiresIn: 3600 }, //1hr
          (err, token) => {
            if (err) throw err;
            res.json({
              token,
              user: {
                id: user.id,
                email: user.email,
              },
            });
          }
        );
      });
    });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

//  @route  GET api/auth/user
//  @desc   Get user data
//  @access Private
const getUserData = async (req, res) => {
  try {
    User.findById(req.user.id)
      .select("-password")
      .then((user) => res.json(user));
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = { authUser, getUserData };
