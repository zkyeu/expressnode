/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2021-08-26 20:06:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');

const listController = {
  // showUser 获取用户数据并返回到页面
  list: async function(req,res,next){
    let {pn, rn} = req.body;
    console.log(pn, rn,req.body);
    try{
      let list = await item
      .selects(['*'], {'delete': 0}, {pn:pn, rn:rn })
      .orderBy([{
        column: 'createtime',
        order: 'desc'
      }]);

      let lists = await item.count('title as cnt',{'delete': 0}).first();
      // console.log(lists);
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
        data: obj,
        count: lists.cnt
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  },
}

module.exports = listController;
