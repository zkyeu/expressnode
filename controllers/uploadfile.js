/*
 * @Author: your name
 * @Date: 2022-01-08 11:11:55
 * @LastEditTime: 2022-01-08 11:48:46
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /expressnode/controllers/uploadfile.js
 */

const Util = require('../utils/utils.js');
const uploadController = {
  // showUser 获取用户数据并返回到页面
  item: async function(req,res,next){
    try{
      console.log('tupian');
      var form = new multiparty.Form();
      form.parse(req, function (err, fields, files) {
        console.log(files.file[0]);
        // //找到上传的图片上传之前的名字
        var orgFilename = files.file[0].originalFilename;
        console.log(orgFilename);
        // //切割orgFilename 找到图片的扩展名 以证明图片是什么格式的
        // //切割后是一个数组，找到数组最后一个
        var formate = orgFilename.split('.');
        // //拼接新的图片名称
        var fileName = uuidV1() + '.' + formate[formate.length - 1];
        //
        images(files.file[0].path) //Load image from file
          .size(1920, 1276)
          .save('public/images/detail/' + fileName, {
            quality: 1000,
          });
        //返回前台存储地址
        var src = '/images/detail/' + fileName;

        res.json({
          status: true,
          msg: src,
        });
      });




      
      res.json({
        errNo: 0,
        message: "操作成功",
        data: {a:1}
      })
    }catch(e){
      res.json({ errNo: 1, message: "操作失败", data: e })
    }
  }
}

module.exports = uploadController;
