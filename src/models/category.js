const conn = require('../configs/db')

module.exports = {
  insertCategory: (data) => {
    return new Promise((resolve, reject) => {
      conn.query('INSERT category SET ?', data, (err, result) => {
        if (!err) { resolve(result) } else { reject(err) }
      })
    })
  },
  getAllCategory: () => {
    return new Promise((resolve, reject) => {
      conn.query('SELECT * FROM category order by name ', (err, result) => {
        if (!err) { resolve(result) } else { reject(err) }
      })
    })
  },
  getOneCategory: (categoryid) => {
    return new Promise((resolve, reject) => {
      conn.query('SELECT * FROM category WHERE id = ?', categoryid,
        (err, result) => {
          if (!err) { resolve(result) } else { reject(err) }
        })
    })
  },
  updateCategory: (categoryid, data) => {
    return new Promise((resolve, reject) => {
      conn.query('UPDATE category SET ? WHERE id = ?', [data, categoryid], (err, result) => {
        if (!err) { resolve(result) } else { reject(err) }
      })
    })
  },
  deleteCategory: (categoryid) => {
    return new Promise((resolve, reject) => {
      conn.query(`DELETE FROM category WHERE id = ?`, categoryid,
        (err, result) => {
          if (!err) { resolve(result) } else { reject(err) }
        })
    })
  }
}
