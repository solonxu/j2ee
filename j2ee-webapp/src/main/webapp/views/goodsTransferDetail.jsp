<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货品转换单明细</title>
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">截止日期</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">开单员</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">单号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">备注</label>
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">颜色</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">尺寸</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">材质</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">转换原因</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">转换类型从</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">请选择</option>
						<option>可用量</option>
						<option>样板量</option>
						<option>摆场量</option>
						<option>报损量</option>
						<option>退厂量</option>
					</select>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">转换类型到</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<select>
						<option selected="selected">请选择</option>
						<option>可用量</option>
						<option>样板量</option>
						<option>摆场量</option>
						<option>报损量</option>
						<option>退厂量</option>
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
						<span>货品转换单明细查询</span>
					</div>
					<div class="floatRight">
						<input type="button" value="导出excel" /> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>序号</td>
						<td>转换单号</td>
						<td>日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td>转换类型从</td>
						<td>转换类型至</td>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>数量</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>序号</td>
						<td>转换单号</td>
						<td>日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td>转换类型从</td>
						<td>转换类型至</td>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>数量</td>
					</tr>
				</tbody>
			</table>
			<div style="height:10px;"></div>
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>转换单明细</span>
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>转换类型从</td>
						<td>转换类型至</td>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>数量</td>
						<td>进价</td>
						<td>转换原因</td>
						<td>责任</td>
						<td>处理方案</td>
						<td>反转日期</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>转换类型从</td>
						<td>转换类型至</td>
						<td>商品索引号</td>
						<td>商品编号</td>
						<td>商品名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>材质</td>
						<td>单位</td>
						<td>数量</td>
						<td>进价</td>
						<td>转换原因</td>
						<td>责任</td>
						<td>处理方案</td>
						<td>反转日期</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>