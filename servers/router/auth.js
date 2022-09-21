const { Router } = require('express');
const { User } = require('../Models/user')
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { auth } = require('../middlewares/auth');
const route = Router()

route.post('/signup', async (req, res) => {
    const { name, password, email } = req.body;
    console.log({ name, password, email })

    try {
        const existUser = await User.findOne({ email })
        if (existUser) {
            return res.status(400).json({
                msg: "User with same email already exists! "
            })
        }
        const hashedPassword = await bcryptjs.hash(password, 8)
        let user = new User({
            email,
            name,
            password: hashedPassword
        })
        user = await user.save()
        res.status(200).json(user)
    } catch (error) {
        res.status(400).json({ error: error.message })
    }
})

route.post('/signin', async (req, res) => {
    const { email, password } = req.body;

    try {
        const user = await User.findOne({ email: email })
        if (!user) return res.status(400).json({ msg: 'User with this email does not exits!' })

        const isMatch = await bcryptjs.compare(password, user.password)
        if (!isMatch) return res.status(400).json({ msg: 'Incorrect password!' }).status(400)

        const token = jwt.sign({ id: user._id }, 'passwordKey')
        res.status(200).json({ token, ...user._doc })

    } catch (error) {
        res.status(500).json({ error: error.message })
    }


})

route.get('/token', async (req, res) => {
    try {
        const token = req.header('x-auth-token')
        if (!token) return res.json(false)

        const verify = jwt.verify(token, 'passwordKey')
        if (!verify) return res.json(false)

        const user = await User.findById(verify.id);
        if (!user) return res.json(false)
        console.log(user)
        res.json(true)
    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})
route.get('/', auth, async (req, res) => {
    try {
        const user = await User.findById(req.user);
        setTimeout(() => {
            if (user) return res.json({ ...user._doc, token: req.token }).status(200)
            else return res.status(400).json({ error: 'error e kuy' })
        }, 2000)

    } catch (error) {
        res.status(500).json({ error: error.message })
    }
})
module.exports = route