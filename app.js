require('dotenv').config()

const express = require('express')
const app = express()
const logger = require('morgan')
const cors = require('cors')
const bodyParser = require('body-parser')

const productsRoute = require('./src/routes/products')
const categoryRoute = require('./src/routes/category')
const userRoute = require('./src/routes/users')

app.listen(process.env.SERVER_PORT || 5000, () => {
  console.log(`Server is running `)
})

// user controllers input
app.use(cors())
app.use(logger('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

// url pages
app.use('/products', productsRoute)
app.use('/category', categoryRoute)
app.use('/users', userRoute)
