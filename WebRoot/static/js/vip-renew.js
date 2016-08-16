function getTime(date){
	return {
	  date: date,
	  year : parseInt(date.getFullYear()),
	  month : parseInt((date.getMonth()+1)),
	  day :parseInt(date.getDate()),
	  hour :parseInt(date.getHours()),
	  minute : parseInt(date.getMinutes()),
	  second : parseInt(date.getSeconds())
	}
}


//获取价格与日期
function getWillPrice(){
	var _time_set = parseInt($('input[name="time-list"]:checked').val() || 0); //月份
	var _k = parseFloat($('input[name="time-list"]:checked').attr('data-k') || 0); //钱
	var $J_date_limit = $('#J_date_limit'),$J_price_to_pay = $('.J_price_to_pay'),$J_type = $('.J_type');	

	var now=new Date($('#J_date_limit').attr('y')); //过期时间
	
	//var now=new Date();
	var newdate=new Date();
	
	var newtimems=now.getTime()+(24*60*60*1000);

	newdate.setTime(newtimems); //有效期至
    
	var date = getTime(newdate), _nowMon = date.month,_nowYear = date.year,_nowDay = date.day;

	$J_price_to_pay.html((_k).toFixed(2));

	$J_type.html(_time_set);

	var _endY = _nowMon + _time_set; //月份

	var _monthNew = _endY%12; //新月份
	//alert(_monthNew);
	
	//获取当前的日期加上选择购买的日期弱超过12个月则加一年，月份将12取余！
	//年
	//alert(_nowYear);
	//alert(_endY);
	if(_endY >= 12){
		var _yearNew = (_endY-_monthNew)/12+_nowYear;
	}else{
		var _yearNew = _nowYear;
	}
	
	if(_monthNew==0){ 
		_monthNew =12;
		_yearNew = _yearNew-1;
	}

	if(_monthNew < 10){ _monthNew = '0'+_monthNew; }
	if(_nowDay < 10){ _nowDay = '0'+_nowDay; }

	$J_date_limit.html(_yearNew+"-"+_monthNew+"-"+_nowDay);

	var temp_now = new Date(_yearNew+"-"+_monthNew+"-"+_nowDay);
	//alert(temp_now);
	
	var temp_now_hs = temp_now.getTime(); //购买会员到期的时间戳
	var tp_now = new Date();
	//iDays  =  parseInt(Math.abs(temp_now_hs  -  tp_now)  /  1000  /  60  /  60  /24);
	//alert(iDays);
	var tp = tp_now.getTime()+(350*24*60*60*1000);//满足年会员的时间戳（大于等于350天）
	if(temp_now_hs >= tp){
		
		$('#is_nianfei_huiyuan').text('是年付费会员，');
		//$('#nianfei_huiyuan'+_time_set).html('<img src="/static/images/common/nian.png" />');
	}
	else{
		$('#is_nianfei_huiyuan').text('非年付费会员，');
		//$('#nianfei_huiyuan'+_time_set).html('');
	}
	
	getCutRes();
}


function hide_ac_other(){
	var $par = $('.J_showmoreacother').parent();
	$('.J_showmoreacother').removeClass('active');
	$par.siblings('.J_ac_other').fadeOut(500).removeClass('active');
	$par.removeClass('active');
	cardCheck.resetAllRadio();
}

var cardCheck = {
	enable:function(){cardCheck.resetAllRadio(); $('.J_cardlist').removeClass('disabled'); },
	disabled:function(){ hide_ac_other();$('.J_cardlist').addClass('disabled'); },
	resetAllRadio:function(){
		var $inputs = $('.J_cardlist').find('input');
		for(var i=0;i<$inputs.length;i++){
			$inputs.eq(i)[0].checked = false;
		}
	}
}

var listActiveCheck = {
	active:function($this){
		$this.addClass('active'); 		
		if(!$this.find('input').is(':checked')){
			$this.find('input')[0].checked = true;
		}
	},
	unactive:function($this){ 
		$this.removeClass('active'); 
		$this.find('.J_pay_cut_price').text(0); 
		$this.find('input')[0].checked = false;		
	}
}


var PayEnd = 0;

