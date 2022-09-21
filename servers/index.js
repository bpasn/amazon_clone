const express = require('express')
const AuthRoute = require('./router/auth')
const mongoose = require('mongoose');
const adminRoute = require('./router/admin');

const app = express()

app.use(express.json());
mongoose.connect('mongodb://admin:123456@localhost:27018/amasona_clone', {
    useNewUrlParser: true,
});
var db = mongoose.connection;
db.on('error', (e) => console.log('error : ' + e));
db.once('open', () => {
    console.log("Mongoose is ready , Service is runing to http://0.0.0.0:3012")
})
app.get('/', (req, res) => {
    res.json({'msg':"Server is ready"})
})
app.use('/api', AuthRoute)
app.use('/', adminRoute)

app.listen(process.env.PORT || 3012, "0.0.0.0", () => {
    console.log('listen port ', 3012)
})