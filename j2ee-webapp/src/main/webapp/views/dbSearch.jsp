<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>调拨单查询</title>
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
	<form action="" method="post" class="searchForm" role="form">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">开单日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">至</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">第一执行日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">至</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">第二执行日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">至</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">发货处</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">收货处</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">调拨单号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">执行情况</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">请选择</option>
						<option>待发货方确认</option>
						<option>待收货方确认</option>
						<option>已完成</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">审核状态</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">请选择</option>
						<option>未审核</option>
						<option>已审核</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<button>查询</button>
			</div>
		</div>
	</form>
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>调拨单查询认</span>
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td><input type="checkbox" ></td>
						<td>操作</td>
						<td>审核日期</td>
						<td>审核人</td>
						<td>开单日期</td>
						<td>调拨单号</td>
						<td>发货处</td>
						<td>收货处</td>
						<td>第一执行日期</td>
						<td>第二执行日期</td>
						<td>开单员</td>
						<td>调拨总金额</td>
						<td>完成标记</td>
						<td>备注</td>
						<td>送货联系人</td>
						<td>送货联系电话</td>
						<td>送货地址</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" ></td>
						<td>操作</td>
						<td>审核日期</td>
						<td>审核人</td>
						<td>开单日期</td>
						<td>调拨单号</td>
						<td>发货处</td>
						<td>收货处</td>
						<td>第一执行日期</td>
						<td>第二执行日期</td>
						<td>开单员</td>
						<td>调拨总金额</td>
						<td>完成标记</td>
						<td>备注</td>
						<td>送货联系人</td>
						<td>送货联系电话</td>
						<td>送货地址</td>
					</tr>
				</tbody>
			</table>
			<div style="height:10px;"></div>
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>调拨单明细（调拨单号）</span>
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>调拨数量</td>
						<td>已出量</td>
						<td>已收量</td>
						<td>样板标识</td>
						<td>备注</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>调拨数量</td>
						<td>已出量</td>
						<td>已收量</td>
						<td>样板标识</td>
						<td>备注</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>