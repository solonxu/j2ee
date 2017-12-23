<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css">
	
<script src="${ctxStatic}/js/jquery.js"></script>
<script src="${ctxStatic}/js/jquery-ui.min.js"></script>
<script src="${ctxStatic}/js/bootstrap.js"></script>
<style type="text/css">
.control-label {
	text-align: right;
	padding: 0px 10px;
}

.col-lg-7, .col-md-7, .col-sm-7 {
	padding: 0px;
}

.col-lg-7, .col-md-7, .col-sm-7, .form-control {
	height: 25px;
}

.form-control {
	padding: 0px;
}

.row {
	margin: 5px 0px;
}

.searchForm {
	background-color: #f2f5ff;
	border: 1px solid #cbd1d3;
	border-radius: 7px;
}

#goods_guid_report1_nodata_tr {
	text-align: center;
}
.cls-title {
	font-weight: bold;
}
#goodsManageData {
	font-size: 13px;
}
label {
	font-weight: normal;
	font-size: 13px;
}

#goods_guid_report1_nodata_tr {
	display: none;
}
.selected{
	background-color:#acfaf0;
}
.cls-data-tr-head-list{
	height:25px;
}
</style>
<script type="text/javascript">
	$(function(){
		$("#goodsManageData tbody").on("mouseenter", "td", function(){
			$(this).siblings("td").removeClass( 'highlight' );
            $(this).siblings("td").addClass('highlight');
            $(this).removeClass( 'highlight' );
            $(this).addClass('highlight');
		});
		$("#goodsManageData tbody").on('mouseleave', 'td', function () {
			$(this).siblings("td").removeClass( 'highlight' );
			$(this).removeClass( 'highlight' );
		});
		$("#goodsManageData tbody input[type=checkbox]").on("click", function () {
			var tdObj = $(this).parent().parent();
			if(this.checked){
	            $(tdObj).siblings("td").addClass('selected');
	            $(tdObj).addClass('selected');
			}else{
				$(tdObj).siblings("td").removeClass('selected');
	            $(tdObj).removeClass('selected');
			}
			var theadChecked = false;
			$("#goodsManageData tbody tr input[type=checkbox]").each(function(index){
				if(this.checked){
					theadChecked = true;
				}else{
					theadChecked = false;
					return false;
				}
            });
			$("#goodsManageData thead tr input[type=checkbox]")[0].checked = theadChecked;
		});
		$("#goodsManageData thead input[type=checkbox]").on("click", function () {
			var tdObj = $(this).parent().parent();
			if(this.checked){
	            $("#goodsManageData tbody tr input[type=checkbox]").each(function(index){
	            	this.checked = true;
	            });
			}else{
				$("#goodsManageData tbody tr input[type=checkbox]").each(function(index){
	            	this.checked = false;
	            });
			}
		});
	});
	
	function editGoods(){
		var editId = 148074 ;
		$("#myModal1 iframe").attr("src","/goods/detail?goodId="+editId);
	}
