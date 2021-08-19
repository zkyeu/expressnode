/*
 * @Author: your name
 * @Date: 2021-08-10 15:50:55
 * @LastEditTime: 2021-08-19 19:22:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/user.js
 */
const Base = require('./base');

class item extends Base {
  // 定义参数默认值为 user 表
  constructor(props = 'basicinfo'){
    super(props);
  }
}

module.exports = new item();
