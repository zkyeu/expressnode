/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2022-01-06 23:36:45
 * @LastEditors: Please set LastEditors
 * @Description: In Item Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const moment = require('moment'); 
const Item = require('../models/user.js');

const userController = {

  getItem: async function(req,res,next){
    try{
      let userData = await Item.all();
      res.json({
        errNo: 0,
        message: "操作成功",
        data: userData.map((item,index) => {
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
  filterItem: async function(req,res,next){
    let { openid } = req.body;
    try{
      let userData = await Item
      .selects(['*'],{openid: openid},{pn:1,rn:1})
      .orderBy([{
        column: 'create_time',
        order: 'desc'
      }]);
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
  getWechatUser: async function(req,res,next){
    console.log('2222222');
    let {openid} = req.body;
    try{
      let objList = await Item
      .selects(['*'],{openid: openid})
      .where({'status': 0})
      .orderBy([{
        column: 'create_time',
        order: 'desc'
      }]);
      res.json({
        errNo: 0,
        message: "获取成功",
        data: objList[0]
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
  insertItem: async (req,res,next) => {
    try{
      let data = req.body;
      let obj = {}
      if (data.origin === 'web') {
        obj = data;
      } else {
        obj = {openid: data.openid, ...data};
      }
      obj['create_time'] = moment().format('YYYY-MM-DD HH:mm:ss');
      // console.log(obj);
      // return;
      await Item.insert(obj);
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
    const { openid } = req.body;
    req.body['update_time'] = moment().format('YYYY-MM-DD HH:mm:ss');
    try{
      await Item.update({'openid': openid}, req.body);
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
