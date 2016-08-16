/**
 * Created by dee on 15/8/30.
 */
var rqf  = rqf || {};
String.prototype.getLen = function () {
    var totalLength = 0;
    var list = this.split("");
    for (var i = 0; i < list.length; i++) {
        var s = list[i];
        if (s.match(/[\u0000-\u00ff]/g)) {
            totalLength += 1;
        } else if (s.match(/[\u4e00-\u9fa5]/g)) {
            totalLength += 2;
        } else if (s.match(/[\uff00-\uffff]/g)) {
            totalLength += 2;
        }
    }
    return totalLength;
};
String.prototype.getStr = function (len) {
    var relist = [];
    var totalLength = 0;
    var list = this.split("");
    for (var i = 0; i < list.length; i++) {
        var s = list[i];
        if (s.match(/[\u0000-\u00ff]/g)) {
            totalLength += 1;
            if (totalLength < len) {
                relist.push(list[i]);
            }
        } else if (s.match(/[\u4e00-\u9fa5]/g)) {
            totalLength += 2;
            if (totalLength < len) {
                relist.push(list[i]);
            }
        } else if (s.match(/[\uff00-\uffff]/g)) {
            totalLength += 2;
            if (totalLength < len) {
                relist.push(list[i]);
            }
        }
    }
    return relist.join("");
};
//tip集合
rqf.tip = (function(){
    var a = {
        ok : $("<span class='ok'></span>"),
        warn : $("<span class='owarnk'></span>"),
        error : $("<span class='error'></span>"),
        removeTip : function(o){
            o.find('span').remove();
        },
        showok : function(t,o){
            this.removeTip(o);
            this.ok.clone().html(t).appendTo(o);
        },
        showError : function(t,o){
            this.removeTip(o);
            this.error.clone().html(t).appendTo(o);
        },
        showwarn : function(t,o){
            this.removeTip(o);
            this.warn.clone().html(t).appendTo(o);
        }
    }
    return a;
})();

