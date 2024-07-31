const mongoose = require('mongoose');

const connectDB = async () => {
    try {
        
        let url = process.env.MONGO_URL
        await mongoose.connect(url);
        console.log('MongoDB connected')

    } catch (error) {
        console.log(error.message)
    }
}


module.exports = connectDB