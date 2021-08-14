/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-15 01:03:52
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const Article = require('../models/article.js');

const articleController = {
  // showUser 获取用户数据并返回到页面
  handleItem: async (req,res,next) => {
    try{
      let articleData = await Article.find(req.query.id);
      res.json({
        errNo: 0,
        message: "操作成功",
        data: articleData
      })
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  }
}

module.exports = articleController;