(function($) {
    $.tiny = $.tiny || {};
    $.tiny.scrollbar = {
        options: {
            axis: 'y',
            wheel: 40,
            scroll: true,
            lockscroll: true,
            size: 'auto',
            sizethumb: 'auto',
            invertscroll: false
        }
    };
    $.fn.tinyscrollbar = function(params) {
        var options = $.extend({}, $.tiny.scrollbar.options, params);
        this.each(function() {
            $(this).data('tsb', new Scrollbar($(this), options));
        });
        return this;
    };

    $.fn.tinyscrollbar_update = function(sScroll) {
        return $(this).data('tsb').update(sScroll);
    };

    function Scrollbar(root, options) {
        var oSelf = this,
            oWrapper = root,
            oViewport = {
                obj: $('.viewport', root)
            },
            oContent = {
                obj: $('.overview', root)
            },
            oScrollbar = {
                obj: $('.scrollbar', root)
            },
            oTrack = {
                obj: $('.track', oScrollbar.obj)
            },
            oThumb = {
                obj: $('.thumb', oScrollbar.obj)
            },
            sAxis = options.axis === 'x',
            sDirection = sAxis ? 'left' : 'top',
            sSize = sAxis ? 'Width' : 'Height',
            iScroll = 0,
            iPosition = {
                start: 0,
                now: 0
            },
            iMouse = {},
            touchEvents = 'ontouchstart' in document.documentElement;

        function initialize() {
            oSelf.update();
            setEvents();
            return oSelf;
        }

        this.update = function(sScroll) {
            oViewport[options.axis] = oViewport.obj[0]['offset' + sSize];
            oContent[options.axis] = oContent.obj[0]['scroll' + sSize];
            oContent.ratio = oViewport[options.axis] / oContent[options.axis];

            oScrollbar.obj.toggleClass('disable', oContent.ratio >= 1);
            oTrack[options.axis] = options.size === 'auto' ? oViewport[options.axis] : options.size;
            oThumb[options.axis] = Math.min(oTrack[options.axis], Math.max(0, (options.sizethumb === 'auto' ? (oTrack[options.axis] * oContent.ratio) : options.sizethumb)));
            oScrollbar.ratio = options.sizethumb === 'auto' ? (oContent[options.axis] / oTrack[options.axis]) : (oContent[options.axis] - oViewport[options.axis]) / (oTrack[options.axis] - oThumb[options.axis]);

            iScroll = (sScroll === 'relative' && oContent.ratio <= 1) ? Math.min((oContent[options.axis] - oViewport[options.axis]), Math.max(0, iScroll)) : 0;
            iScroll = (sScroll === 'bottom' && oContent.ratio <= 1) ? (oContent[options.axis] - oViewport[options.axis]) : isNaN(parseInt(sScroll, 10)) ? iScroll : parseInt(sScroll, 10);
            setSize();
        };

        function setSize() {
            var sCssSize = sSize.toLowerCase();
            var maxCssSize = iScroll / oScrollbar.ratio;
            if (maxCssSize + oThumb[options.axis] > oTrack[options.axis]) {
                maxCssSize = oTrack[options.axis] - oThumb[options.axis];
                iScroll = maxCssSize * oScrollbar.ratio;
            }
            oThumb.obj.css(sDirection, maxCssSize);
            oContent.obj.css(sDirection, -iScroll);
            iMouse.start = oThumb.obj.offset()[sDirection];
            oScrollbar.obj.css(sCssSize, oTrack[options.axis]);
            oTrack.obj.css(sCssSize, oTrack[options.axis]);
            oThumb.obj.css(sCssSize, oThumb[options.axis]);
        }

        function setEvents() {
            if (!touchEvents) {
                oThumb.obj.bind('mousedown', start);
                oTrack.obj.bind('mouseup', drag);
            } else {
                oViewport.obj[0].ontouchstart = function(event) {
                    if (1 === event.touches.length) {
                        start(event.touches[0]);
                        event.stopPropagation();
                    }
                };
            }
            if (options.scroll && window.addEventListener) {
                oWrapper[0].addEventListener('DOMMouseScroll', wheel, false);
                oWrapper[0].addEventListener('mousewheel', wheel, false);
            } else if (options.scroll) {
                oWrapper[0].onmousewheel = wheel;
            }
        }

        function start(event) {
            $("body").addClass("noSelect");
            var oThumbDir = parseInt(oThumb.obj.css(sDirection), 10);
            iMouse.start = sAxis ? event.pageX : event.pageY;
            iPosition.start = oThumbDir == 'auto' ? 0 : oThumbDir;
            if (!touchEvents) {
                $(document).bind('mousemove', drag);
                $(document).bind('mouseup', end);
                oThumb.obj.bind('mouseup', end);
            } else {
                document.ontouchmove = function(event) {
                    event.preventDefault();
                    drag(event.touches[0]);
                };
                document.ontouchend = end;
            }
        }

        function wheel(event) {
            if (oContent.ratio < 1) {
                var oEvent = event || window.event,
                    iDelta = oEvent.wheelDelta ? oEvent.wheelDelta / 120 : -oEvent.detail / 3;
                iScroll -= iDelta * options.wheel;
                iScroll = Math.min((oContent[options.axis] - oViewport[options.axis]), Math.max(0, iScroll));
                oThumb.obj.css(sDirection, iScroll / oScrollbar.ratio);
                oContent.obj.css(sDirection, -iScroll);
                if (options.lockscroll || (iScroll !== (oContent[options.axis] - oViewport[options.axis]) && iScroll !== 0)) {
                    oEvent = $.event.fix(oEvent);
                    oEvent.preventDefault();
                }
            }
        }

        function drag(event) {
            if (oContent.ratio < 1) {
                if (options.invertscroll && touchEvents) {
                    iPosition.now = Math.min((oTrack[options.axis] - oThumb[options.axis]), Math.max(0, (iPosition.start + (iMouse.start - (sAxis ? event.pageX : event.pageY)))));
                } else {
                    iPosition.now = Math.min((oTrack[options.axis] - oThumb[options.axis]), Math.max(0, (iPosition.start + ((sAxis ? event.pageX : event.pageY) - iMouse.start))));
                }
                iScroll = iPosition.now * oScrollbar.ratio;
                oContent.obj.css(sDirection, -iScroll);
                oThumb.obj.css(sDirection, iPosition.now);
            }
        }

        function end() {
            $("body").removeClass("noSelect");
            $(document).unbind('mousemove', drag);
            $(document).unbind('mouseup', end);
            oThumb.obj.unbind('mouseup', end);
            document.ontouchmove = document.ontouchend = null;
        }

        return initialize();
    }
}(jQuery));

