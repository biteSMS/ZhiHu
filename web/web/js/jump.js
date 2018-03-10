function jumpperson(){
    var username = document.getElementById("username");
    location.href="JumpPerson?"+"username="+encodeURI(username.value);
}

function jumpquestion(){
    var answer_id = ;//用来获得answer_id的部分
    location.href="JumpQuestion?"+"answer_id="+answer_id;
}
