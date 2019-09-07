const modelCategory = require('../models/category')
const responses = require('../responses')

module.exports = {
  insertCategory: (req, res) => {
    const data = {
      name: req.body.name
    }
    modelCategory.insertCategory(data)
      .then(result => {
        data.id = result.insertId
        return responses.dataManipulationResponse(res, 201, 'Success add new category', data)
      })
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 500, 'Failed add new category', err)
      })
  },
  getAllCategory: (req, res) => {
    modelCategory.getAllCategory()
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length)
        else return responses.getDataResponse(res, 404, 0, 0, null, 'Category not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  getOneCategory: (req, res) => {
    const categoryid = req.params.categoryid
    modelCategory.getOneCategory(categoryid)
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length)
        else return responses.getDataResponse(res, 404, null, null, null, 'Category not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  updateCategory: (req, res) => {
    const categoryid = req.params.categoryid
    const data = {
      name: req.body.name
    }
    modelCategory.updateCategory(categoryid, data)
      .then(result => {
        data.categoryid = categoryid
        if (result.affectedRows !== 0) return responses.dataManipulationResponse(res, 200, 'Success update category', data)
        else return responses.dataManipulationResponse(res, 404, 'Failed to update category. id not found')
      })
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 500, err)
      })
  },
  deleteCategory: (req, res) => {
    const categoryid = req.params.categoryid

    modelCategory.deleteCategory(categoryid)
      .then(result => {
        if (result.affectedRows !== 0) return responses.dataManipulationResponse(res, 200, 'Success delete category', {
          categoryid
        })
        else return responses.dataManipulationResponse(res, 404, 'Failed to delete category. id not found', categoryid)
      })
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 500, err)
      })
  }
}