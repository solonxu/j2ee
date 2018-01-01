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
	<div class="detail">
		<table class="enterWareDetailTable" style="">
			<tr>
				<td class="cls-data-th-detail">开单日期：</td>
				<td>2017-07-26</td>
				<td class="cls-data-th-detail">厂家编号：</td>
				<td>A00</td>
				<td class="cls-data-th-detail">采购单号：</td>
				<td>JC20170726005</td>
				<td class="cls-data-th-detail">采购员：</td>
				<td>管理员</td>
			</tr>
			<tr>
				<td class="cls-data-th-detail">采购金额：</td>
				<td>1,000</td>
				<td class="cls-data-th-detail">付款标识：</td>
				<td>2</td>
				<td class="cls-data-th-detail">采购店面：</td>
				<td></td>
				<td class="" colspan="2"></td>
			</tr>
			<tr>
				<td class="cls-data-th-detail">备注：</td>
				<td colspan="7"></td>
			</tr>
		</table>
		<table class="dataTable">
			<thead>
				<tr>
					<td>商品索引号</td>
					<td>订单号</td>
					<td>商品编号</td>
					<td>商品名称</td>
					<td>颜色</td>
					<td>尺寸</td>
					<td style="width: 120px;">材质</td>
					<td>单位</td>
					<td>采购量</td>
					<td>已到量</td>
					<td>进价</td>
					<td>合计</td>
					<td>到货日期</td>
					<td>备注</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>商品索引号</td>
					<td>订单号</td>
					<td>商品编号</td>
					<td>商品名称</td>
					<td>颜色</td>
					<td>尺寸</td>
					<td style="width: 120px;">材质</td>
					<td>单位</td>
					<td>采购量</td>
					<td>已到量</td>
					<td>进价</td>
					<td>合计</td>
					<td>到货日期</td>
					<td>备注</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>