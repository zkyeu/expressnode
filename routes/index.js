/*
 * @Author: your name
 * @Date: 2021-08-10 10:21:33
 * @LastEditTime: 2021-08-10 16:47:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /expressnode/routes/index.js
 */
var express = require('express');
var router = express.Router();
const userController = require('../controllers/user');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express123' });
});

// 获取用户信息
router.get('/get/user', userController.showUser);


module.exports = router;
