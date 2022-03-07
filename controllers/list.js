/*
 * @Author: your name
 * @Date: 2021-08-10 15:55:34
 * @LastEditTime: 2022-03-07 21:21:00
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/controllers/user.js
 */
// 引用用户模版数据
const item = require('../models/article.js');
const Util = require('../utils/utils.js');
const listController = {
  list: async function (req, res, next) {
    let { pn, rn, id, word, origin } = req.body;
    try {
      let list, count, obj;
      let condition = {
        deleted: 0 // 未删除
      };
      if (id) condition['type'] = id; // 判断文章分类
      if (word) {
        word = '%' + word + '%';
        list = await item.searchWord(
          function () {
            if (id) {
              this.where('title', 'like', `%${word}%`).andWhere('type', id);
            } else {
              this.where('title', 'like', `%${word}%`);
            }
          },
          { pn: pn, rn: rn }
        );
      } else {
        list = await item.selects(['*'], { ...condition }, { pn: pn, rn: rn }).orderBy([
          {
            column: 'create_time',
            order: 'desc'
          }
        ]);
      }
      count = await item
        .count('title as cnt', function () {
          if (word) {
            if (id) {
              this.where('title', 'like', `%${word}%`).andWhere('type', id);
            } else {
              this.where('title', 'like', `%${word}%`);
            }
          } else {
            this.where({ ...condition });
          }
        })
        .first(); // 条目统计
      obj = list.map((item, index) => {
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
      res.json({
        errNo: 0,
        message: '操作成功',
        data: obj,
        count: count.cnt
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败', data: e });
    }
  }
};

module.exports = listController;
