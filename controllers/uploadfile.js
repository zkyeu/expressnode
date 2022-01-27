/*
 * @Author: your name
 * @Date: 2022-01-08 11:11:55
 * @LastEditTime: 2022-01-27 11:11:56
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /expressnode/controllers/uploadfile.js
 */

const Util = require('../utils/utils.js');
let multiparty = require('multiparty');
const uploadController = {
  // showUser 获取用户数据并返回到页面
  item: async function (req, res, next) {
    try {
      let form = new multiparty.Form();
      //设置编辑
      form.encoding = 'utf-8';
      //设置图片存储路径
      form.uploadDir = '../sotm/uploads/';
      form.keepExtensions = true; //保留后缀
      form.maxFieldsSize = 2 * 1024 * 1024; //内存大小
      form.maxFilesSize = 5 * 1024 * 1024; //文件字节大小限制，超出会报错err
      form.parse(req, function (err, fields, files) {
        //报错处理
        if (err) {
          let u = { errNo: 1, message: '请上传5M以图片' };
          res.end(JSON.stringify(u));
          return false;
        }
        //获取路径
        let oldpath = files.file[0]['path'];
        let suffix = '';
        //文件后缀处理格式
        if (oldpath.indexOf('.jpg') >= 0) {
          suffix = '.jpg';
        } else if (oldpath.indexOf('.jpeg') >= 0) {
          suffix = '.jpeg';
        } else if (oldpath.indexOf('.png') >= 0) {
          suffix = '.png';
        } else if (oldpath.indexOf('.gif') >= 0) {
          suffix = '.gif';
        } else {
          res.end({
            errNo: 1,
            message: '请上传正确格式'
          });
          return false;
        }

        let url = '../sotm/uploads/' + Date.now() + suffix;
        let fs = require('fs');
        //给图片修改名称
        fs.renameSync(oldpath, url);
        let u = { errNo: 0, url: Util.baseUrl + url.replace('../sotm/', '') };
        res.end(JSON.stringify(u));
      });
    } catch (e) {
      res.json({ errNo: 1, message: '操作失败～', data: e });
    }
  }
};

module.exports = uploadController;
