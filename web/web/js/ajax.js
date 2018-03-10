function Ajax(obj) {
    //默认值
    obj.method = obj.method || 'get'
    if (typeof obj.async === 'undefined') {
        obj.async = true
    }
    var xhr = new XMLHttpRequest()
    xhr.onreadystatechange = () => {
        if (xhr.readyState === 4 && xhr.status === 200) {
            var res = JSON.parse(xhr.responseText)
            obj.success(res)
        }
    }
    xhr.open(obj.method, obj.url, obj.async)
    if (obj.method === 'get') {
        xhr.send()
    }
    if (obj.method === 'post') {
        //根据data的类型来添加不同的请求头部
        var type = typeof obj.data
        var header
        if (type === 'string') {
            // data: 'openId=2018&name=kjj'
            header = 'application/x-www-form-urlencoded'
        }
        else {
            // data: {
            //     openId: 2018,
            //     name: 'kjj',
            // }
            header = 'application/json'
            obj.data = JSON.stringify(data)
        }
        xhr.setRequestHeader('Content-type', header)
        xhr.send(obj.data)
    }
}



// Ajax({
//     method: 'post',
//     url: '/getData',
//     data: {
//         openId: 2018,
//         name: 'kjj',
//     },
//     success: function(res) {
//         console.log(res)
//     },
//     async: true
// })