<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货品转换单</title>
<link rel="stylesheet" href="/static/css/jquery-ui.min.css">
<link rel="stylesheet" href="/static/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/static/css/bootstrap.min.css">
<link rel="stylesheet" href="/static/css/style.css">
<script src="/static/js/jquery.js"></script>
<script src="/static/js/jquery-ui.min.js"></script>
<script src="/static/js/jquery.dataTables.min.js"></script>
<script src="/static/js/bootstrap.js"></script>
<style type="text/css">
.detail .dataTable td{
	text-align:center;
}
.modal1{
	margin:0px auto;
}
.enterWareDetailTable{
	width:100%;
}
.enterWareDetailTable .cls-data-th-detail{
	height:37px;
}
</style>
<script type="text/javascript">
	$(function(){
		var table = $(".dataTable").DataTable({
			"language": {
	            "lengthMenu": "每页显示 _MENU_ 条记录",
	            "zeroRecords": "没有数据显示",
	            "info": "当前第_PAGE_页/_PAGES_页 共_TOTAL_条记录",
	            "infoEmpty": "无数据可用",
	            "paginate": {
	                "previous": "上页",
	                "next":"下页"
	             }
	        },
	        responsive: true,
		    "dom" :"<<t>ip>",
		    "columnDefs": [
		        { "orderable": false, "targets": 0 }
		      ]
		});
	});
</script>
</head>
<body>
<div>
	<div style="height:10px;"></div>
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>货品转换单</span>
					</div>
					<div class="floatRight">
						<input type="button" value="打印报损单" /> 
						<input type="button" value="添 加" /> 
						<input type="button" value="删 除" /> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td></td>
						<td>序号</td>
						<td>转换单号</td>
						<td>日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td>操作</td>
						<td>编辑</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="radio" name="selected" /></td>
						<td>序号</td>
						<td>转换单号</td>
						<td>日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td><input type="button" value="添加商品"  data-toggle="modal" data-target="#addGoods" ></td>
						<td><img src="/static/images/rowedit.gif" data-toggle="modal" data-target="#addGoodsTransfer" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade modal1" id="addGoodsTransfer" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						进仓单明细
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 430px; border: 0px none;">
						<div class="description" style="display:none;">
							<font color="red">说明：</font>
							<font color="blue">1、操作步骤：首先保证库位号不能为空(先保存库位号，否则审核不通过)，其次单击“审核通过按钮”（不用选中条码，默认审核该进仓单的所有条码）；<br/>
2、批量修改库位号(在仅限修改的输入框里录入库位号)，不用选中条码，默认修改该进仓单的所有条码；<br/>
3、修改(选中条码)库位号（库位号在下面仅限修改的输入框录入）；4、修改单个条码的库位号和备注，直接在商品里面修改，然后保存即可</font>
						</div>
						<form action="" method="post" class="searchForm" role="form">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">库位号</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">权限修改</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										
									</div>
								</div>
							</div>
						</form>
						<div class="description">
							<font color="red">说明：</font><font color="blue">1、审核通过按钮，不用选中条码，默认审核该进仓单的所有条码商品； 2、批量修改库位号，不用选中条码，默认修改该进行单的所有商品；
							3、修改(选中条码)库位号，修改选中条码的库位号</font>
						</div>
						<div class="detail">
							<form method="post" onsubmit="return false" class="">
								<div style="height:24px;">
									<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
										<span></span>
									</div>
									<div class="floatRight">
										<input type="button" value="审核通过(更新可用量)" hidden="true" />
										<input type="button" value="审核通过(更新样板量)" hidden="true"   />
										<input type="button" value="打 印"  />
										<input type="button" value="修改(选中条码)库位号"  />
										<input type="button" value="批量修改库位号"  />
										<input type="button" value="审核通过"  />
										<input type="button" value="删除【不包括匹配的条码】"  />
										<input type="button" value="删 除" />
										<input type="button" value="保 存"  /> 
									</div>
								</div>
							</form>
							<table class="dataTable order-column">
								<thead>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td>库位号</td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td>备注</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td style="width:30px"><input type="text" ></td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td><textarea></textarea></td>
									</tr>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td style="width:30px"><input type="text" ></td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td><textarea></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade modal1" id="addGoods" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						进仓单明细
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 430px; border: 0px none;">
						<div class="description" style="display:none;">
							<font color="red">说明：</font>
							<font color="blue">1、操作步骤：首先保证库位号不能为空(先保存库位号，否则审核不通过)，其次单击“审核通过按钮”（不用选中条码，默认审核该进仓单的所有条码）；<br/>
2、批量修改库位号(在仅限修改的输入框里录入库位号)，不用选中条码，默认修改该进仓单的所有条码；<br/>
3、修改(选中条码)库位号（库位号在下面仅限修改的输入框录入）；4、修改单个条码的库位号和备注，直接在商品里面修改，然后保存即可</font>
						</div>
						<form action="" method="post" class="searchForm" role="form">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">库位号</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">权限修改</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										
									</div>
								</div>
							</div>
						</form>
						<div class="description">
							<font color="red">说明：</font><font color="blue">1、审核通过按钮，不用选中条码，默认审核该进仓单的所有条码商品； 2、批量修改库位号，不用选中条码，默认修改该进行单的所有商品；
							3、修改(选中条码)库位号，修改选中条码的库位号</font>
						</div>
						<div class="detail">
							<form method="post" onsubmit="return false" class="">
								<div style="height:24px;">
									<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
										<span></span>
									</div>
									<div class="floatRight">
										<input type="button" value="审核通过(更新可用量)" hidden="true" />
										<input type="button" value="审核通过(更新样板量)" hidden="true"   />
										<input type="button" value="打 印"  />
										<input type="button" value="修改(选中条码)库位号"  />
										<input type="button" value="批量修改库位号"  />
										<input type="button" value="审核通过"  />
										<input type="button" value="删除【不包括匹配的条码】"  />
										<input type="button" value="删 除" />
										<input type="button" value="保 存"  /> 
									</div>
								</div>
							</form>
							<table class="dataTable order-column">
								<thead>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td>库位号</td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td>备注</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td style="width:30px"><input type="text" ></td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td><textarea></textarea></td>
									</tr>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>采购单号</td><td>条形码</td><td style="width:30px"><input type="text" ></td><td>商品索引号</td>
										<td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品材质</td><td><textarea></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</div>
</body>
</html>