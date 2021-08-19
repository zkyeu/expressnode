/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-19 20:26:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');

const listController = {
  // showUser 获取用户数据并返回到页面
  list: async function(req,res,next){
    try{
      let list = await item
      .all()
      .orderBy([{
        column: 'createtime',
        order: 'desc'
      }]);
      let obj = list.map((item,index) => {
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
      });
      // console.log(obj);
      res.json({
        errNo: 0,
        message: "操作成功",
        data: obj
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
}

module.exports = listController;
