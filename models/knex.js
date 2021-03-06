/*
 * @Author: your name
 * @Date: 2021-08-10 15:42:57
 * @LastEditTime: 2022-01-25 09:59:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/knex.js
 */
const configs = require('../config/config');
// 把配置文件中的信息，设置在初始化配置中
module.exports = require('knex')({
  client: 'mysql',
  connection: {
    host: configs.mysql.host,
    port: configs.mysql.port,
    user: configs.mysql.user,
    password: configs.mysql.password,
    database: configs.mysql.database,
    charset: 'utf8mb4'
  },
  // 打印错误
  log: {
    error(message) {
      console.log('[knex error]', message);
    }
  }
});
