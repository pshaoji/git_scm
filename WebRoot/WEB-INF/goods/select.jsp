<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.searchbox{
	margin:-3
}
</style>
  
    <title>goods list page</title>
  	<script type="text/javascript">
  		$(function(){
  			var win = parent.$("iframe[title='商品入库']").get(0).contentWindow;//返回ifram页面文档（window)
	  		$('#dg').datagrid({    
	  		
			    //url:'${proPath}/supplier/selectPage.action', //支持单个关键字的分页查询  			 
				url:'${proPath}/goods/selectPageUseDyc.action', //支持多个条件的分页查询
			    striped:true,
			    fitColumns:true,
			    idField:'goodsId',
			    rownumbers:true,
			    loadMsg:"加载中，请稍等...",
			    pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,15],
			    singleSelect:true,			
			    
			    toolbar: [{
					iconCls: 'icon-ok',
					text:'确定',
					handler: function(){
						alert('add按钮');
						var row = $('#dg').datagrid("getSelected");
						if(row==null){
							alert("请选择商品");
							return false;
						}
						/* 			     			        {field:'goodsId',title:'商品编号',width:100},    
			        {field:'goodsName',title:'商品名称',width:100},  
			        {field:'goodsType',title:'型号',width:100},    
			        {field:'goodsUnit',title:'单位',width:100},
			        {field:'bodAmount',title:'数量',width:100}, 
			        {field:'bodBuyPrice',title:'进价（元）',width:100},  
			        {field:'bodTotalPrice',title:'总价（元）',width:100},   
			        {field:'bodIMEIList',title:'串号',width:100,align:'right'}     */
						alert(row.goodsId+"|"+row.goodsColor);
						win.$('#dg').datagrid('appendRow',{
							goodsId: row.goodsId,
							goodsName:row.goodsName,
							goodsType: row.goodsType,
							goodsUnit:row.goodsUnit,
							bodAmount:$('#bodAmount').val(),
							bodBuyPrice:$('#bodBuyPrice').val(),
							bodTotalPrice:$('#bodBuyPrice').val()*$('#bodAmount').val(),
							bodIMEIList:$('#bodIMEIList').val()
						});
						
						parent.$('#win').window("close");
						
					}				
				},'-',{
					text:"<input type='text' id='goodsName' name='goodsName'/>"
				}],

			    columns:[[    
			    	{checkbox:true},    
			        {field:'goodsId',title:'商品编号',width:100},    
			        {field:'goodsName',title:'商品名称',width:100},   
			        {field:'goodsRemark',title:'备注',width:100,align:'right'}    
			    ]]    
			});  
			
			$('#goodsName').searchbox({ 
			searcher:function(value,name){ 
					alert(value + "," + name);
							
					$('#dg').datagrid('load',{
						goodsName:likeParam(value)
					});					
				}, 				
				prompt:'请输入供应商地址' 
			}); 
  		
  		});
  		//
  		function likeParam(value){
  			if(value==""){
  				return "";
  			}else{
  				return '%'+value+'%';
  			}
  		}
  		
  	</script>
  
  </head>  
  <body>

 	<table id="dg"></table>  
<form action="">
数量：<input type="text" name="bodAmount"  id="bodAmount">
价格：<input type="text" name="bodBuyPrice" id="bodBuyPrice" >
串号：<input type="text" name="bodIMEIList" id="bodIMEIList" >
</form>


  </body>
</html>