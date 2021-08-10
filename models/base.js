/*
 * @Author: your name
 * @Date: 2021-08-10 15:49:20
 * @LastEditTime: 2021-08-10 15:49:40
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/models/base.js
 */
const knex = require('../models/knex');

class Base{
  constructor(props){
    this.table = props;
  }

  // 查找
  all (){
    return knex(this.table).select();
  }

  // 新增
  insert (params){
    return knex(this.table).insert(params);
  }

  // 更改
  update (id, params){
    return knex(this.table).where('id', '=', id).update(params);
  }

  // 删除
  delete (id){
    return knex(this.table).where('id', '=', id).del();
  }

}

module.exports = Base;
