/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2022-01-29 01:22:04
 * @LastEditors: Please set LastEditors
 * @Description: In Item Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const moment = require('moment');
const Item = require('../models/user.js');
const QRCode = require('qrcode');
const bcrypt = require('bcryptjs');
const configs = require('../config/config');

const userController = {
  getItem: async function (req, res, next) {
    try {
      let userData = await Item.all();
      res.json({
        errNo: 0,
        message: '操作成功',
        data: userData.map((item, index) => {
          return {
            ...item,
            operate: [
              {
                name: '查看',
                type: 'view'
              },
              {
                name: '编辑',
                type: 'edit'
              },
              {
                name: '删除',
                type: 'delete'
              }
            ]
          };
        })
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  },
  filterItem: async function (req, res, next) {
    let { openid } = req.body;
    try {
      let userData = await Item.selects(['*'], { openid: openid }, { pn: 1, rn: 1 }).orderBy([
        {
          column: 'create_time',
          order: 'desc'
        }
      ]);
      res.json({
        errNo: 0,
        message: '操作成功',
        data: userData
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  },

  getadminItem: async function (req, res, next) {
    try {
      let objList = await Item.selects(['id', 'userid', 'realname', 'phone', 'email', 'registetime'], {})
        .where({ delete: 0 })
        .orderBy([
          {
            column: 'registetime',
            order: 'desc'
          }
        ]);
      res.json({
        errNo: 0,
        message: '获取成功',
        data: objList.map((item, index) => {
          return {
            ...item,
            operate: [
              {
                name: '查看',
                type: 'view'
              },
              {
                name: '编辑',
                type: 'edit'
              },
              {
                name: '删除',
                type: 'delete'
              }
            ]
          };
        })
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  },

  getWechatUser: async function (req, res, next) {
    console.log('2222222');
    let { openid } = req.body;
    try {
      let objList = await Item.selects(['*'], { openid: openid })
        .where({ status: 0 })
        .orderBy([
          {
            column: 'create_time',
            order: 'desc'
          }
        ]);
      res.json({
        errNo: 0,
        message: '获取成功',
        data: objList[0]
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  },

  insertItem: async (req, res, next) => {
    try {
      let data = req.body;
      let obj = {};
      if (data.origin === 'web') {
        obj = data;
      } else {
        obj = { openid: data.openid, ...data };
      }
      obj['create_time'] = moment().format('YYYY-MM-DD HH:mm:ss');
      // 判断数据内是否有该用户，如果有则返回提示，没有则进行注册
      let userDatas = await Item.find({
        key: 'userName',
        value: data.userName
      });
      // console.log(userData.userName.length);
      if (userDatas.userName) {
        return res.json({
          errNo: 1,
          message: '用户名称已存在，请直接登录或更换用户名注册'
        });
      } else {
        console.log('a');
        // bcrypt.hash(req.body.password, 10, (err, hash) => {
        //   if (err) {
        //     return res.json({
        //       errNo: 500,
        //       message: err
        //     });
        //   } else {
        //     obj['password'] = hash;
        //     Item.insert(obj);
        //     return res.json({
        //       errNo: 0,
        //       message: '添加成功'
        //     });
        //   }
        // });
      }
    } catch (e) {
      res.json({ errNo: 401, message: '操作失败', data: e });
    }
  },

  // 物理删除
  deleteItem: async (req, res, next) => {
    let obj = req.body;
    try {
      await Item.delete(obj.id);
      res.json({
        errNo: 0,
        message: '删除成功'
      });
    } catch (e) {
      res.json({ errNo: -1, message: '操作失败', data: e });
    }
  },

  // 逻辑删除
  setItem: async (req, res, next) => {
    const { id } = req.body;
    try {
      await Item.update({ id: id }, { delete: 1 });
      res.json({
        errNo: 0,
        message: '删除成功～'
      });
    } catch (e) {
      res.json({ errNo: -1, message: '操作失败', data: e });
    }
  },

  // 更新分类信息
  updateItem: async (req, res, next) => {
    const { openid } = req.body;
    req.body['update_time'] = moment().format('YYYY-MM-DD HH:mm:ss');
    try {
      await Item.update({ openid: openid }, req.body);
      res.json({
        errNo: 0,
        message: '编辑成功～'
      });
    } catch (e) {
      res.json({ errNo: -1, message: '操作失败', data: e });
    }
  },

  login: async (req, res, next) => {
    let data = req.body;
    console.log(data);
    // web || code
    if (data.type === 'web') {
      let user = await Item.selects(['*'], { userName: userName }, { pn: 1, rn: 1 });
      console.log(user);
    } else {
      // let url = `https://api.weixin.qq.com/sns/jscode2session?appid=${configs.wechat.appid}&secret=${configs.wechat.secret}&js_code=${configs.wechat.code}`;
      let ops = {
        type: 'terminal',
        // quality : 0.9 ,
        margin: 1
        // color : {
        //   dark : "#000" ,
        //   light : "#fff"
        // }
      };
      let url = '功能还在开发中～';
      // let url ='https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx356ca2b65ef949c3&redirect_uri=https%3A%2F%2Fwww.sotm.cn&response_type=code&scope=snsapi_base&state=123123123#wechat_redirect ';
      // QRCode.toString('功能开发中，别着急', ops, function (err, url) {
      QRCode.toDataURL(url, ops, function (err, url) {
        if (err) throw err;
        // console.log(url)
        res.json({
          errNo: 0,
          data: url,
          message: '编辑成功～'
        });
      });
    }
  }
};

module.exports = userController;
