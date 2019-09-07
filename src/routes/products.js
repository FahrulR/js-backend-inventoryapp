const express = require('express')
const Route = express.Router()

const ProductsController = require('../controllers/products')
const Auth = require('../helpers/auth')

Route
  // url pages and implementation routes
  .post('/', Auth.verifyTokenHelpers, ProductsController.insertProduct)
  .get('/', ProductsController.getAllProducts)
  .patch('/:productid/add=:number', ProductsController.addProduct)
  .patch('/:productid/reduce=:number/', ProductsController.reduceProduct)
  .get('/:productid', ProductsController.getOneProduct)
  .patch('/:productid', Auth.verifyTokenHelpers, ProductsController.updateProduct)
  .delete('/:productid', Auth.verifyTokenHelpers, ProductsController.deleteProduct)

module.exports = Route
