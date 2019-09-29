const express = require('express')
const Route = express.Router()

const ProductsController = require('../controllers/products')
const Auth = require('../helpers/auth')

Route
  // url pages and implementation routes
  .post('/', ProductsController.insertProduct)
  .get('/', ProductsController.getAllProducts)
  .patch('/:productid/add=:number', ProductsController.addProduct)
  .patch('/:productid/reduce=:number/', ProductsController.reduceProduct)
  .get('/:productid', ProductsController.getOneProduct)
  .patch('/:productid', ProductsController.updateProduct)
  .delete('/:productid', ProductsController.deleteProduct)

module.exports = Route
