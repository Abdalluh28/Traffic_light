
const User = require('../models/user');

const getAllUsers = async (req, res) => {
    const users = await User.find().select('-password').lean();

    if(!users) {
        return res.status(400).json({ message: 'No users found' });
    }

    res.json(users);
}


module.exports = { getAllUsers }