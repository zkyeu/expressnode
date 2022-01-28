/*
 * @Author: your name
 * @Date: 2022-01-28 13:34:55
 * @LastEditTime: 2022-01-28 13:34:55
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /expressnode/middleware/validation.js
 */
const { check } = require('express-validator');

exports.signupValidation = [
  check('name', '请输入用户名').not().isEmpty(),
  check('email', '请输入合法的邮箱').isEmail(),
  check('password', '密码至少是6位哦').isLength({ min: 6 })
];

exports.loginValidation = [
  check('email', '请输入合法的邮箱').isEmail(),
  check('password', '密码至少是6位哦').isLength({ min: 6 })
];
