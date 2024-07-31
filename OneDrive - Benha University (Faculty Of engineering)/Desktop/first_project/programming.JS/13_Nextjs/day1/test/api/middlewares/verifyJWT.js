const jwt = require('jsonwebtoken');

const verifyJWT = (req, res, next) => {

    const authHeaders = req.headers.authorization || req.headers.Authorization;
    if(!authHeaders?.startsWith('Bearer ')) {
        res.json({'message': 'unauthorized'});
    }

    const token = authHeaders.split(' ')[1];

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, decoded) => {
        if(err) {
            res.json({'message': 'forbidden'});
        }


        const userId = decoded.UserInfo.id;

        next();
    })

}


module.exports = verifyJWT