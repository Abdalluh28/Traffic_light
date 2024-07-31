require('dotenv').config();
const express = require('express');
const connectDB = require('./config/db');
const path = require('path');
const cors = require('cors');
const corsOptions = require('./config/corsOptions');
const cookieParser = require('cookie-parser');
const mongoose = require('mongoose');
const app = express();
const port = process.env.PORT || 3000;


connectDB();


app.use(cors(corsOptions));
app.use(cookieParser());
app.use(express.json());



app.use('/', express.static('./public/css'));
app.use('/', require('./routes/root'));
app.use('/auth', require('./routes/authRoutes'))
app.use('/users', require('./routes/userRoutes'))


mongoose.connection.once('open', () => {
    app.listen(port, () => {
        console.log(`Server is running on port ${port}`)
    })
})


mongoose.connection.on('error', () => {
    console.log('MongoDB connection failed')
})


app.all('*', (req, res) => {
    res.sendFile(path.join(__dirname, './views/404.html'))
})