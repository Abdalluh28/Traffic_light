const User = require("../models/user");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const register = async (req, res) => {
    const { firstName, lastName, email, password} = req.body;

    if(!firstName || !lastName || !email || !password) {
        res.status(401).json({error: "All fields are required"});
    }

    const existingUser = await User.findOne({email}).exec();
    if(existingUser) {
        res.status(401).json({error: "User already exists"});
    }
    
    const hashedPassword = await bcrypt.hash(password, 20);

    const newUser = await User.create({
        firstName, lastName, email, password: hashedPassword
    })


    const accessToken = jwt.sign({
        userInfo: {
            id: newUser._id,
        }
    }, process.env.ACCESS_TOKEN_SECRET, {expiresIn: "15m"});

    const refreshToken = jwt.sign({
        userInfo: {
            id: newUser._id,
        }
    }, process.env.REFRESH_TOKEN_SECRET, {expiresIn: "7d"});


    res.cookie('jwt', refreshToken, {
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'None',
        maxAge: 7 * 24 * 60 * 60 * 1000
    })

    return res.json({
        accessToken,
        firstName: newUser.firstName
    })
}


const login = async (req, res) => {
    const {email, password} = req.body;

    if(!email || !password) {
        res.status(401).json({error: "All fields are required"});
    }

    const existingUser = await User.findOne({email}).exec();
    if(!existingUser) {
        res.status(401).json({error: "User does not exist"});
    }

    const isPasswordCorrect = await bcrypt.compare(password, existingUser.password);
    if(!isPasswordCorrect) {
        res.status(401).json({error: "Incorrect password"});
    }


    const accessToken = jwt.sign({
        userInfo: {
            id: existingUser._id,
        }
    }, process.env.ACCESS_TOKEN_SECRET, {expiresIn: "15m"});

    const refreshToken = jwt.sign({
        userInfo: {
            id: existingUser._id,
        }
    }, process.env.REFRESH_TOKEN_SECRET, {expiresIn: "7d"});


    res.cookie('jwt', refreshToken, {
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        sameSite: 'None',
        maxAge: 7 * 24 * 60 * 60 * 1000
    })

    return res.json({
        accessToken,
        firstName: existingUser.firstName
    })
}


const refresh = async (req, res) => {
    const cookies = req.cookies;

    if(!cookies?.jwt) {
        return res.status(401).json({message: "Unauthorized"});
    }

    const refreshToken = cookies.jwt;

    jwt.verify(refreshToken, procees.env.REFRESH_TOKEN_SECRET, async (err, decoded) => {
        if(err) {
            return res.status(403).json({message: "Forbidden"});
        }

        const existingUser = await User.findById(decoded.userInfo.id).exec();

        if(!existingUser) {
            return res.status(404).json({message: "User not found"});
        }


        const accessToken = jwt.sign({
            userInfo: {
                id: existingUser._id,
            }
        })

        return res.json({accessToken, firstName: existingUser.firstName})
    })
}


const logout = async (req, res) => {
    const cookies = req.cookies;

    if(!cookies?.jwt) {
        return res.sendStatus(204);
    }

    res.clearCookie('jwt', {
        httpOnly: true,
        sameSite: 'None',
        secure: process.env.NODE_ENV === 'production',
    })


    return res.json({'message': 'Cookie cleared'});
}


module.exports = {
    register,
    login,
    refresh,
    logout
}