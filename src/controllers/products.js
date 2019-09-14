const modelProducts = require('../models/products')
const responses = require('../responses')

module.exports = {
  insertProduct: (req, res) => {
    const data = {
      name: req.body.name,
      description: req.body.description,
      image: req.body.image,
      id_category: req.body.id_category,
      quantity: req.body.quantity,
      date_added: new Date(),
      date_updated: new Date()
    }

    modelProducts.insertProduct(data)
      .then(result => {
        data.id = result.insertId
        return responses.dataManipulationResponse(res, 201, 'Success insert data', data)
      })
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 500, 'Failed to insert data', err)
      })
  },
  getAllProducts: (req, res) => {
    const keyword = req.query.search
    const sort = req.query.sortby || 'name'
    const page = req.query.page || 1
    const limit = req.query.limit || 6
    const skip = (Number(page) - 1) * limit

    modelProducts.getAllProducts(keyword, sort, skip, limit)
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length, page)
        else return responses.getDataResponse(res, 404, null, null, null, 'Products not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  getOneProduct: (req, res) => {
    const productid = req.params.productid

    modelProducts.getOneProduct(productid)
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length)
        else return responses.getDataResponse(res, 404, null, null, null, 'Product not found')
      })
      .catch(err => {
        console.log(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  addProduct: (req, res) => {
    const number = req.params.number
    const productid = req.params.productid
    modelProducts.addProduct(productid, number)
      .then(result => {
        if (result.length !== 0) res.json({status: "200", message: "Successfully add product quantity"})
        else return responses.getDataResponse(res, 404, null, null, null, 'Id not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, "Please field out the field")
      })
  },
  reduceProduct: (req, res) => {
    const number = req.params.number
    const productid = req.params.productid
    modelProducts.reduceProduct(productid, number)
      .then(result => {
        if (result.affectedRows > 0) res.json({status: "200", message: "Successfully reduce product quantity"})
        else return responses.getDataResponse(res, 404, null, null, null, 'Quantity data cannot be less than 0')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  updateProduct: (req, res) => {
    const productid = req.params.productid
    const data = {
      name: req.body.name,
      description: req.body.description,
      image: req.body.image,
      id_category: req.body.id_category,
      quantity: req.body.quantity,
      date_updated: new Date()
    }

  modelProducts.updateProduct(data, productid)
      .then(result => {
        data.productid = productid
        if (result.affectedRows !== 0) return responses.dataManipulationResponse(res, 200, 'Success updating product', data)
        else return responses.dataManipulationResponse(res, 404, 'Failed update', data)
      })
      .catch(err => {
        console.log(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  deleteProduct: (req, res) => {
    const productid = req.params.productid

    modelProducts.deleteProduct(productid)
      .then(result => {
        result.productid = productid
        if (result.affectedRows !== 0) return responses.dataManipulationResponse(res, 200, 'Success deleting product')
        else return responses.dataManipulationResponse(res, 404, 'Failed delete, data not found')
      })
      .catch(err => {
        console.log(err)
        return responses.dataManipulationResponse(res, 500, err)
      })
  }
}
