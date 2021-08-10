/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-10 17:56:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const User = require('../models/user.js');

const userController = {
  // showUser 获取用户数据并返回到页面
  showUser: async function(req,res,next){
    try{
      let userData = await User.all()
      res.json({
        errNo: 0,
        message: "操作成功",
        data: userData
      })
    }catch(e){
      res.json({ code: 0, message: "操作失败", data: e })
    }
  },
}

module.exports = userController;
