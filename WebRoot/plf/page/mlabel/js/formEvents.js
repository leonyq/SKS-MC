var timer;
var timer2;

//点X清空input
$('.content').on('click', '.empty', function () {
    $(this).prev().val('');
    $('.content .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty.png)');
    $('.content div input').css('color', '#333');
    $('.content div input').css('border-color', '');
    $(this).css('display', 'none');
})

//当输入框无值时隐藏X，反之显示
$('.content div input').not('.verification input').on('input', function () {
    $('.content .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty.png)');
    $('.content div input').css('color', '#333');
    $('.content div input').css('border-color', '');
    if ($(this).val() == '') {
        $(this).next().css('display', 'none');
    } else {
        $(this).next().css('display', 'block');
    }
})

$('.content .verification input:first').on('input', function () {
    $('.content div input').css('color', '#333');
    $('.content div input').css('border-color', '');
})

//显示信息  参数一:显示信息的父级元素  参数二:显示的内容
function showMessage(elem,message) {
    clearTimeout(timer);
    $('.content .message').css('display','none');    
    $('.content ' + elem + ' .message').text(message);
    $('.content ' + elem + ' .message').css('display','block');
    $('.content ' + elem + ' input:first').css('border-color','#dd4b39').css('color','#dd4b39');
    $('.content ' + elem + ' .empty').css('background-image', 'url('+_GLO_PATH+'/plf/page/mlabel/img/ico-empty-red.png)');
    timer = setTimeout(function () {
        $('.content ' + elem + ' .message').css('display','none');
    }, 5000);     //5秒后移除提示信息
}

function verification_countDown(elem){
    var count = 60;
    var val = $(elem).val();

    $(elem).attr('disabled','disabled');
    $(elem).css('cursor','not-allowed');    //将按钮变为不可用

    // $(elem).removeAttr('disabled');

    $(elem).val(val + '(' + count + ')');
    timer2 = setInterval(function(){
        $(elem).val(val + '(' + --count + ')');
        if(count <= 0){
            clearInterval(timer2); //清空定时器
            $(elem).val(val);      //内容还原
            $(elem).removeAttr('disabled');  //移除禁用
            $(elem).css('cursor','');   //鼠标样式改回原来
        }
    },1000)  //定时器,1s一次数字-1
}