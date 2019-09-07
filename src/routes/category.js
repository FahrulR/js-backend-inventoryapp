const express = require('express')
const Route = express.Router()

const CategoryController = require('../controllers/category')
const Auth = require('../helpers/auth')

Route
  .post('/', Auth.verifyTokenHelpers, CategoryController.insertCategory)
  .get('/', CategoryController.getAllCategory)
  .get('/:categoryid', CategoryController.getOneCategory)
  .patch('/:categoryid', Auth.verifyTokenHelpers, CategoryController.updateCategory)
  .delete('/:categoryid', Auth.verifyTokenHelpers, CategoryController.deleteCategory)

module.exports = Route