//表单提示插件
$.fn.placeholder = function(c){
    var b = {
            cls : 'placeclass',
            left : 3,
            top  : 0,
            html : '文字提示',
            Dcolor : '#666',
            Ccolor : '#999'
        }
        ,d = $.extend(true, {}, b, c)
        ,e = $('<b class="'+d.cls+'"></b>')
        ,resizetext = function(obj,col){
            var _val = obj.val(),_name = obj.parent().find('b[cname="'+obj.attr('cname')+'"]');
            if($.trim(_val)){
                _name.hide()
            }else{
                _name.show().css('color',col)
            }
        };
    return $(this).each(function(){
        $(this).parent().css('position', 'relative');
        var  $this = $(this)
            ,$parent = $this.parent()
            ,$offset = $this.position()
            ,$height = $this.outerHeight()
            ,$paddingleft = parseInt($this.css('paddingLeft'))
            ,$paddingtop = parseInt($this.css('paddingTop'))
            ,$left = parseInt($offset.left+$paddingleft+d.left)
            ,$top  = parseInt($offset.top+$paddingtop+d
                    .top);
        e.clone().css({
            position: 'absolute',
            left:$left+'px',
            top :$top+'px',
            lineHeight : $height+'px',
            fontWeight : 100
        }).html($this.attr('place')||b.html).attr('cname',$this.attr('cname')).appendTo($this.parent());
        resizetext($this,b.Dcolor);
        $('b.'+d.cls).click(function() {
            $(this).parent().find('input[cname="'+$(this).attr('cname')+'"],textare').focus();
        });
        $this.bind({
            focusin  : function(){
                resizetext($(this),b.Ccolor);
            },
            focusout : function(){
                resizetext($(this),b.Dcolor);
            },
            keyup    : function(){
                resizetext($(this),b.Ccolor);
            }
        })
    })
};