</script>
</head>
<body marginwidth="0" marginheight="0">
	<div id="">
		<form action="" method="post" class="searchForm" role="form">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家编号</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品索引号</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品编号</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品名称</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品颜色</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品尺寸</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">商品材质</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">订货详情</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<input type="text" class="form-control">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-3">
					<label class="control-label col-lg-5 col-md-5 col-sm-5">隐藏的商品</label>
					<div class="col-lg-7 col-md-7 col-sm-7">
						<select class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select>
					</div>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox1" value="option1"> 不带/
					</label>
				</div>

				<div class="col-lg-2 col-md-2 col-sm-2">
					<label class="checkbox-inline"> <input type="checkbox"
						id="inlineCheckbox1" value="option1"> 分析无库存商品
					</label>
				</div>
				<div class="col-lg-1 col-md-1 col-sm-1">
					<button>查询</button>
				</div>
			</div>
		</form>
		<font color="red">说明：</font> <font color="blue">删除记录时，如果有库存量则不会删除；鼠标放在索引号上显示该商品的库存信息</font>
		<div style="height: 15px;"></div>

		<div id="">
			<form method="post" onsubmit="return false" style="margin: 0px">
				<span class="cls-title">商品资料</span>
				<div style="float: right;">
					<input type="button" value="隐藏商品" id="" name="" onclick=""><span
						style="margin-left: 9px;"></span><input type="button"
						value="取消隐藏商品" id="" name="" onclick=""><span
						style="margin-left: 9px;"></span><input type="button" value="新增商品"
						id="" name="" onclick="" /><span style="margin-left: 9px;"></span><input
						type="button" value="删 除" class="cls-button"><span
						style="margin-left: 9px;"></span><input type="button"
						value="导出Excel" class="cls-button2" />
				</div>

				<table class="cls-data-table" width="100%" id="goodsManageData">
					<thead>
						<tr class="cls-data-tr-head-list">
							<td class="cls-data-th-list" width="2%" align="center"
								valign="middle"><input type="checkbox" /></td>
							<td class="cls-data-th-list" width="3%">序号</td>
							<td class="cls-data-th-list" width="4%">编辑</td>
							<td class="cls-data-th-list" width="6%">索引号</td>
							<td class="cls-data-th-list" width="8%">商品编号</td>
							<td class="cls-data-th-list" width="15%">商品名称</td>
							<td class="cls-data-th-list" width="5%">商品颜色</td>
							<td class="cls-data-th-list" width="5%">商品尺寸</td>
							<td class="cls-data-th-list" width="15%">商品材质</td>
							<td class="cls-data-th-list" width="4%">进价</td>
							<td class="cls-data-th-list" width="4%">售价</td>
							<td class="cls-data-th-list" width="4%">乐从售价</td>
							<td class="cls-data-th-list" width="4%">毛利</td>
							<td class="cls-data-th-list" width="3%">单位</td>
							<td class="cls-data-th-list" width="3%">货期</td>
							<td class="cls-data-th-list" width="10%">订货详情</td>
							<td class="cls-data-th-list" width="7%">录入员</td>
							<td class="cls-data-th-list" width="8%">录入日期</td>
						</tr>
					</thead>
					<tbody>
						<tr id="goods_guid_report1_nodata_tr" class="">
							<td class="cls-data-td-editlist" bgcolor="#ffffff" colspan="18">没有数据</td>
						</tr>
						<tr id="" class="cls-data-tr-even">
							<td class="cls-data-td-editlist" align="center" valign="middle"><div
									 class="cls-data-content-list">
									<input type="checkbox" 
										name="" 
										>
								</div></td>
							<td class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">1</div></td>
							<td><div
									class="cls-data-content-list">
									<input type="button" value="编辑" data-toggle="modal" data-target="#myModal"
										onclick="editGoods();">
								</div></td>
							<td id="" ><div
									class="cls-data-content-list">
									<span onmouseover="this.style.cursor='pointer'"
										title="商品索引号148074的库存信息：null">148074</span>
								</div></td>
							<td class="cls-data-td-editlist"
								align="center"><div 
									class="cls-data-content-list">A08CFC03500003</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">茶几</div></td>
							<td id="" ><div 
									class="cls-data-content-list">黑胡桃</div></td>
							<td id="" 
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">1372x772x390</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">~1、法国流金大理石面板；2、木材为黑胡桃实木表面开放清漆处理；3不锈钢底架,表面抛亮光</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">2950.0</div></td>
							<td id="" 
								align="center"><div 
									class="cls-data-content-list">7640.0</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									 class="cls-data-content-list">0.0</div></td>
							<td id="" 
								align="center"><div 
									class="cls-data-content-list">0.61</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">张</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">55</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list"></div></td>
							<td id=""
								class="cls-data-td-editlist"
								align="center"><div 
									class="cls-data-content-list">贺会</div></td>
							<td id="" 
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">2017-03-30</div></td>
						</tr>
						<tr id="goods_guid_report1_nodata_tr" class="">
							<td class="cls-data-td-editlist" bgcolor="#ffffff" colspan="18">没有数据</td>
						</tr>
						<tr id="" class="cls-data-tr-even">
							<td class="cls-data-td-editlist" align="center" valign="middle"><div
									 class="cls-data-content-list">
									<input type="checkbox" 
										name="" 
										>
								</div></td>
							<td class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">1</div></td>
							<td><div
									class="cls-data-content-list">
									<input type="button" value="编辑" data-toggle="modal" data-target="#myModal"
										onclick="editGoods();">
								</div></td>
							<td id="" ><div
									class="cls-data-content-list">
									<span onmouseover="this.style.cursor='pointer'"
										title="商品索引号148074的库存信息：null">148074</span>
								</div></td>
							<td class="cls-data-td-editlist"
								align="center"><div 
									class="cls-data-content-list">A08CFC03500003</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">茶几</div></td>
							<td id="" ><div 
									class="cls-data-content-list">黑胡桃</div></td>
							<td id="" 
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">1372x772x390</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">~1、法国流金大理石面板；2、木材为黑胡桃实木表面开放清漆处理；3不锈钢底架,表面抛亮光</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">2950.0</div></td>
							<td id="" 
								align="center"><div 
									class="cls-data-content-list">7640.0</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									 class="cls-data-content-list">0.0</div></td>
							<td id="" 
								align="center"><div 
									class="cls-data-content-list">0.61</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">张</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">55</div></td>
							<td id=""
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list"></div></td>
							<td id=""
								class="cls-data-td-editlist"
								align="center"><div 
									class="cls-data-content-list">贺会</div></td>
							<td id="" 
								class="cls-data-td-editlist" align="center"><div
									class="cls-data-content-list">2017-03-30</div></td>
						</tr>
					</tbody>
				</table>

			</form>
		</div>

	</div>
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						编辑商品
					</h5>
				</div>
				<div class="modal-body">
					<iframe frameborder="0" allowtransparency="true" style="width: 100%; height: 400px; border: 0px none;">
					</iframe>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary">
						提交更改
					</button>
				</div> -->
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</body>
</html>