/*
 * @Author: your name
 * @Date: 2021-08-10 15:50:55
 * @LastEditTime: 2021-08-19 10:25:53
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/user.js
 */
const Base = require('./base');

class Article extends Base {
  // 定义参数默认值为 user 表
  constructor(props = 'types'){
    super(props);
  }
}

module.exports = new Article();