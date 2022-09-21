const monogoose = require('mongoose');

const productSchema = monogoose.Schema({
    name: {
        type: String,
        require: true,
        trim: true
    },
    description: {
        type: String,
        require: true,
        trim: true
    },
    price: {
        type: Number,
        require: true,
        trim: true
    },
    quantity: {
        type: Number,
        require: true,
        trim: true
    },
    category: {
        type: String,
        require: true,
        trim: true
    },
    images: [
        {
            type: String,
            require: true
        }
    ]
})
const Product = monogoose.model('Product', productSchema)
module.exports = { Product }