/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-11 17:35:55
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const handleArticle = require('../models/article.js');

const updateController = {
  // showUser 获取用户数据并返回到页面
  handleItem: async (req,res,next) => {
    const {id} = req.body;
    // console.log(id);
    // return
    // 校验insert信息
    // if (!obj.typename) return res.json({ errNo: -3, message: "缺少参数信息～" });
    try{
      await handleArticle.update(id, req.body);
      res.json({
        errNo: 0,
        message: "添加成功"
      })
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
}

module.exports = updateController;
