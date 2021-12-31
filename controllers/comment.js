/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2022-01-01 03:34:05
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
const moment = require('moment'); 
// 引用用户模版数据
const item = require('../models/comment.js');

const articleController = {
  
  getItem: async (req,res,next) => {
    const {aid, pn, rn} = req.body;
    try{
      let itemData = await item.selects(['*'],{aid: aid}, {pn: pn, rn: rn})
      .orderBy([{
        column: 'create_time',
        order: 'desc'
      }]);;
      res.json({
        errNo: 0,
        message: "操作成功",
        data: itemData
      });
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
  
  deleteItem: async (req,res,next) => {
    let obj = req.body;
    // console.log(obj.id);
    try{
      await item.delete(obj.id);
      res.json({
        errNo: 0,
        message: "操作成功"
      })
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
  insertItem: async (req,res,next) => {

    try {
      let obj = req.body;
      obj['create_time'] = moment().format('YYYY-MM-DD HH:mm:ss');
      let insertCon = await item.insert(obj);
      console.log(insertCon);
      return res.json({
        errNo: 0,
        message: "添加成功"
      });

    } catch (e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }


  },
  updateItem: async (req,res,next) => {
    const { id, article_id, body } = req.body;
    try {
      let count = await itemBody.update({aid: article_id}, { body: body });
      if (count) {
        try{
          let data = req.body
          delete data.body;
          delete data.id;
          delete data.article_id;
          await item.update({id: id}, data);
          return res.json({
            errNo: 0,
            message: "修改成功"
          });
        } catch(e) {
          res.json({ errNo: -1, message: "修改失败", data: e })
        }
      }
    } catch (e) {
      res.json({ errNo: -1, message: "编辑失败", data: e })
    }
  },
}

module.exports = articleController;
