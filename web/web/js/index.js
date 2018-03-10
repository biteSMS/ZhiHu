//注册登陆窗口转换
var reg = document.querySelector('#register');
var log = document.querySelector('#login');
var text = document.querySelector('#text span');
var button = document.querySelector('#switch span');
var flag = true;

button.addEventListener('click',function(){
    if (flag) {
        reg.style.display = 'none';
        log.style.display = 'block';
        button.innerHTML = '注册';
        text.innerHTML = '登陆';
        flag = false;
    }
    else {
        reg.style.display = 'block';
        log.style.display = 'none';
        button.innerHTML = '登陆';
        text.innerHTML = '注册';
        flag = true;
    }
},false);

//二维码按钮
var flag1 = true;
var app = document.querySelector('#app');
var erweima = document.querySelector('#erweima');
app.addEventListener('click',function(){
    if (flag1) {
        erweima.style.display = 'block';
        app.innerHTML = '关闭二维码';
        flag1 = false;
    }
    else{
        erweima.style.display = 'none';
        app.innerHTML = '下载知乎 App';
        flag1 = true;
    }
},false);
