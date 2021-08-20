/*
 * @Author: your name
 * @Date: 2021-08-10 10:21:33
 * @LastEditTime: 2021-08-20 17:00:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/routes/index.js
 */
var express = require('express');
var router = express.Router();
const userController = require('../controllers/user');
const listController = require('../controllers/list');
const typeController = require('../controllers/types');
const articleController = require('../controllers/article');
const baseinfoController = require('../controllers/basicinfo');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express123' });
});

// 获取信息
router.get('/get/user', userController.showUser);
router.get('/get/article', articleController.getItem);
router.get('/get/articlelist', listController.list);
router.get('/get/gettypes', typeController.getType);
router.get('/get/getdiytypes', typeController.getDiyType);
router.get('/get/getinfo', baseinfoController.getinfo);

// 编辑
router.post('/get/createarticle', articleController.insertItem);
router.post('/get/deletearticle', articleController.deleteItem);
router.post('/get/updatearticle', articleController.updateItem);
router.post('/get/addtypes', typeController.insertType);
router.post('/get/deletetype', typeController.deleteType);
router.post('/get/updatetype', typeController.updateItem);
router.post('/get/updateinfo', baseinfoController.update);

module.exports = router;
