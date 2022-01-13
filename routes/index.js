/*
 * @Author: your name
 * @Date: 2021-08-10 10:21:33
 * @LastEditTime: 2022-01-08 11:50:45
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
const commentController = require('../controllers/comment');
const uploadController = require('../controllers/uploadfile');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

// 获取信息
router.get('/apiv1/getwechatuser', userController.getItem);
router.get('/apiv1/get/article', articleController.getItem);
router.post('/apiv1/get/articlelist', listController.list);
router.get('/apiv1/get/gettypes', typeController.getType);
router.get('/apiv1/get/getdiytypes', typeController.getDiyType);
router.get('/apiv1/get/getinfo', baseinfoController.getinfo);
router.get('/apiv1/login', userController.qrCode);

// 编辑
router.post('/apiv1/get/createarticle', articleController.insertItem);
router.post('/apiv1/get/deletearticle', articleController.deleteItem);
router.post('/apiv1/get/updatearticle', articleController.updateItem);
router.post('/apiv1/get/addtypes', typeController.insertType);
router.post('/apiv1/get/addadminuser', userController.insertItem);
router.post('/apiv1/get/deleteuser', userController.setItem);
// router.post('/apiv1/get/deleteuser', userController.deleteItem);
router.post('/apiv1/updatewechatuser', userController.updateItem);
router.post('/apiv1/get/deletetype', typeController.deleteType);
router.post('/apiv1/get/updatetype', typeController.updateItem);
router.post('/apiv1/get/updateinfo', baseinfoController.update);
router.post('/apiv1/addwechatuser', userController.insertItem);
router.post('/apiv1/addcomment', commentController.insertItem);
router.post('/apiv1/filteruser', userController.filterItem);
router.post('/apiv1/getcomment', commentController.getItem);
router.post('/apiv1/regist', userController.insertItem);
router.post('/apiv1/uploadfile', uploadController.item);

module.exports = router;
