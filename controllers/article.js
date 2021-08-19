/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-19 19:52:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');

const articleController = {
  // showUser 获取用户数据并返回到页面
  getItem: async (req,res,next) => {
    try{
      let articleData = await item.find(req.query.id);
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
    // let obj = req.body;
    try{
      await item.insert(req.body);
      return res.json({
        errNo: 0,
        message: "添加成功"
      });
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
  updateItem: async (req,res,next) => {
    const { id } = req.body;
    try{
      await item.update(id, req.body);
      res.json({
        errNo: 0,
        message: "编辑成功～"
      })
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
}

module.exports = articleController;
