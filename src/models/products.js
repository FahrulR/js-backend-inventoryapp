const conn = require('../configs/db')

module.exports = {
  insertProduct: (data) => {
    return new Promise((resolve, reject) => {
      conn.query('INSERT products SET ?', data,
        (err, result) => {
          if (!err) { resolve(result) } else { reject(err) }
        })
    })
  },
  getAllProducts: (keyword, sort, skip, limit) => {
    return new Promise((resolve, reject) => {
      let query = 'select id, name, description, image,(select name from category where products.id_category = category.id) as category, quantity, date_added, date_updated from products '
      if (keyword){
      conn.query(query + `where name like '%${keyword}%' order by ${sort} LIMIT ${skip}, ${limit}`, 
      (err, result) => {

        if (err) { reject(err) } else { resolve(result) }
      })
    } else {
      conn.query(query + ` order by ${sort} LIMIT ${skip}, ${limit}`, 
      (err, result) => {

        if (err) { reject(err) } else { resolve(result) }
      })
    }
    })
  },
  getOneProduct: (productid) => {
    return new Promise((resolve, reject) => {
      conn.query(`SELECT * FROM products WHERE id = ${productid}`,
        (err, result) => {
          if (!err) { resolve(result) } else { reject(err) }
        })
    })
  },
  addProduct: (productid,number) => {
    return new Promise((resolve, reject) => {
      conn.query(`UPDATE products SET quantity = quantity + ${number} where id = ${productid} `, 
      (err, result) => {
        if (err) { reject(err) } else { resolve(result) }
      })
    })
  },
  reduceProduct: (productid,number) => {
    return new Promise((resolve, reject) => {
      conn.query(`UPDATE products SET quantity = quantity - ${number} where id =  ${productid} AND quantity >= ${number}`, 
      (err, result) => {
        if (err) { reject(err) } else { resolve(result) }
      })
    })
  },
  updateProduct: (data, productid) => {
    return new Promise((resolve, reject) => {
      conn.query('UPDATE products SET ? WHERE id = ?', [data, productid], (err, result) => {
        if (!err) { resolve(result) } else { reject(err) }
      })
    })
  },
  deleteProduct: (data) => {
    return new Promise((resolve, reject) => {
      conn.query(`DELETE FROM products WHERE id = ${data}`,
        (err, result) => {
          if (!err) { resolve(result) } else { reject(err) }
        })
    })
  }
}
