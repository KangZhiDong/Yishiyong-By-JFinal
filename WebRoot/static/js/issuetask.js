$(function(){
	//点击选择琳琅金币对应样式以及相关数据获取展示
	var _buyqf_state = -1;
	$('.business-buyrqf-state .open').click(function(){
		var $this = $(this);
		var _index =  $this.index();
		if(_index == _buyqf_state){
			return false;
		}
		
		$("[name=gold]").val($(this).attr("gold"));
		
		_buyqf_state = _index;
		$this.addClass('active').siblings().removeClass('active');
		var name = $(this).attr('text');
		var _mat = (/\d{1,}/).exec(name);
		name = name.replace(_mat,'<strong class="font_red">'+_mat+'</strong>');
		$('.J_typename').html(name);
		$('.J_payVal').text($this.find('.J_pay').text().replace('元',''));	
		hide_ac_other();
		getCutRes();
	});
	
	//首次进入购买琳琅金币页面时默认执行选择第一个
	$('.business-buyrqf-state .open:eq(1)').trigger('click');
	resetAllDefault();
});