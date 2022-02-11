/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2022-02-11 11:51:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');
const Util = require('../utils/utils.js');
const listController = {
  list: async function (req, res, next) {
    let { pn, rn, id, origin } = req.body;
    // console.log(pn, rn,req.body);
    try {
      let condition = {
        deleted: 0 // 未删除
      };

      if (id) condition['type'] = id; // 判断文章分类

      let list = await item.selects(['*'], { ...condition }, { pn: pn, rn: rn }).orderBy([
        {
          column: 'create_time',
          order: 'desc'
        }
      ]);

      let lists = await item.count('title as cnt', { ...condition }).first(); // 条目统计
      let obj = list.map((item, index) => {
        item['create_time'] = Util.formatDate(item['create_time']);
        let json =
          parseInt(origin) === 1
            ? item
            : {
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
        return json;
      });
      // let list = await item
      // .selects(['*'], {'deleted': 0}, {pn:pn, rn:rn })
      // .orderBy([{
      //   column: 'create_time',
      //   order: 'desc'
      // }]);
      res.json({
        errNo: 0,
        message: '操作成功',
        data: obj,
        count: lists.cnt
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  }
};

module.exports = listController;
