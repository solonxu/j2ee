<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	width:500px;/*需要自己定义，默认如果不定义的话，是100%*/
	margin:0px auto;
}
.modal2{
	margin:0px auto;
}
.modal3{
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">送货开始日期:</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">送货截止日期: </label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="date" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家来货单号:</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">进仓单号:</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<button>查询</button>
			</div>
		</div>
	</form>
	<div style="margin-top:1em;">
		<font color="red">说明：</font><font color="blue">在审核明细中，审核通过后才更新库存量。</font>
	</div>
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>进仓单管理</span>
					</div>
					<div class="floatRight">
						<input type="button" value="添 加" data-toggle="modal" data-target="#addEnterWare" /> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>审核操作</td><td>操作</td><td>编辑</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td><input type="button" value="审核明细" data-toggle="modal" data-target="#auditDetail" /></td><td><input type="button" value="按采购新增进仓单" data-toggle="modal" data-target="#addEnterWareByBuy" /></td><td>编辑</td>
					</tr>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>审核操作</td><td><input type="button" value="明细" data-toggle="modal" data-target="#enterWareDetail" /></td><td>编辑</td>
					</tr>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td><input type="button" value="审核明细" data-toggle="modal" data-target="#auditDetail" /></td><td><input type="button" value="按销售退货新增进仓单" data-toggle="modal" data-target="#addEnterWareByReturns" /></td><td>编辑</td>
					</tr>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>审核操作</td><td>操作</td><td><input type="button" value="编 辑" data-toggle="modal" data-target="#addEnterWare" /></td>
					</tr>
					<tr>
						<td>开单日期</td><td>进仓单号</td><td>厂家编号</td><td>厂家来货单号</td><td>经手人</td><td>备注</td><td>凭证号</td><td>成本合计</td><td>审核操作</td><td>操作</td><td><input type="button" value="编 辑" data-toggle="modal" data-target="#addEnterWare" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade modal1" id="addEnterWare" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						进仓单
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 330px; border: 0px none;">
						<form method="post" onsubmit="return false" class="editForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span></span>
								</div>
								<div class="floatRight">
									<input type="button" value="保 存" onclick="saveAddEnterWare();"/> 
									<input type="button" value="重 置" />
								</div>
							</div>
							<table class='cls-data-table-detail' style="table-layout: fixed; border: none;" width="100%">
								<tr>
									<td class='cls-data-th-detail' width="200px">厂家来货单号/销售单电脑码<font color="red">*</font>：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="text" value="" style="width:95%"/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="200px">厂家编号：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<select style="width: 95%">
												<option value='a00'>A00</option>
												<option value='a01'>A01</option>
											</select>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="200px">进仓单标识：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<select style="width: 95%">
												<option value='a00'>A00</option>
												<option value='a01'>A01</option>
											</select>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="200px">备注：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<textarea rows="3" style="width:100%;"></textarea>
										</font>
									</td>
								</tr>
							</table>
							<font color="red">说明：</font><font color="blue">1、带<font color="red">*</font>星号的字段为必填项。2、如果进仓单标识是“按销售退货新增进仓单”，则厂家来货单号输入销售单电脑码</font>
						</form>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade modal2" id="addEnterWareByBuy" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						按采购新增进仓单
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 530px; border: 0px none;">
						<form action="" method="post" class="searchForm" role="form">
							<div class="row">
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
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">商品颜色</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
							</div>
							<div class="row">
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
									<label class="control-label col-lg-5 col-md-5 col-sm-5">采购单号</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家编号</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-1 col-md-1 col-sm-1">
									<button>查询</button>
								</div>
							</div>
						</form>
						<div class="description">
							<font color="red">说明：</font><font color="blue">1、批量生成条码及进仓，实现生成条码及进仓；2、保存，更新该商品的件数（实际到货件数跟该件数不一样则修改）</font>
						</div>
						<div id="">
							<div class="detail">
								<form method="post" onsubmit="return false" class="">
									<div style="height:24px;">
										<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
											<span>无条码商品</span>
										</div>
										<div class="floatRight">
											<input type="button" value="批量生成条码及进仓" data-toggle="modal" data-target="#addEnterWare" /> 
											<input type="button" value="保 存" data-toggle="modal" data-target="#addEnterWare" /> 
										</div>
									</div>
								</form>
								<table class="dataTable order-column">
									<thead>
										<tr>
											<td><input type="checkbox" /></td><td>厂家编号</td><td>采购单号</td><td>商品索引号</td><td>商品编号</td>
											<td>商品名称</td><td>商品颜色</td><td>商品尺寸</td><td>商品材质</td><td>未到量</td><td>现收量</td><td><font color="red">*</font>件数</td><td>到货日期</td><td>备注</td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input type="checkbox" /></td><td>厂家编号</td><td>采购单号</td><td>商品索引号</td><td>商品编号</td>
											<td>商品名称</td><td>商品颜色</td><td>商品尺寸</td><td>商品材质</td><td>未到量</td><td><input type="text"  style="width:30px;"/></td><td><input type="text"  style="width:30px;"/></td><td>到货日期</td><td>备注</td>
										</tr>
										<tr>
											<td><input type="checkbox" /></td><td>厂家编号</td><td>采购单号</td><td>商品索引号</td><td>商品编号</td>
											<td>商品名称</td><td>商品颜色</td><td>商品尺寸</td><td>商品材质</td><td>未到量</td><td><input type="text"  style="width:30px;"/></td><td><input type="text"  style="width:30px;"/></td><td>到货日期</td><td>备注</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade modal3" id="auditDetail" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
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
	<div class="modal fade modal4" id="enterWareDetail" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
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
										<td class="cls-data-th-detail">来货单号：</td><td>736</td>
									</tr>
							</table>
							<table class="dataTable">
								<thead>
									<tr>
										<td>商品索引号</td><td>商品编码</td><td>商品名称</td><td>颜色</td><td>尺寸</td>
										<td style="width:120px;">材质</td><td>单位</td><td>数量</td><td>进价</td><td>备注</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>商品索引号</td><td>商品编码</td><td>商品名称</td><td>颜色</td><td>尺寸</td>
										<td>材质</td><td>单位</td><td>数量</td><td>进价</td><td>备注</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>
	<div class="modal fade modal5" id="addEnterWareByReturns" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						按销售退货新增进仓单
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 430px; border: 0px none;">
						<div class="description">
							<font color="red">说明：</font><font color="blue">1、根据商品现收量和件数生成条码；2、可以选中多个商品，然后单击“生成条码及进仓”，完成生成条码和进仓的操作；3、现收量不能大于已出量并且不能小于0。</font>
						</div>
						<form method="post" onsubmit="return false" class="searchForm">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-sm-3">
									<label class="control-label col-lg-5 col-md-5 col-sm-5">销售单电脑码:</label>
									<div class="col-lg-7 col-md-7 col-sm-7">
										<input type="text" class="form-control">
									</div>
								</div>
								<div class="col-lg-3 col-md-3 col-sm-3">
									<input type="button" value="查询" />
									<input type="button" value="生成条码及进仓" />
								</div>
							</div>
						</form>
						<div class="detail">
							<table class="dataTable order-column">
								<thead>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>销售单号</td><td>索引号</td><td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品规格</td><td>单位</td><td>数量</td><td>已出量</td><td>现收量</td><td>件数</td><td>样板标示</td><td>备注</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox"  /></td>
										<td>销售单号</td><td>索引号</td><td>商品编号</td><td>商品名称</td><td>商品颜色</td><td>商品尺寸</td>
										<td>商品规格</td><td>单位</td><td>数量</td><td>已出量</td><td>现收量</td><td>件数</td><td>样板标示</td><td>备注</td>
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