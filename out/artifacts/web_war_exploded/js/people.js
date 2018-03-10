//头像的放大效果
var userpicture = document.querySelector('#userpicture');
var frame1 = document.querySelector('#username');
var frame2 = document.querySelector('#selfdescription');

userpicture.addEventListener('mouseover', function(){
    frame1.style.display = 'none';
    frame2.style.display = 'none';
}, false);

//注意mouseleave和mouseout的区别,并延迟frame出现.
userpicture.addEventListener('mouseleave', function(){
    setTimeout(() => {
        frame1.style.display = 'block';
        frame2.style.display = 'block';
    }, 300);
}, false);
