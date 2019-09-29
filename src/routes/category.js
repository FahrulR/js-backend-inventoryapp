const express = require('express')
const Route = express.Router()

const CategoryController = require('../controllers/category')
const Auth = require('../helpers/auth')

Route
  .post('/', CategoryController.insertCategory)
  .get('/', CategoryController.getAllCategory)
  .get('/:categoryid', CategoryController.getOneCategory)
  .patch('/:categoryid', CategoryController.updateCategory)
  .delete('/:categoryid',  CategoryController.deleteCategory)

module.exports = Route
