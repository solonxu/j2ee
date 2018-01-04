<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>冲帐单</title>
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
.editForm{
	font-size:13px;
}
.editForm td input{
	height:20px;
	margin:2px 0px;
	width:100%;
}
.editForm td{
	margin:2px;
}
.editForm select{
	margin:2px 0px;
}
.editForm tr{
	margin:2px 0px;
}
.editForm .cls-data-th-detail{
	border:none;
}
.editForm .cls-data-td-editdetail{
	border:none;
}
.editForm table{
	margin:0px auto;
}
.modal1{
	width:500px;
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
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>冲帐单</span>
					</div>
					<div class="floatRight">
						<input type="button" value="添 加" data-toggle="modal" data-target="#addBill" /> 
						<input type="button" value="删 除" /> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>冲账单号</td>
						<td>开单日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td>厂家编号</td>
						<td>冲账标识</td>
						<td>总金额</td>
						<td>操作</td>
						<td>编辑</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>冲账单号</td>
						<td>开单日期</td>
						<td>开单员</td>
						<td>备注</td>
						<td>厂家编号</td>
						<td>冲账标识</td>
						<td>总金额</td>
						<td>操作</td>
						<td>编辑</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade modal1" id="addBill" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						新建冲帐单
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 230px; border: 0px none;">
						<form method="post" onsubmit="return false" class="editForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span>冲帐单信息</span>
								</div>
								<div class="floatRight">
									<input type="button" value="保 存" onclick="saveAddBill();"/> 
									<input type="button" value="重 置" />
								</div>
							</div>
							<table class='cls-data-table-detail'
								style="table-layout: fixed; border: none; width:100%;" >
								<tr>
									<td class='cls-data-th-detail' width="120px">冲帐单号：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="text" value="" style="width:95%" disabled="disabled"/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">开单日期：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="date" value="" style="width:95%" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">厂家编号：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="date" value="" style="width:95%" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">备注：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<textarea cols="3" rows="3" style="width:95%"></textarea>
										</font>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
</div>
</body>
</html>