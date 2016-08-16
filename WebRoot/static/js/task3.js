/**
 * Created by dee on 15/8/31.
 */
var errTip = {
    show:function($_this,err){
        var $par = $_this.parent();
        if($par.find('.error').length>0){
            $par.find('.error').text(err);
        }else{
            $par.append($('<span class="error">'+err+'</span>'));
        }
    },
    hide:function($_this){
        var $par = $_this.parent();
        if($par.find('.error').length>0){
            $par.find('.error').remove();
        }
    }
}

var collections_regs = {
    //|[(?<=(?s).*?)Hello(?=(?s).*?)]
    //url:/^http:\/\/[a-z0-9-]+\.[a-z0-9-]{1,}/,
    urls:/^(http|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?$/,
    qq:/^[1-9]{1}[0-9]{4,10}$/,
    mobile:/^0{0,1}(13[0-9]|14[6|7]|15[0-3]|15[5-9]|18[0-9]|17[0-9])[0-9]{8}$/,
    num:/^(([1-9])|([1-9][0-9]{1,}))$/,
    price:/^(([1-9][0-9]{1,}\.[0-9][1-9]{1,})|([1-9][0-9]{1,}\.[0-9]{1,2})|([1-9][0-9]{1,})|([0-9]{1,})|([0-9]\.[0-9]{1,}))$/,
    lgprice:/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/,
    keyword:/^(([\u4E00-\u9FA5\x00-\xff]+)|([\u4E00-\u9FA5\x00-\xff]+\s+[\u4E00-\u9FA5\x00-\xff]+))$/,
    //len12:/^[\s\S]*$/,
    //len12:/[\u4E00-\u9FA5]{1,5}|[A-Za-z0-9 ]{1,10}/,
    num09:/^[0-9]$/,
    name:/^[\u4E00-\u9FA5\x00-\xffa-zA-Z0-9-_]+$/,
    empty:/^\S+$/,
    len12:function(val){
        //var keywords = $('#keywords').val();
        var reg = /[^\u4E00-\u9FA5\uf900-\ufa2d]/g;
        //匹配非中文的正则表达式
        var temp = val.replace(reg,'');
        if(temp.length > 10){
            return false;
        }


        if(val && $.trim(val)!=''){
            return true;
        }
        return false;
    },
    every:function(val){
        if(val && $.trim(val)!=''){
            return true;
        }
        return false;
    },
    gt100:function(val){
        if(val>100){
            return true;
        }
        return false;
    },
    lt300:function(val){
        if(val<300){
            return true;
        }
        return false;
    }
}

var collections = {
    //url:[{reg:collections_regs.url,error:'商品链接不正确'}],
    urls:[{reg:collections_regs.urls,error:'商品链接不正确'}],
    smprice:[{reg:collections_regs.every,error:'请填写价格区间'}],
    times:[{reg:collections_regs.every,error:'活动时间段不能为空'}],
    wangwang:[{reg:collections_regs.every,error:'旺旺ID不能为空'}],
    logo:[{reg:collections_regs.every,error:'店铺LOGO不能为空'}],
    qq:[{reg:collections_regs.qq,error:'QQ号码不正确'}],
    mobile:[{reg:collections_regs.mobile,error:'手机号码不正确'}],
    name:[{reg:collections_regs.every,error:'商品名称不能为空'}],
    mainpic:[{reg:collections_regs.every,error:'请上传商品主图'}],
    creativitypic:[{reg:collections_regs.every,error:'请上传直通车商品创意图'}],
    mess:[{reg:collections_regs.every,error:'留言内容不能为空'}],
    price:[{reg:collections_regs.lgprice,error:'商品金额不正确'}],
    keyword:[{reg:collections_regs.len12,error:'商品关键字不能为空且输入中文不能超过10个字'}],
    newmtype:[{reg:collections_regs.every,error:'所在分类最少填写两个'}],
    mtype:[{reg:collections_regs.every,error:'请选择商品分类'}],
    marea:[{reg:collections_regs.every,error:'请选择商品所在地'}],
    number:[{reg:collections_regs.num,error:'请填写数字'}],
    empty:[{reg:collections_regs.every,error:'填写有误'}],
    dian:[{reg:collections_regs.empty,error:'！请填写点数'},
        {reg:collections_regs.gt100,error:'！符点必须大于100点'},
        {reg:collections_regs.lt300,error:'！最多可添加300符点'}]
}



function regForm(list)
{
    var $list = $(list),len = $list.length,_reg = null,_err = null;
    var res = [];
    for(var i=0;i<len;i++)
    {
        var $this = $list.eq(i),j=0;
        var tempreg = collections[$this.attr("reg")];
        //console.log(tempreg);
        for(;j<tempreg.length;j++){
            _reg = tempreg[j].reg;
            _err = tempreg[j].error;

            if(Object.prototype.toString.apply(_reg) == '[object Function]'){
                if(!_reg.call(null,$this.val()||'')){
                    errTip.show($this,_err);
                    res.push({index:i,err:_err});
                }else{
                    errTip.hide($this);
                }
            }else{
                if($this.attr("reg")=='url' && $this.val()){

                    /* 判断所填写商品链接是否对应所选平台链接 start */
                    var trade;
                    var pro_trade = 0;
                    if($this.val().indexOf('taobao.com') > 0){
                        trade = 'taobao';
                    }else if(($this.val().indexOf('tmall.com')>0) || ($this.val().indexOf('tmall.hk')) > 0){
                        trade = 'tmall'
                    }else{
                        trade = 'qita';
                    }
                    var _trade = $this.attr("trade");

                    if(trade == 'qita'){
                        pro_trade = 'no';
                    }else if(trade != _trade){
                        pro_trade ='yes';
                    }
                    /* 判断所填写商品链接是否对应所选平台链接 end */
                    //alert(_trade);
                    $.ajax({
                        type: "POST",
                        url: "/trade/get_goods_item",
                        data : "url="+encodeURIComponent($this.val())+"&trade="+_trade+"&pro_trade="+pro_trade,
                        dataType:"json",
                        async:false,
                        success: function(tre) {
                            if(tre.error){
                                errTip.show($this,tre.msg);
                                res.push({index:i,err:tre.msg});
                                $this.siblings('.J_ITEM_INPUT').val('');
                            }else{
                                $this.siblings('.J_ITEM_INPUT').val(tre.item_id);
                                errTip.hide($this);
                            }
                        }
                    });
                }else if(!_reg.test($this.val())){
                    errTip.show($this,_err)
                    res.push({index:i,err:_err});
                }else{
                    errTip.hide($this);
                }
            }
        }
    }

    return res;
}

//淘宝
$(function(){
    $(".J_FIVE_CONTENT *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//天猫
$(function(){
    $(".S-BOX-TM *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//手机淘宝
$(function(){
    $(".S-BOX-SJTB *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//淘金币
$(function(){
    $(".S-BOX-TJB *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//淘宝U站
$(function(){
    $(".S-BOX-TBUZ *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//新浪微博
$(function(){
    $(".S-BOX-SINA *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})

//QQ空间
$(function(){
    $(".S-BOX-QQ *[reg]").live('keyup blur change',function(){
        regForm($(this));
    });
})