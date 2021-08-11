/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-11 16:51:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const deleteArticle = require('../models/article.js');

const deleteController = {
  // showUser 获取用户数据并返回到页面
  handleItem: async (req,res,next) => {
    let obj = req.body;
    // console.log(obj.id);
    try{
      await deleteArticle.delete(obj.id);
      res.json({
        errNo: 0,
        message: "操作成功"
      })
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
}

module.exports = deleteController;
