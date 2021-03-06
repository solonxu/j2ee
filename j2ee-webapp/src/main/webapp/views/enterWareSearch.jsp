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
		$(".modal .close").on("click", function(e){
			if($(this).hasClass("cgdDetail")){
				$(".modal-body iframe").hide();
				$("#enterWareDetail .modal-title").text("进仓单明细");
				$("#enterWareDetail .close").removeClass("cgdDetail");
				$(".modal-body iframe").siblings().show();
				console.log(e);
				e.preventDefault();
			}else{
				$("#enterWareDetail").modal('hide');
			}
		});
	});
	function goCgdDetail(cgdDetailIndex){
		$("#enterWareDetail .modal-title").text("采购单明细");
		$("#enterWareDetail .close").addClass("cgdDetail");
		$(".modal-body iframe").siblings().hide();
		$(".modal-body iframe").show();
	}
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家来货单号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">进仓单号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
		<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家编号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">备注</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">开单员</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
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
						<span>进仓单查询</span>
					</div>
					<div class="floatRight">
						<input type="button" value="导出excel"/> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>序号</td><td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td>
						<td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>查看明细</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>序号</td><td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td>
						<td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td><input type="button" value="查看明细" data-toggle="modal" data-target="#enterWareDetail" /></td>
					</tr>
					<tr>
						<td>序号</td><td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td>
						<td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>查看明细</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade modal1" id="enterWareDetail" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						进仓单明细
					</h5>
				</div>
				<div class="modal-body">
					<iframe frameborder="0" src="./cgdDetail.jsp" style="width: 100%; height: 330px; border: 0px none; display:none;"></iframe>
					<div style="width: 100%; height: 330px; border: 0px none;">
						<div class="detail">
							<table class="enterWareDetailTable" style="">
									<tr>
										<td class="cls-data-th-detail">开单日期：</td><td>2017-07-26</td>
										<td class="cls-data-th-detail">开单员：</td><td>管理员</td>
										<td class="cls-data-th-detail">进仓单号：</td><td>JC20170726005</td>
									</tr>
									<tr>
										<td class="cls-data-th-detail">厂家编号：</td><td>A00</td>
										<td class="cls-data-th-detail">成本合计：</td><td>1,000</td>
										<td class="cls-data-th-detail">数量：</td><td>2</td>
									</tr>
									<tr>
										<td class="cls-data-th-detail">来货单号：</td><td>736</td>
										<!-- <td class="cls-data-th-detail"></td><td></td>
										<td class="cls-data-th-detail"></td><td></td>
										<td class="cls-data-th-detail"></td><td></td> -->
									</tr>
							</table>
							<form method="post" onsubmit="return false" class="searchForm">
								<div class="row">
									<div class="col-lg-3 col-md-3 col-sm-3">
										<label class="control-label col-lg-5 col-md-5 col-sm-5">商品编码:</label>
										<div class="col-lg-7 col-md-7 col-sm-7">
											<input type="text" class="form-control">
										</div>
									</div>
									<div class="col-lg-3 col-md-3 col-sm-3">
										<input type="button" value="查询" />
									</div>
								</div>
							</form>
							<table class="dataTable">
								<thead>
									<tr>
										<td>采购单号</td>
										<td>采购日期</td>
										<td>商品索引号</td>
										<td>商品编码</td>
										<td>商品名称</td>
										<td>颜色</td>
										<td>尺寸</td>
										<td style="width:120px;">材质</td>
										<td>单位</td>
										<td>数量</td>
										<td>进价</td>
										<td>小计</td>
										<td>备注</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><a onclick="goCgdDetail('C123456');">C123456</a></td>
										<td>采购日期</td>
										<td>商品索引号</td>
										<td>商品编码</td>
										<td>商品名称</td>
										<td>颜色</td>
										<td>尺寸</td>
										<td style="width:120px;">材质</td>
										<td>单位</td>
										<td>数量</td>
										<td>进价</td>
										<td>小计</td>
										<td>备注</td>
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