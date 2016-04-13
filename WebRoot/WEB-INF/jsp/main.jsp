<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jspf" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

  
    <title>main page</title>
  	<script type="text/javascript">
  		$(function() {
			$("a[title]").click(function() {
				var title = this.title;
				var text = this.href;
				alert(title);
				//如果对应的面板已经存在，就选择，否则就添加新的面板
				if($('#tt').tabs("exists",title)){
					$('#tt').tabs("select",title);
				}else{
					$('#tt').tabs('add',{
						title:title,
						selected: true,
						closable:true,
						//href:xxx.jsp,
						//可以加载内容填充到选项卡，页面有Js时，也可加载
						content:"<iframe src='"+text+"' title='"+this.title+"' height='100%' width='100%' frameborder='0px' ></iframe>"

						//...
					});
				}
				
				return false;
				
			});
		});
  	
  	</script>
  
  </head>  
<body class="easyui-layout"> 
<!-- ---------------------------------头部信息---------------------------------------------- -->  
    <div data-options="region:'north',title:'进销存系统',split:true" style="height:150px;">
    	欢迎您：${sessionScope.account.accName}
    </div>   
    
<!-- -------------------------------------导航菜单------------------------------------- -->
    <div data-options="region:'west',title:'导航菜单',split:true" style="width:180px;">
    	
    	<div id="aa" class="easyui-accordion" style="width:300px;height:200px;">   
		    
			<div title="基础数据录入">
		<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
						<ul style="list-style: none;padding: 0px;margin:0px;">
							<li style="padding: 6px;"><a href="${proPath}/base/goURL/supplier/supplierlist.action"  title="供应商管理"
								style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
							</li>
							<li style="padding: 6px;"><a href="${proPath}/base/goURL/goods/goodslist.action" title="商品管理"
								style="text-decoration: none;display: block;font-weight:bold;" >商品管理</a>
							</li>
						</ul>
					</div>
					
					<div title="进货管理">
		<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
						<ul style="list-style: none;padding: 0px;margin:0px;">
							<li style="padding: 6px;"><a href="${proPath}/base/goURL/buyorder/insert.action" title="商品入库"
								style="text-decoration: none;display: block;font-weight:bold;">商品入库</a>
							</li>
							<li style="padding: 6px;"><a href="#" title="商品退货"
								style="text-decoration: none;display: block;font-weight:bold;" >商品管理</a>
							</li>
						</ul>
					</div>
					
					<div title="仓库管理">
		<!-- list-style: none去左边的点；text-decoration: none：去超链接下划线,title用来区分后继定位这里的超链接 -->
						<ul style="list-style: none;padding: 0px;margin:0px;">
							<li style="padding: 6px;"><a href="#" title="供应商管理"
								style="text-decoration: none;display: block;font-weight:bold;">供应商管理</a>
							</li>
							<li style="padding: 6px;"><a href="#" title="商品管理"
								style="text-decoration: none;display: block;font-weight:bold;" >商品管理</a>
							</li>
						</ul>
					</div>
	
	
	

 
		    <div title="Title2" data-options="iconCls:'icon-reload',selected:true" style="padding:10px;">   
		        content2    
		    </div>   
		    <div title="Title3">   
		        content3    
		    </div>   
		</div>  
    
    </div>  
    
<!-- -----------------------------------主要内容-------------------------------------------------- --> 
    <div data-options="region:'center',title:'主要内容'" style="padding:5px;background:#eee;">
    
	    <div id="tt" class="easyui-tabs" data-options="fit:true" style="width:500px;height:250px;">   
		    <div title="系统简介" style="padding:20px;">   
		        XXX进销存系统。。。。。。   
		    </div>   		  
		</div>  
	    
    
    </div>  
    <div id="win"></div> 
</body> 
</html>