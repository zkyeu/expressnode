/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-12-28 09:33:07
 * @LastEditors: Please set LastEditors
 * @Description: In Item Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const moment = require('moment'); 
const Item = require('../models/user.js');

const userController = {
  // showItem 获取用户数据并返回到页面
  showItem: async function(req,res,next){
    try{
      let userData = await Item.all()
      res.json({
        errNo: 0,
        message: "操作成功",
        data: userData
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
  getadminItem: async function(req,res,next){
    try{
      let objList = await Item
      .selects(['id', 'userid','realname', 'phone', 'email', 'registetime'],{})
      .where({'delete': 0})
      .orderBy([{
        column: 'registetime',
        order: 'desc'
      }]);
      res.json({
        errNo: 0,
        message: "获取成功",
        data: objList.map((item,index) => {
          return {
            ...item,
            operate: [
              {
                name: '查看',
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
        })
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
  insertItem: async (req,res,next) => {
    try{
      let data = req.body;
      let obj = {openid: data.openid, ...data};
      obj['create_time'] = moment().format('YYYY-MM-DD HH:mm:ss')
      console.log(data['userinfo']); return;
      // await Item.insert(obj);
      return res.json({
        errNo: 0,
        message: "添加成功"
      });
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
  
  // 物理删除
  deleteItem: async (req,res,next) => {
    let obj = req.body;
    try{
      await Item.delete(obj.id);
      res.json({
        errNo: 0,
        message: "删除成功"
      })
    }catch(e){
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
  // 逻辑删除
  setItem: async (req,res,next) => {
    const { id } = req.body;
    try{
      await Item.update({'id': id}, {'delete': 1});
      res.json({
        errNo: 0,
        message: "删除成功～"
      })
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
    // 更新分类信息
  updateItem: async (req,res,next) => {
    const { id } = req.body;
    try{
      await Item.update({'id': id}, req.body);
      res.json({
        errNo: 0,
        message: "编辑成功～"
      })
    } catch(e) {
      res.json({ errNo: -1, message: "操作失败", data: e })
    }
  },
}

module.exports = userController;
