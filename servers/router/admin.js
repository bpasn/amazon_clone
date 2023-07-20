const { Router } = require('express');
const adminMiddleweres = require('../middlewares/admin');
const { Product } = require('../Models/product')

const adminRoute = Router()

adminRoute.post('/admin-add-product', adminMiddleweres, async (req, res) => {
    try {
        const { name, description, price, quantity, images, category } = req.body

        let product = new Product({
            name, description, price, quantity, images, category,
        })
        product = await product.save()

        res.json(product).status(200)


    } catch (error) {
        res.json({ error: error.message }).status(500)
    }
})
adminRoute.get('/admin-get-allproduct', adminMiddleweres, async (req, res) => {
    console.log("product")

    try {
        const product = await Product.find();
        setTimeout(() => {
            res.json(product).status(200)
        }, 2000);
    } catch (error) {
        res.json({ error: error.message }).status(500)
    }
})

module.exports = adminRoute;
