const jwt = require('jsonwebtoken');
const { User } = require('../Models/user');


const adminMiddleweres = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token')
        if (!token)
            return res.status(401).json({ msg: "No auth token, access denied!" })

        const verify = jwt.verify(token, 'passwordKey')
        if (!verify) return res.json({ msg: "Token verification failed! , authorization denied" })

        const user = User.findById(verify.id)

        if (user && user.type == 'user' || user.type == 'seller') {
            return res.json({
                msg: 'Your are not an admin'
            }).status(401)
        }

        req.user = verify.id
        req.token = token


        next()
    } catch (error) {
        res.json({ error: error.message }).status(500)
    }
}

module.exports = adminMiddleweres