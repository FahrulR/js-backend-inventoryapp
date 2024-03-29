require('dotenv').config()
const modelUsers = require('../models/users')
const responses = require('../responses')

const isFormValid = (data, error) => {
  const Joi = require('@hapi/joi')
  const schema = Joi.object().keys({
    username: Joi.string().alphanum().min(3).max(30).required(),
    fullname: Joi.string().required(),
    password: Joi.string().min(8).required(),
    email: Joi.string().email({ minDomainSegments: 2 }).required(),
    level: Joi.string()
  })
  const result = Joi.validate(data, schema)
  if (error) {
    return result.error.details[0].message
  }
  if (result.error == null) return true
  else return false
}

const hash = (string) => {
  const crypto = require('crypto-js')
  return crypto.SHA256(string)
    .toString(crypto.enc.Hex)
}

module.exports = {
  registerUser: (req, res) => {
    const data = {
      username: req.body.username,
      fullname: req.body.fullname,
      password: req.body.password,
      email: req.body.email,
      level: 'regular'
    }

    if (!isFormValid(data)) {
      return responses.dataManipulationResponse(res, 400, isFormValid(data, true))
    }

    data.password = hash(data.password)

    modelUsers.getAllUserWithEmailorUsername(data.email, data.username)
      .then(result => {
        if (result.length === 0) return modelUsers.registerUser(data)
        else return responses.dataManipulationResponse(res, 400, 'Username or email already registered')
      })
      .then(result => responses.dataManipulationResponse(res, 201, 'Success registering new user', { userid: result.insertId, username: data.username }))
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 400, 'Failed register', err)
      })
  },
  getAllUser: (req, res) => {
    const keyword = req.query.search
    const sort = req.query.sortby
    const page = req.query.page || 1
    const limit = req.query.limit || 10
    const skip = (Number(page) - 1) * limit

    modelUsers.getAllUser(keyword, sort, skip, limit)
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length, null)
        else return responses.getDataResponse(res, 400, null, null, null, 'All users not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  getOneUser: (req, res) => {
    const userid = req.params.userid

    modelUsers.getOneUser(userid)
      .then(result => {
        if (result.length !== 0) return responses.getDataResponse(res, 200, result, result.length, null)
        else return responses.getDataResponse(res, 400, null, null, null, 'User not found')
      })
      .catch(err => {
        console.error(err)
        return responses.getDataResponse(res, 500, err)
      })
  },
  loginUser: (req, res) => {
    const email = req.body.email
    const hashedPassword = hash(req.body.password)
    console.log(hashedPassword)
    modelUsers.loginUser(email, hashedPassword)
      .then(result => {
        if (result.length !== 0) {
          console.log(result)
          const jwt = require('jsonwebtoken')
          const payload = {
            userid: result[0].userid,
            username: result[0].username,
            fullname: result[0].fullname,
            email: result[0].email,
            level: result[0].level
          }
          jwt.sign(payload, process.env.JWT_SECRET, (err, token) => {
            if (err) {
              console.error(err)
            }
            res.json({ token: `Bearer ${token}` })
          })
        } else { return responses.dataManipulationResponse(res, 400, 'Username or password is wrong') }
      })
      .catch(err => {
        console.error(err)
        return responses.dataManipulationResponse(res, 500, err)
      })
  },
  getUserProfile: (req, res) => {
    const userProfile = {
      userid: req.userid,
      username: req.username,
      fullname: req.fullname,
      email: req.email,
      level: req.level
    }
    return responses.getDataResponse(res, 200, userProfile)
  }
}
