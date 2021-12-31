/*
 * @Author: your name
 * @Date: 2021-08-10 15:50:55
 * @LastEditTime: 2022-01-01 02:16:18
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/user.js
 */
const Base = require('./base');

class Comment extends Base {
  // 定义参数默认值为 user 表
  constructor(props = 'tbl_comment'){
    super(props);
  }
}

module.exports = new Comment();
