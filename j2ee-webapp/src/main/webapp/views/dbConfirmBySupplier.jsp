<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<div class="col-lg-2 col-md-2 col-sm-2">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">大于等于</option>
						<option>小于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">开单日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">小于</option>
						<option>大于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">调拨单号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">第二调拨日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">大于等于</option>
						<option>小于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">第二调拨日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">小于</option>
						<option>大于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">执行情况</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">完成</option>
						<option>未完成</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">调拨日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">大于等于</option>
						<option>小于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">调拨日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1">
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">小于</option>
						<option>大于</option>
						<option>等于</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">备注</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" />
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-2">
				<label>
					<input type="checkbox" />过期未执行的调拨单
				</label>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-2">
				<label>
					<input type="checkbox" />未打印的调拨单
				</label>
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
						<span>发货方调拨确认</span>
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>操作</td>
						<td>调拨单号</td>
						<td>发货处</td>
						<td>收获处</td>
						<td>开单日期</td>
						<td>第一次执行日期</td>
						<td>第二次执行日期</td>
						<td>执行情况</td>
						<td>开单员</td>
						<td>备注</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>操作</td>
						<td>调拨单号</td>
						<td>发货处</td>
						<td>收获处</td>
						<td>开单日期</td>
						<td>第一次执行日期</td>
						<td>第二次执行日期</td>
						<td>执行情况</td>
						<td>开单员</td>
						<td>备注</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>