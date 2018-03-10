//主要栏目的提问窗口
var qButton = document.querySelector('#q-button');
var question = document.querySelector('#question');

qButton.addEventListener('click', function () {
    question.style.display = 'block';
}, false);
