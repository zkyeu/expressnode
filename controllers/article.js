/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-12-23 15:41:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');
const itemBody = require('../models/articlebody.js');

const articleController = {
  // showUser 获取用户数据并返回到页面
  getItem: async (req,res,next) => {
    try{
      let articleData = await item.leftJoinFind(req.query.id);
      // console.log(articleData);
      res.json({
        errNo: 0,
        message: "操作成功",
        data: articleData
      })
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
      let insertCon = await itemBody.insert({body: req.body.body});
      if (insertCon[0]) {
        try{
          let data = req.body
          delete data.body;
          data.article_id = insertCon[0];
          await item.insert(data);
          return res.json({
            errNo: 0,
            message: "添加成功"
          });
        } catch(e) {
          res.json({ errNo: -1, message: "操作失败", data: e })
        }
      }

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
