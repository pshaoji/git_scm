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
  
    <title>supplier list page</title>
  	<script type="text/javascript">
  		$(function(){
	  		$('#dg').datagrid({    
	  		
			   /*  //url:'${proPath}/supplier/selectPage.action', //支持单个关键字的分页查询  			 
				url:'${proPath}/supplier/selectPageUseDyc.action', //支持多个条件的分页查询 */
			    striped:true,
			    fitColumns:true,
			    idField:'goodsId',
			    rownumbers:true,
			    loadMsg:"加载中，请稍等...",
			   /*  pagination:true,
			    pageSize:5,
			    pageList:[2,5,10,15], */
			    //支持单个关键字分页查询
			 /*     queryParams:{
					keyWord:'%%'
				}, */
				//支持多条件分页查询
			   /*  queryParams:{
					supName:'%%',
					supAddress:'%%'
				},  */
			    
			    toolbar: [{
					iconCls: 'icon-add',
					text:'添加商品',
					handler: function(){
						alert("添加商品");
						parent.$('#win').window({ 
							title:'选择商品',      
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/goods/select.action' title='选择商品' height='100%' width='100%' frameborder='0px' ></iframe>"
						     
						}); 
					}
				},'-',{
					iconCls: 'icon-edit',
					text:'删除商品',
					handler: function(){
						alert('删除商品');
						/* var rows = $('#dg').datagrid('getSelections');
						if(rows.length!=1){
							alert("请选择并且只能选择一条修改的记录！");
							return false;
						}
						
						parent.$('#win').window({ 
							title:'修改供应商',   
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/update.action' title='修改供应商' height='100%' width='100%' frameborder='0px' ></iframe>"
						     
						});  */
						
					}
				}
				,'-',{
					iconCls: 'icon-remove',
					text:'提交入库',
					handler: function(){
						//alert('提交入库按钮');
						/*
						1.获取选择的行，判断是否有选中
						2.获取行中记录ID数组
						3.确认是否删除
						4.提交删除请求
						5.刷新当前页面（列表部分）						
						*/
						//1.获取选择的行，判断是否有选中
					
						
						
					}
				}],
			     

			     
			    columns:[[    
			    	{checkbox:true},    
			        {field:'goodsId',title:'商品编号',width:100},    
			        {field:'goodsName',title:'商品名称',width:100},  
			        {field:'goodsType',title:'型号',width:100},    
			        {field:'goodsUnit',title:'单位',width:100},
			        {field:'bodAmount',title:'数量',width:100}, 
			        {field:'bodBuyPrice',title:'进价（元）',width:100},  
			        {field:'bodTotalPrice',title:'总价（元）',width:100},   
			        {field:'bodIMEIList',title:'串号',width:100,align:'right'}    
			    ]]    
			});  
			$('#supName').searchbox({ 
			searcher:function(value,name){ 
				alert(value + "," + name) ;
				parent.$('#win').window({ 
							title:'选择供应商',   
						    width:600,    
						    height:400,    
						    modal:true,
						    content:"<iframe src='${proPath}/base/goURL/supplier/select.action' title='选择供应商' height='100%' width='100%' frameborder='0px' ></iframe>"
						     
						});  
				}, 
				prompt:'请选择供应商' 
			}); 
		
  		});
  		
 
  	
  		
  	</script>
  
  </head>  
  <body>

  <form style="padding:15px;margin:0px;background:#eee;" id="ff" action="">
   请填写采购信息：<br>
 	供应商：<input type="text" id="supId" name="supId"/>
 	<input type="text" id="supName" name="supName"/>
 	仓库：<input type="text" id="shId" name="shId"/>
 	日期：<input  type="text" id="boDate"
				class="easyui-datebox" name="boDate" required="required"></input>

    应付：<input type="text" id="boPayable" name="boPayable"/><br>
    已付：<input type="text" id="boPaid" name="boPaid"/>
 	欠款：<input type="text" id="boArrears" name="boArrears"/>
 	原始单号：<input type="text" id="boOriginal" name="boOriginal"/><br>
 	经手人：<input type="text" id="boAttn" name="boAttn"/>
 	操作员：<input type="text" id="boOperator" name="boOperator"/>
 	备注：<input type="text" id="boRemark" name="boRemark"/>
 </form>

 	<table id="dg"></table>  



  </body>
</html>