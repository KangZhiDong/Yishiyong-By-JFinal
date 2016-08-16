;jQuery(function($) {
    $('#join').on({
        'init': function(e) {
            this.img = $('#bus-logo img');
            this.tab = $('.today-tab span');
            this.span = 33;
            this.num = 1;

            this.total = Math.ceil(this.img.length / this.span);
            $(this).trigger('chool');
        },

        'chool': function() {
            var star = (this.num - 1) * this.span, limit = star + this.span;

            this.tab.text(this.num + '/' + this.total);
            this.img.each(function(index, el) {
                (index < star || index >= limit) ? $(el).hide() : $(el).show();
            });
        },

        'click': function(e) {
            var $this = $(e.target); rel = $this.attr('rel') || 0, cur = this.num;

            this.num = Math.max(1, Math.min(this.total, this.num + parseInt(rel)));
            if (cur != this.num) {
                $(this).trigger('chool');
                if (this.num == 1) {
                    $this.removeClass('prev-on').siblings('a').addClass('next-on');
                } else if(this.num == this.total) {
                    $this.removeClass('next-on').siblings('a').addClass('prev-on');
                }
            }

        }
    }).trigger('init');

    $('#loading-num').each(function() {
        var $this = $(this), rel = $this.attr('rel') || 0, num;
        switch(rel) {
            case '0': break;
            case '100':
                $this.addClass('loadover').find('p').removeAttr('style');
                break;
            default:
                num = Math.max(9, Math.min(88, parseInt(rel) || 1));
                rel = Math.max(1, Math.min(99, parseInt(rel) || 1));

                $this.addClass('loadit').find('p').width(num + '%');
                $this.find('.current').css('left', num + '%').find('u').text('当前进度：' + rel + '%');
        }
    });
});



var wait=60;

function cords(){
    if (wait == 0) {
        $(".cord").html('发送验证码');
        wait = 60;
    }else {
        $(".cord").html(wait+'秒后可重发');
        wait--;
        setTimeout(function() {
                cords();
            },
            1000)
    }
}


function cord(){
    //alert($("#usermoblie").val());
    $.ajax({
        type: "GET",
        data:"moblie=" + $("#usermoblie").val(),
        dataType:"json",
        url: "/users/get_moblie_verify",
        success: function(result) {
            if (result.error == "0") {
                cords();
            }
            else {
                //alert
                $(".cord").siblings().children("span").html(result.msg);
                //alert('aaa');
                return false;
            }
        },
        error: function() { alert("error"); }
    });
}


$(document).ready(function(){
    $(".select_back div label").click(function(){
        $(this).parent().attr("id","select_back").siblings().attr("id","");
    })
    $(".select_back div a").click(function(){
        $(this).hide().parent().siblings().toggle().show();
    })
    //绑定店铺
    $(".shop_list div input").click(function(){
        $(this).parent().parent(".shop_list").attr("id","shop_list").siblings().attr("id","");
    })
    $(".new_shop a").live("click",function(){
        $(this).parent(".new_shop").remove();
        shopnum = shopnum -1;
        var pay = shopnum * _binding_price;
        $(".newshop_butt span").html(pay);
    })

    //二维码扫描图
    $(".qiuyunqi_ewm").mouseover(function(){
        $(".qiuyunqi_ewm img").show();
    })
    $(".qiuyunqi_ewm").mouseout(function(){
        $(".qiuyunqi_ewm img").hide();
    })


    $(".register_button").click(function(){
        var _username 	= $("#login_username").val();
        var _password 	= $("#loginpassword").val();
        var _user_type 	= $("#user_type").val();
        var _login_type = $("input[name='login_type']:checked").val();

        if(_username && _password){
            $.ajax({
                type: "POST",
                dataType: "json",
                url:"/users/oauthlogin",
                data:{"username":_username,"password":_password,"user_type":_user_type,"login_type":_login_type},
                error: function(){ //失败
                    return false;
                },
                success: function(msg){ //成功\
                    if(msg.error == 1){
                        $(".login_error").html(msg.msg);
                    }else{
                        parent.document.location.href = msg.url;
                    }
                }
            });
        }else{
            $(".login_error").html('用户名密码不能为空');
        }
    })



    /* 购买VIP */
    $(".select_buy_input label input").click(function(){
        var pay_value = $(this).val();
        //$(".selected div span").html(pay_value);
        var pay_values = $(this).siblings("span").children().text();
        //alert(pay_values);
        $(".selected div span").html(pay_values);
        $(".select_back p span").html(pay_values);
    })

})

/* 登陆 */
function login(){
    $.ajax({
        type: "POST",
        dataType: "json",
        url:"/users/checklogin",
        data:{"username":document.getElementById("username").value,"password":document.getElementById("password").value},

        error: function(){ //失败
            return false;
        },
        success: function(result){ //成功
            if(result.error == 0){
                parent.document.location.href = "/member";
            }else{
                $(".login_error").show().html(result.msg);
            }
        }
    });
}

function addshop(){
    //alert(shopnum);
    var shopnums = $(".shopnums").text();
    //alert(shopnums);
    var shpnumb = shopnum+1;
    if(shopnum < 2){
        var innerhtml = '<div class="new_shop"><h3>店铺'+shpnumb+'：</h3><div class="new_shopinput inp">店铺首页网址：<input type="text" class="txt" name="shopurl" regname="shopurl"  emptyerr="店铺地址不能为空" onChange="store_url_change(this);" />店铺绑定后无法修改</div><div class="new_shopinput inp">店铺主旺旺ID：<input type="text" class="txt" regname="store_name" name="store_name[]" emptyerr="旺旺不能为空" style="width:150px;" /></div><div class="new_shopfile">店铺LOGO：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" />请选择文件<div class="fileinfo">请上传淘宝店铺LOGO，要求：尺寸为260*260，大小不超过1M</div></div><a href="javascript:;">删除</a></div>';




        $(".shopinfo").append(innerhtml);
        shopnum = shopnum + 1;

        var pay = shopnum*_binding_price;
        $(".newshop_butt span").html(pay);
    }else{
        $(".addshop b").show();
        return true;
    }
}