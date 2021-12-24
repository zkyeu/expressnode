/*
 * @Author: your name
 * @Date: 2021-08-10 15:50:55
 * @LastEditTime: 2021-12-24 00:23:32
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/user.js
 */
const Base = require('./base');

class Types extends Base {
  // 定义参数默认值为 user 表
  constructor(props = 'tbl_types'){
    super(props);
  }
}

module.exports = new Types();
