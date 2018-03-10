//input框伸缩
var input = document.querySelector('.input');
var searchButton = document.querySelector('#search-button');

input.addEventListener('focus', function () {
    input.style.background = '#fff';
    input.style.width = '376px';
    searchButton.style.display = 'none';
}, false);

input.addEventListener('blur', function () {
    input.style.background = '#f6f6f6';
    input.style.width = '306px';
    searchButton.style.display = 'block';
}, false);

//菜单弹出
var menu = document.querySelector('#menu');
var headPortrait = document.querySelector('#head-portrait');
var flag = true;

headPortrait.addEventListener('click', function () {
    if (flag) {
        menu.style.display = 'block';
        flag = false;
    } else {
        menu.style.display = 'none';
        flag = true;
    }
}, false);

//问题窗口弹出
var searchButton = document.querySelector('#search-button');
var questionClose = document.querySelector('#question-close img');
var question = document.querySelector('#question');

searchButton.addEventListener('click', function () {
    question.style.display = 'block';
}, false);

questionClose.addEventListener('click', function () {
    question.style.display = 'none';
}, false);