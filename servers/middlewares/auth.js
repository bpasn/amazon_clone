const jwt = require('jsonwebtoken');


const auth = async (req, res, next) => {
    try {
        const token = req.header('x-auth-token')
        console.log(token)
        if (!token)
            return res.status(401).json({ msg: "No auth token, access denied!" })

        const verify = jwt.verify(token, 'passwordKey')
        if (!verify) return res.json({ msg: "Token verification failed! , authorization denied" })
        
        req.user = verify.id
        req.token = token
        next()
    } catch (error) {
        res.json({ error: error.message }).status(500)
    }
}

module.exports = { auth }