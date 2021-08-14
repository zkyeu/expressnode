/*
 * @Author: your name
 * @Date: 2021-08-10 10:21:33
 * @LastEditTime: 2021-08-15 00:28:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/routes/index.js
 */
var express = require('express');
var router = express.Router();
const userController = require('../controllers/user');
const listController = require('../controllers/list');
const articleController = require('../controllers/article');
const insertController = require('../controllers/insertArticle');
const deleteController = require('../controllers/deleteitem');
const updateController = require('../controllers/updateitem');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express123' });
});

// 获取信息
router.get('/get/user', userController.showUser);
router.get('/get/article', articleController.handleItem);
router.get('/get/articlelist', listController.showArticle);

// 编辑
router.post('/get/createarticle', insertController.handleItem);
router.post('/get/deletearticle', deleteController.handleItem);
router.post('/get/updatearticle', updateController.handleItem);
module.exports = router;
