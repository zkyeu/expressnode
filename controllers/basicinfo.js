/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-12-24 11:18:55
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/basicinfo.js');
const baseController = {
  // showUser 获取用户数据并返回到页面
  getinfo: async function(req,res,next){
    try{
      let objList = await item.all().first();
      res.json({
        errNo: 0,
        message: "获取成功",
        data: objList
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },

  // 更新分类信息
  update: async (req,res,next) => {
    const { id } = req.body;
    // if (!obj.typename) return res.json({ errNo: -3, message: "缺少参数信息～" });
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

module.exports = baseController;
