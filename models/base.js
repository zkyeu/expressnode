/*
 * @Author: your name
 * @Date: 2021-08-10 15:49:20
 * @LastEditTime: 2021-08-26 20:04:28
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
  all () {
      return knex(this.table).select().limit(10);
  }
  // select * from `article` left join `articlebody` on `article`.`contentid` = `articlebody`.`aid`
  // 拼接查找
  leftJoinFind(id) {
    return knex(this.table).leftJoin('articlebody','article.contentid', 'articlebody.aid').where({ id }).first();
  }

  //按需查找
  find (id) {
    return knex(this.table).where({ id }).first();
  }

  selects (parmas,condition, pages) {
    return knex(this.table)
    .column(parmas)
    .select()
    .where(condition)
    .limit(pages.rn).offset((pages.rn * (pages.pn - 1)));
  }

  // 新增
  insert (params){
    return knex(this.table).insert(params);
  }

  // 更改
  update (id, params){
    return knex(this.table).where(id).update(params);
  }

  // 删除
  delete (id){
    return knex(this.table).where('id', '=', id).del();
  }
  // 计数
  count(parmas, condition) {
    return knex(this.table).count(parmas).where(condition);
  }
}

module.exports = Base;