//计算银行卡支付后
function getCutRes(inp){	
	var _check_pay = $('input[name="pay_id"]:checked');
	$('.J_pay_cut').each(function(){
		if(!$(this).hasClass('disabled'))
		$(this).find('.J_pay_cut_check').removeAttr('disabled');
	});
	var $res = $('.J_pay_cut_res'),$pay = $('.J_payVal'),$cut;
	var _pay = parseFloat($pay.text()),_cut = 0,$temp,$tempcut,_temp_price,_res;
	if(inp){
		$cut = $('.J_pay_cut .J_pay_cut_check:checked');	
	}else{
		$cut = $('.J_pay_cut .J_pay_cut_check');	
	}
    
	cardCheck.enable();
	for(var i =0;i<$cut.length;i++){
			$temp = $cut.eq(i).parents('.J_pay_cut'),$tempcut = $temp.find('.J_pay_cut_price');		
			_temp_price = parseFloat($tempcut.attr('data-enable')=='' ? 0 : $tempcut.attr('data-enable'));
			if(_pay<_temp_price || _pay==_temp_price){
				cardCheck.disabled();
				$temp.nextAll('.J_pay_cut').each(function(){
					listActiveCheck.unactive($(this));
					$(this).find('input').attr('disabled','disabled');
				});				
				$temp.find('.J_pay_cut_price').text(_pay);
				_pay = 0;
				break;
			}else{
				$tempcut.text(_temp_price);
				_pay = _pay - _temp_price;
			}
	}
	if(_check_pay.length > 0){
	    $('input[name="pay_id"][value="'+ _check_pay.val() +'"]').attr("checked",true);
	}
	$('input[name="pay_id"]').eq(0).trigger('click');
	$res.text(_pay.toFixed(2));
	PayEnd = _pay.toFixed(2);
}


function resetAllDefault(){
	//getCutRes();
	$('.J_mainpay').each(function(){
		var $this = $(this),_pos = parseFloat($this.find('.J_pay_cut_price').text());
		if(_pos>0){
			listActiveCheck.active($this);
		}	
	});
	
	//$('input[name="price-list"]:checked').trigger('click');
	//$('input[name="time-list"]:checked').trigger('click');
	//hide_ac_other();
}


function bindCheck(){
	
	var _enable = $('input[name="price-list"]:checked').attr('data-banding') || 0;
	
	var $bindlist = $('input[name="banding-list"]:checked'),_checkLen = $bindlist.length;
	var $unbindlist = $('input[name="banding-list"]:not(:checked)');
	if(_checkLen<_enable){
		enable($unbindlist);
	}else{
		disable($unbindlist);
		$('input[name="banding-list"]:checked:gt('+(_enable-1)+')').each(function(){
			$(this)[0].checked = false;	
			$(this).attr('disabled','disabled');
		});
	}	
	function disable($_list){
		for(var i = 0;i<$_list.length;i++){
			$_list.eq(i).attr('disabled','disabled');
		}	
	}
	
	function enable($_list){
		for(var i = 0;i<$_list.length;i++){
			$_list.eq(i).removeAttr('disabled');
		}	
	}
}


function delbindCheck(){
	var l = Number($('input[name="price-list"]:checked').attr('data-banding')) || 0;
	var i = l-1;
	$('input[name="banding-list"]').removeAttr('checked');
	$('input[name="banding-list"]').removeAttr('disabled');
	$('input[name="banding-list"]:lt('+l+')').attr('checked','checked');
	$('input[name="banding-list"]:gt('+i+')').attr('disabled','disabled');
	// var day = $('input[name="price-list"]:checked').attr('day');
	// var datatype = $('input[name="price-list"]:checked').attr('data-type');
	// $('#zhesuan').html(datatype+day);
	// if(datatype==$('#yuanlv').text()){
	// 	$('#zhesuanbox').hide();
	// }else{
	// 	$('#zhesuanbox').show();
	// }
}



$(function(){
	$('.J_pay_cut').each(function(){
		var _en = $(this).find('.J_pay_cut_price').attr('data-enable');
		if(_en=='0' || _en ==''){
			$(this).addClass('disabled');
			$(this).find('.J_pay_cut_check').attr('disabled','disabled');
		}else{
			$(this).removeClass('disabled');
		}
	});
	
	$('input[name*="-list"]').live('click',function(e){
		getWillPrice();
		resetAllDefault();
	});
	
	// $('input[name="price-list"],input[name="banding-list"]').live('click',function(e){
	// 	if($(this).attr('name')=='price-list'){
	// 		delbindCheck();
	// 	}
	// 	bindCheck();
	// });
	
	
	
	$('.J_showmoreacother').live('click',function(){
		$(this).addClass('active');
		$(this).parent().siblings('.J_ac_other').fadeIn(500);	
	});
	
	$('.J_ac_other label').live('click',function(){
		var $par = $(this).parent();	
		if($par.hasClass('disabled')){ return false;};
		listActiveCheck.active($par);
		$par.siblings('.J_ac_other').each(function(){
			listActiveCheck.unactive($(this));			
		});
	});
	
	$('.J_mainpay input').live('click',function(e){
		var $par = $(this).parent().parent();
		if($par.hasClass('disabled')){ return false;};
		if($par.hasClass('active')){
			listActiveCheck.unactive($par);
			cardCheck.enable();
		}else{
			/*$par.siblings('.J_mainpay').each(function(){
				listActiveCheck.unactive($(this));
			});*/
			listActiveCheck.active($par);			
		}	
		getCutRes(true);
	});


	getWillPrice();
	resetAllDefault();
	delbindCheck();
	//$('.J_mainpay input').eq(0).trigger('click');
	//getCutRes();
	
});