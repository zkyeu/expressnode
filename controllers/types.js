/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-27 08:52:10
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/types.js');

const typeController = {
  // showUser 获取用户数据并返回到页面
  getType: async function(req,res,next){
    try{
      let objList = await item
      .selects(['id', 'typename', 'aliasname', 'typesort'], {'show':1},{})
      .orderBy([{
        column: 'typesort',
        order: 'asc'
      }]);
      let obj =  objList.map((item,index) => {
        return {
          ...item,
          operate: [
            {
              name: '查看内容',
              type: 'view',
            },
            {
              name: '编辑',
              type: 'edit',
            },
            {
              name: '删除',
              type: 'delete',
            }
          ]
        }
      });
      res.json({
        errNo: 0,
        message: "获取成功",
        data: obj
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
  getDiyType: async function(req,res,next){
    try{
      let objList = await item
      .selects(['id', 'typename', 'aliasname'], {'show':1},{})
      .orderBy([{
        column: 'typesort',
        order: 'asc'
      }]);
      res.json({
        errNo: 0,
        message: "获取成功",
        data: objList
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
  // 创建分类
  insertType: async (req,res,next) => {
    let obj = req.body;
    if (!obj.typename) return res.json({ errNo: -1, message: "缺少参数信息～" });
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
  // 删除分类
  deleteType: async (req,res,next) => {
    let obj = req.body;
    try{
      await item.delete(obj.id);
      res.json({
        errNo: 0,
        message: "删除分类成功"
      })
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },

  // 更新分类信息
  updateItem: async (req,res,next) => {
    const { id } = req.body;
    console.log(req.body);
    // if (!obj.typename) return res.json({ errNo: -3, message: "缺少参数信息～" });
    try{
      await item.update({'id': id}, req.body);
      res.json({
        errNo: 0,
        message: "编辑成功～"
      })
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
}

module.exports = typeController;
