require("dotenv").config();

const User = require("../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

//  @route  POST api/user
//  @desc   Register new user
//  @access Public
const getUser = async (req, res) => {
  try {
    const { email, password } = req.body;

    // Simple validation
    if (!email || !password)
      return res.status(400).json({ message: "Please enter all fields" });

    // Check existing user
    User.findOne({ email }).then((user) => {
      if (user)
        return res.status(400).json({ message: "User already exists!" });

      const newUser = new User({
        email,
        password,
      });

      // Create salt and hash
      bcrypt.genSalt(10, (err, salt) => {
        bcrypt.hash(newUser.password, salt, (err, hash) => {
          if (err) throw error;
          newUser.password = hash;
          newUser.save().then((user) => {
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
      });
    });
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

module.exports = getUser;
