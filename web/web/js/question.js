document.write("<script language='javascript' src='js/ajax.js'></script>");

//根据描述字数显示更多
var show = document.querySelector('#show');
var description = document.querySelector('#description');
var headerContainer = document.querySelector('#question-header');

show.addEventListener('click', function(){
    description.style.height = 'auto';
    show.style.display = 'none';
});

//评论回复展开效果
var commentItem = document.querySelectorAll('.comment-item');
var reply = document.querySelectorAll('.reply');
//注意这里的var和let的区别
for (let i = 0; i < commentItem.length; i++) {
    commentItem[i].addEventListener('click', function () {
        reply[i].style.display = 'block'
    });
}

//input伸长效果
var replyInput = document.querySelectorAll('.reply-input');
var replyButton = document.querySelectorAll('.reply-button');

for (let i = 0; i < commentItem.length; i++) {
    replyInput[i].addEventListener('focus', function () {
        replyButton[i].style.display = 'none';
        replyInput[i].style.width = '655px';
        replyInput[i].style.background = '#fff';
    });
}

for (let i = 0; i < commentItem.length; i++) {
    replyInput[i].addEventListener('blur', function () {
        replyInput[i].style.width = '565px';
        replyInput[i].style.background = 'rgb(248, 246, 246)';
        setTimeout(function () {
            replyButton[i].style.display = 'block';
        }, 200);
    });
}

//回答框弹出效果
var writeComment = document.querySelector('#write-comment');
var commentAdd = document.querySelector('#comment-add');

writeComment.addEventListener('click', function () {
    commentAdd.style.display = 'block';
});

//关闭回答框
var cancel = document.querySelector('#cancel');

cancel.addEventListener('click', function () {
    commentAdd.style.display = 'none';
});

//点赞
// function addLike() {
//     var btn = document.querySelectorAll(".add-button");
//     if (!btn.className) {
//       btn.value = parseInt(btn.value) + 1;
//       btn.className = "liked";
//     } else {
//       btn.value = parseInt(btn.value) - 1;
//       btn.className = "";
//     }
//   }