//表单验证
$.fn.Validform = function(c){
    var a = $(this)
        ,b = {
            errcls : 'error',
            okcls  : 'ok',
            warncls : 'warn',
            btncls : 'name',
            iffb : true,
            ifok : false,
            nocls : false,
            reg : {
                username    : [[5,/^.{4,15}$/],[5,/^[a-zA-z0-9\u4E00-\u9FA5]*$/]],
                loginpassword :['6nb16',[4,/^\d+$/],[4,/^[A-Za-z]+$/],[4,/^[^A-Za-z0-9]+$/]],
                paypassword :['6nb16',[4,/^\d+$/],[4,/^[A-Za-z]+$/],[4,/^[^A-Za-z0-9]+$/]],
                email   : [[3,/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@(vip.qq|qq|163|126)\.com/]],
                qq   : [[3,/^[1-9]{1}[0-9]{4,10}$/]],
                mobile   : [[3,/^0{0,1}(13[0-9]|14[6|7]|15[0-3]|15[5-9]|18[0-9]|17[0-9])[0-9]{8}$/]],
                khmname :  [[3,/[\u4e00-\u9fa5]/]],
                bankforlast : [],
                //bank :[[3,/^\d{16,19}$/]],
                bank :[[3,/^\d{15,16}$|^\d{18,19}$/]],
                alipay : [[3,/^(0{0,1}(13[0-9]|14[6|7]|15[0-3]|15[5-9]|18[0-9])[0-9]{8}||([a-zA-Z0-9]+[_|\_|\-|\.]?)*@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3})$/]],
                tenpay   : [[3,/^(0{0,1}(13[0-9]|14[6|7]|15[0-3]|15[5-9]|18[0-9])[0-9]{8}||([a-zA-Z0-9]+[_|\_|\-|\.]?)*@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}||[1-9]{1}[0-9]{4,10})$/]],
                sfcord   :[[3,/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/]]
            },
            regtips : {
                username    : ['用户名限4-15个字符!','用户名不能包含特殊字符或空格'],
                loginpassword :['登录密码长度为6-16位！','登录密码不能为全数字！','登录密码不能为全字母！','登录密码不能为全字符！'],
                paypassword :['支付密码长度为6-16位！','支付密码不能为全数字！','支付密码不能为全字母！','支付密码不能为全字符！'],
                email   : ['仅支持qq,126,163邮箱!'],
                qq   : ['qq格式错误!'],
                mobile   : ['手机号码格式错误!'],
                khmname : ['开户名为中文!'],
                bankforlast : [],
                //bank : ['银行卡号为16-19位的数字!'],
                bank : ['银行卡号为15,16,18或19位的数字!'],
                alipay   : ['支付宝账号为手机或邮箱!'],
                tenpay   : ['财付通账号为手机、邮箱、QQ号!'],
                sfcord   :['请输入正确的身份证号']
            },
            regback : {
                name    :   null
            },
            disbtncls : 'disbtncls',
            callback : null
        }
        ,d = $.extend(true, {}, b, c)
        ,e = $('<span class="'+d.errcls+'"></span>')
        ,f = $('<span class="'+d.okcls+'"></span>')
        ,g = $('<span class="'+d.warncls+'"></span>')
        ,ftrue =  d.ifok
        ,$b = a.find(d.btncls)
        ,$db = d.disbtncls
        ,$reg = d.reg
        ,$regtext = d.regtips
        ,$regback = d.regback
        ,$callback = d.callback;
    if(d.nocls){
        var $v = a.find("input[type='text'][regname]:not("+d.nocls+"),textarea[regname]:not("+d.nocls+"),input[type='hidden'][regname]:not("+d.nocls+"),input[type='file'][regname]:not("+d.nocls+"),input[type='password'][regname]:not("+d.nocls+"),input[confirmation]:not("+d.nocls+")")
            ,$l = a.find("input[type='radio'][regname]:not("+d.nocls+"),input[type='checkbox'][regname]:not("+d.nocls+")")
            ,$s = a.find("select[regname]:not("+d.nocls+")");
    }else{
        var $v = a.find("input[type='text'][regname],input[type='hidden'][regname],input[type='file'][regname],textarea[regname],input[type='password'][regname],input[confirmation]")
            ,$l = a.find("input[type='radio'][regname],input[type='checkbox'][regname]")
            ,$s = a.find("select[regname]");
    }
    var Valid = {
        removeTip : function(o){
            o.find('span').remove();
        },
        showError : function(t,o){
            this.removeTip(o);
            e.clone().html(t).appendTo(o);
        },
        showok : function(t,o){
            this.removeTip(o);
            f.clone().html(t).appendTo(o);
        },
        checkall : function(){
            $v.each(function(){
                if($(this).attr('pass')) return;
                Valid.checkalone($(this),1);
            });

            $l.each(function(){
                if($(this).attr('pass')) return;
                Valid.checkalone($(this),2);
            });

            $s.each(function(){
                if($(this).attr('pass')) return;
                Valid.checkalone($(this),3);
            });
        },
        checkalone : function(o,p){
            var $val = '';
            var self = o;
            var old = o.attr('old');
            if(p == 1){
                $val = $.trim(self.val());
            }else if(p == 2){
                $val = $('input[name='+o.attr('name')+']:checked').length;
            }else if(p == 3){
                $val = $.trim(self.val());
            };
            if(old == $val&&!o.attr('ochange')){
                return;
            };
            Valid.removeTip(self.parents('.inp'));
            var $canempty = self.attr('canempty')||false,
                $regname = self.attr('regname'),
                $confirmation = self.attr('confirmation');
            $emptyerr = self.attr('emptyerr');
            self.attr({'pass':'1','old':$val});
            if($regname){
                var pflag = false;
                if((p == 1&&$val == '')||(p == 2&&$val == 0)||(p == 3&&$val == 0)){
                    if(!$canempty){
                        Valid.showError($emptyerr,self.parents('.inp'));
                        self.removeAttr('pass');
                        pflag = true;
                    }
                }else{

                    for(var p in $reg){
                        if(p == $regname){
                            for (var i = 0; i < $reg[p].length; i++) {
                                var regpi = $reg[p][i];
                                if(typeof(regpi)=='object'){
                                    var regpitype = regpi[0];
                                    var regpireg= regpi[1];
                                    if(regpitype == 1){
                                        if(regpireg.exec($val)!= null){
                                            pflag =  true;
                                            Valid.showError($regtext[p][i]+regpireg.exec($val)[0],self.parents('.inp'));
                                            self.removeAttr('pass');
                                            break;
                                        }
                                    }else if(regpitype == 2){
                                        if(!$val.replace(regpireg,"")){
                                            pflag =  true;
                                            Valid.showError($regtext[p][i],self.parents('.inp'));
                                            self.removeAttr('pass');
                                            break;
                                        }
                                    }else if(regpitype == 3){
                                        if(!regpireg.test($val)){
                                            pflag =  true;
                                            Valid.showError($regtext[p][i],self.parents('.inp'));
                                            self.removeAttr('pass');
                                            break;
                                        }
                                    }else if(regpitype == 4){
                                        if(regpireg.test($val)){
                                            pflag =  true;
                                            Valid.showError($regtext[p][i],self.parents('.inp'));
                                            self.removeAttr('pass');
                                            break;
                                        }
                                    }else if(regpitype == 5){
                                        var $replaceval1 = $val.replace(/[\u4e00-\u9fa5]/g,"aa");
                                        var $replaceval = $replaceval1.replace(/[\uff00-\uffff]/g,"aa");
                                        if(regpireg.test($replaceval)){
                                            //通过
                                        }else{
                                            if(regpireg.test($val)){
                                                pflag =  true;
                                                Valid.showError('中文与全角为两个字符!',self.parents('.inp'));
                                                self.removeAttr('pass');
                                                break;
                                            }else{
                                                pflag =  true;
                                                Valid.showError($regtext[p][i],self.parents('.inp'));
                                                self.removeAttr('pass');
                                                break;
                                            }

                                        }
                                    }
                                }else{
                                    var regflag = regpi.indexOf('num') >= 0?1:regpi.indexOf("nb") >= 0?2:0;
                                    if (regflag) {
                                        var regsplit = regflag ==1?'num':regflag ==2?'nb':'';
                                        var $a = regpi.split(regsplit)[0],
                                            $b = regpi.split(regsplit)[1],
                                            $c = regflag==2?$val.getLen():Number($val),
                                            $d = {
                                                big : !$a == true&&!$b == false,
                                                small : !$b == true&&!$a == false,
                                                smallbig : !$b == false&&!$a == false
                                            };
                                        var regflagall = 0;
                                        if(isNaN($c)){
                                            regflagall = 1;
                                        }
                                        if($d.small){
                                            if($c<Number($a)){
                                                regflagall = 1;
                                            }
                                        }
                                        if($d.smallbig){
                                            if($c>Number($b)||$c<Number($a)){
                                                regflagall = 1;
                                            }
                                        }
                                        if($d.big){
                                            if($c>Number($b)){
                                                regflagall = 1;
                                            }
                                        }
                                        if(regflagall){
                                            pflag =  true;
                                            Valid.showError($regtext[p][i],self.parents('.inp'));
                                            self.removeAttr('pass');
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                //前面通过验证-返回函数
                if(!pflag) {
                    //验证重复
                    function concall(z){
                        if(z.attr('pass')){
                            if(z.attr('confirmationpass')){
                                if(a.find('input[confirmation="'+z.attr('confirmationpass')+'"]').val()){
                                    a.find('input[confirmation="'+z.attr('confirmationpass')+'"]').trigger('blur');
                                }
                            }
                            if(ftrue){
                                Valid.showok('',z.parents('.inp'));
                            }
                        };

                    }
                    if(self.attr('checkurl')&&$regback[$regname]){

                        $regback[$regname].call(null,self,$val,concall);

                    }else{
                        concall(self)
                    }
                }

            }else if($confirmation){
                if((p == 1&&$val == '')||(p == 2&&$val == 0)||(p == 3&&$val == 0)){
                    if(!$canempty){
                        Valid.showError($emptyerr,self.parents('.inp'));
                        self.removeAttr('pass');
                    }
                }else{
                    var confirmationval = a.find('input[confirmationpass="'+$confirmation+'"]').val();
                    if(!(confirmationval==$val)){
                        Valid.showError(self.attr('confirmationerr'),self.parents('.inp'));
                        self.removeAttr('pass');
                    }else{
                        Valid.removeTip(self.parents('.inp'));
                        if(ftrue){
                            Valid.showok('',self.parents('.inp'));
                        }
                    }
                }
            }

        },
        warnone : function(o){
            var s = o,warn =o.attr('warn');
            if(warn&&!o.attr('pass')&&o.val()==''){
                Valid.removeTip(s.parents('.inp'));
                g.clone().html(warn).appendTo(o.parents('.inp'));
            }
        }
    };
    $v.bind({
        focusin  : function(){
            $(this).parent('.inpbox').addClass('inpbox_focus');
            Valid.warnone($(this));
        },
        focusout : function(){
            $(this).parent('.inpbox').removeClass('inpbox_focus');
            Valid.checkalone($(this),1);
        }
    });

    $l.each(function(){
        var name = $(this).attr('name');
        $('input[name='+name+']').change(function() {
            Valid.checkalone($('input[name='+name+'][regname]'),2);
        });
    });

    $s.each(function() {
        $(this).change(function() {
            Valid.checkalone($(this),3);
        });
    });

    if($b.length){
        var disabled = 1;
        $b.click(function(e) {
            if(!disabled||$(this).hasClass($db)) return false;
            disabled = 0;
            Valid.checkall();
            var ispass = 1;
            $v.each(function(){
                ispass = ispass*Number($(this).attr('ispass')||$(this).attr('pass')||0);
            });
            $l.each(function(){
                ispass = ispass*Number($(this).attr('ispass')||$(this).attr('pass')||0);
            });
            $s.each(function(){
                ispass = ispass*Number($(this).attr('ispass')||$(this).attr('pass')||0);
            });
            if(!ispass){
                disabled = 1;
                return false;
            }else{
                disabled = 1;
                if($callback){
                    $callback.call($(this), e);
                }

            }
        });
    }
};


function sendemail(mobile,callback,$this){
    if($this.hasClass('onprocess')) return;
    $this.addClass('onprocess');
    // $.ajax({
    //     type: "POST",
    //     url: "xxxx",
    //     data:"type="+type+"&mobile="+mobile,
    //     dataType:"html",
    //     async:true,
    //     success: function(msg) {
    var msg = 'ok';
    if(msg == "ok"){
        if(callback){ callback.call(null); }
    }else{
        $this.removeClass('onprocess');
        alert(msg);
    }
    // },
    // error: function(XMLHttpRequest, textStatus, errorThrown){
    //     $this.removeClass('onprocess');
    // }
    // });
};

$.fn.disableDown = function(c){
    var b = {
            defaulttext : '重新获取登录码',
            num : 10,
            numtext : '秒后重新获取',
            cls : 'onprocess',
            back : null
        }
        ,d = $.extend(true, {}, b, c);
    var $this = $(this);
    var count = d.num;
    var co_text = d.numtext;
    var co_back = d.back;
    countDown();
    var countTime = setInterval(function(){countDown();},1000);
    function countDown(){
        $this.text(count+co_text);
        if( count == 0 ){
            $this.text(d.defaulttext).removeClass(d.cls);
            if(co_back)co_back.call($this);
            clearInterval(countTime);
        }
        count--;
    };
};

//计时
$.fn.countDown = function (options) {
    // 设置默认属性
    var settings = {
            "nowTime":this.attr('data-now') || 0,
            "interval":1000,
            "endTime": 60,
            "minDigit":true,
            "showtime":true,
            "callback":null
        },
        opts = $.extend({}, settings, options);

    return this.each(function () {
        var $timer = null,
            $this = $(this),
            $block = $('<span></span>'),
            nowTime,
            time = {},
            nowTime = nowTime1 = opts.nowTime == 0 ? Math.round(new Date().getTime() / 1000) : Math.round(opts.nowTime);
        endTime = nowTime+opts.endTime,
            flag = false;

        function addZero(isAdd, time) {
            if (!isAdd) return time;
            else return time < 10 ? time = '0' + time : time;
        }
        (function remainTime() {

            var ss = nowTime-nowTime1;
            time.min = addZero(opts.minDigit, Math.floor(ss / 60 % 60));
            time.sec = addZero(opts.minDigit, Math.floor(ss % 60));
            // $this.html('');
            // $block.clone().text(time.min+':').appendTo($this);
            // $block.clone().text(time.sec).appendTo($this);
            if(opts.showtime) $this.html(time.min+':'+time.sec);
            if(!flag&&nowTime>endTime){
                if (typeof opts.callback === 'function') {
                    flag = true;
                    opts.callback.call(this);
                }
            }
            nowTime = nowTime + opts.interval / 1000;
            $timer = setTimeout(function () {
                remainTime();
            }, opts.interval);
        })();
    });
};
rqf.quotation = (function(){
    var a = {
        cityinit : '<option value="">请选择城市</option>',
        countyinit : '<option value="">请选择区域</option>',
        branchinit : '<option value="">请选择支行</option>',
        city : function(proid,callback){
            $.ajax({
                type: "get",
                url: "/openapi/getregion",
                data:"rid="+proid,
                dataType:"json",
                async:false,
                success: function(re) {
                    callback.call(null,re);
                }
            });
        },
        county : function(cityid,callback){
            $.ajax({
                type: "get",
                url: "/openapi/getregion",
                data:"rid="+cityid,
                dataType:"json",
                async:false,
                success: function(re) {
                    callback.call(null,re);
                }
            });
        },
        branch : function(cityid,brankid,callback){
            var brancharr;
            if(brankid&&cityid){
                brancharr = [{id : 331,name : '上海市'},{id : 330,name : '深圳'}];
            }
            if(callback)callback.call(null,brancharr);
        },
        increase : function(o,r,a,callback){
            var options = r;
            if(a){
                for (var i = 0; i < a.length; i++) {
                    selected = '';
                    if(o.attr('cname')==a[i].id){
                        selected = 'selected';
                    }
                    options += "<option value='" + a[i].id + "' "+selected+">" + a[i].name + "</option>";
                }
            }
            o.html(options);
            if(callback)callback();
        }
    }

    return a;
})();

$.fn.area=function(options){
    var settings={
            "Method" :rqf.quotation,
            "initValue":null
        },
        opts=$.extend(settings,options);
    $this = $(this),
        oMethod = opts.Method
    init = opts.initValue;
    //return $this.each(function() {
    var name = $(this).attr('areaname')
        ,$city =  $('select[areaname="'+name+'"].city')
        ,$county =  $('select[areaname="'+name+'"].county');
    function citychange(id,b){
        $county.removeAttr('pass');
        oMethod.city(id,function(arr){
            oMethod.increase($city,oMethod.cityinit,arr,b);
        })
    }
    function countychange(id,b){
        $county.removeAttr('pass');
        oMethod.county(id,function(arr){
            oMethod.increase($county,oMethod.countyinit,arr,b);
        })
    }
    $(this).live('change', function() {
        var $provval = $(this).val();
        citychange($provval,function(){countychange(0);});
    });
    $city.live('change', function() {
        var $cityval = $(this).val();
        countychange($cityval);
    });
    if(init){
        $(this).val(init.province);
        citychange(init.province,function(){
            $city.val(init.city);
            countychange(init.city,function(){
                $county.val(init.county);
            });
        });
    }else{
        if($(this).val()){
            citychange($(this).val(),function(){countychange(0);});
        }
    }
    //});
};

$.fn.branch=function(options){
    var settings={
            "Method" :rqf.quotation
        },
        opts=$.extend(settings,options);
    $this = $(this),
        oMethod = opts.Method
    return $this.each(function() {
        var name = $(this).attr('branchname')
            ,$city =  $('select[branchname="'+name+'"].city');
        // ,$brank = $('select[branchname="'+name+'"].brank')
        // ,$branch = $('select[branchname="'+name+'"].branch');
        function citychange(id,b){
            oMethod.city(id,function(arr){
                oMethod.increase($city,oMethod.cityinit,arr,b);
            })
        }
        // function branchchange(cityid,brankid,b){
        //   oMethod.branch(cityid,brankid,function(arr){
        //      oMethod.increase($branch,oMethod.branchinit,arr,b);
        //   });
        // }
        $(this).live('change', function() {
            var $provval = $(this).val();
            citychange($provval,function(){
                $city.removeAttr('pass');
            });
        });
        // $city.live('change', function() {
        //    var $cityval = $(this).val();
        //    branchchange($cityval,$brank.val());
        // });
        // $brank.live('change', function() {
        //    var $brankval = $(this).val();
        //    branchchange($city.val(),$brankval);
        // });
        if($(this).val()){
            citychange($(this).val());
        }
    });
};



$.fn.fixed = function() {
    var position = function(element) {
        var Ww,top = element.offset().top;
        $(window).resize(function() {
            Ww = $(window).width();
            scrollfix();
        })

        $(window).scroll(function() {
            Ww = $(window).width();
            scrollfix();
        });
        function  scrollfix(){
            var scrolls = $(this).scrollTop();
            var left = element.offset().left;
            if(Ww<1000){
                element.css({
                    position: '',
                    top: '',
                    left:''
                });
            }
            else{
                if (scrolls > top) {
                    if (window.XMLHttpRequest) {
                        element.css({
                            position: "fixed",
                            top: 0,
                            left:left
                        });
                    } else {
                        element.css({
                            position: "absolute",
                            top: scrolls,
                            left:left
                        });
                    }
                }else {
                    element.css({
                        position: '',
                        top: '',
                        left: ''
                    });
                }
            }
        }
    };
    return $(this).each(function() {
        position($(this));
    });
};




/*重写toFixed()*/
/*
 Number.prototype.toFixed=function(len)
 {

 if(!len){ len = 2; }
 function getZero(_l){
 var res = '';
 for(var i =0; i<_l;i++){
 res = res+'0';
 }
 return res;
 }

 var _this = this.toString(),_temp = Math.pow(10,len);
 var _split = _this.split('.'),_l = _split[0],_r = _split[1]||'';
 var _ownLen = _r.length;
 var _res = 0;

 if(_ownLen<len){
 _res = _l  + '.' + _r + getZero(len-_ownLen);
 }else if(_ownLen>len){
 var _use = Math.ceil(parseFloat(_r.substring(0,len+1)/10));
 console.log(_r.substring(0,len+1));
 _res = _l + '.' + _use;
 }else{
 _res = _l + '.' + _r;
 }
 return _res;
 }*/

Number.prototype.toFixed = function(s)
{
    if(!s){ s = 2; }
    changenum=(parseInt(this * Math.pow( 10, s ) + 0.5)/ Math.pow( 10, s )).toString();
    index=changenum.indexOf(".");
    if(index<0&&s>0){
        changenum=changenum+".";
        for(i=0;i<s;i++){
            changenum=changenum+"0";
        }
    }else {
        index=changenum.length-index;
        for(i=0;i<(s-index)+1;i++){
            changenum=changenum+"0";
        }
    }
    return changenum;
}
/*
 Number.prototype.toFixed=function(s)
 {
 return (parseInt(this * Math.pow( 10, s ) + 0.5)/ Math.pow( 10, s )).toString();
 }
 */


/*
 焦点图
 */
function FocusShow(se){
    var fs = function(){
        this.init.apply(this,arguments);
    }
    fs.prototype.init = function(){};
    fs.fn = fs.prototype;
    fs.fn.parent = fs;

    //setting
    var inerval = se.inerval || 5*1000,fo = se.fo || 500,fi = se.fi || 1000,_len = se.$list.length-1,_auto = se.auto || false;
    fs.now = se.init||0;

    fs.show = function(number){
        if(number){ fs.now = number; }
        se.$controls.normal && se.$controls.normal.eq(fs.now).addClass('active').siblings().removeClass('active');
        se.$list.eq(fs.now).fadeIn(fi).siblings().fadeOut(fo);
        if(se.$page){se.$page.text((fs.now+1)+'/'+(_len+1));}
    }

    fs.init = function(){
        if(_auto){
            fs.timer = setInterval(function(){
                fs.show();
                fs.now ++;
                fs.now>_len ? fs.now=0 : '';
            },inerval);
        }else{
            fs.show();
        }
    }

    fs.pause = function(){
        clearInterval(fs.timer);
    }
    fs.replay = function(){
        fs.init();
    }

    se.$box && function(){
        se.$box.hover(function(){
            fs.pause();
        },function(){
            fs.replay();
        });
    }

    se.$controls.normal && se.$controls.normal.click(function(){
        fs.show($(this).index());
    });

    se.$controls.next && se.$controls.next.click(function(){
        fs.now ++;
        fs.now>_len ? fs.now= 0 : '';
        fs.show(fs.now);
    });

    se.$controls.prev && se.$controls.prev.click(function(){
        fs.now --;
        fs.now<0 ? fs.now=_len : '';
        fs.show(fs.now);
    });

    fs.init();
    return fs;
}




function fileChange(target,sizelimit,typelimit,checkfor) {

    var fileSize = 100;
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera;

    if (isIE && !target.files) {
        var filePath = target.value;
        try{
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            var file = fileSystem.GetFile (filePath);
            fileSize = file.Size;
        }catch(e){
            fileSize = sizelimit-200;
        }
    } else {
        fileSize = target.files[0].size;
    }
    var size = fileSize / 1024;
    if(size>(sizelimit*1024)){
        alert("上传文件不能大于"+sizelimit+"M");
        target.value="";
        checkfor && $(checkfor).val('');
        return false;
    }
    var name=target.value;
    var _regType = new RegExp(typelimit);
    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();

    if(!_regType.test(fileName)){
        alert("请选择"+typelimit+"格式文件上传！");
        target.value="";
        checkfor && $(checkfor).val('');
        return false;
    }

    checkfor && $(checkfor).val('ok');
    regForm($(checkfor));
}


function fileChangetips(target,sizelimit,typelimit,checkfor) {

    var fileSize = 100;
    var userAgent = navigator.userAgent; //取得浏览器的userAgent字符串
    var isOpera = userAgent.indexOf("Opera") > -1;
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera;

    checkfor.parent().find('span').remove();

    if (isIE && !target.files) {
        var filePath = target.value;
        try{
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            var file = fileSystem.GetFile (filePath);
            fileSize = file.Size;
        }catch(e){
            fileSize = sizelimit-200;
        }
    } else {
        fileSize = target.files[0].size;
    }
    var size = fileSize / 1024;
    if(size>(sizelimit*1024)){
        checkfor.after('<span class="error">上传文件不能大于'+sizelimit+'M</span>');
        target.value="";
        return false;
    }
    var name=target.value;
    var _regType = new RegExp(typelimit);
    var fileName = name.substring(name.lastIndexOf(".")+1).toLowerCase();

    if(!_regType.test(fileName)){
        checkfor.after('<span class="error">请选择'+typelimit+'格式文件上传！</span>');
        target.value="";
        return false;
    }

    rename = 0;
    checkfor.parent().siblings().find('input').each(function(i){
        if($(this).val()==name){
            rename = 1;
        }
    });
    if(rename){
        checkfor.after('<span class="error">请不要上传两张一模一样的图片</span>');
        target.value="";
        return false;
    }

    checkfor.after('<span class="ok"></span>');
}



$(function(){

    $('.Ra_checkboxlist label').live('click',function(){
        var $this = $(this);
        $this.siblings().find('input').removeAttr('checked');

        var $checkfor = $($this.parent().attr('check-for'));
        if($this.find('input').is(':checked')){
            $checkfor.val('ok').siblings('span.error').remove();
        }else{
            $checkfor.val('');
        }
    });

    $.getScript('/static/js/jquery.zclip.min.js',function(){

        $('.J_copytext').zclip({
            path:'/static/js/ZeroClipboard.swf',
            copy:function(){
                return $(this).attr('data-copy');
            },
            afterCopy:function(){
                $('.J_copytext').removeClass('J_copytextok');
                $(this).text('复制成功').addClass('J_copytextok');
            }
        });

    });


});