<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP</title>
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/jstree.css">

<script type="text/javascript" src="${ctxStatic}/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jstree.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jstree.checkbox.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/bootstrap.js"></script>
<style type="text/css">
.cls-title {
	font-weight: bold;
}
#vendorTb td {
	font-size: 13px;
}

#vendorTb{
	width: 100%!important;
}
.cls-data-tr-head-list {
	height: 20px;
}
.editVendorForm{
	font-size:13px;
}
.editVendorForm td input{
	height:20px;
	margin:2px 0px;
	width:100%;
}
.editVendorForm td{
	margin:2px;
}
.editVendorForm select{
	margin:2px 0px;
}
.editVendorForm tr{
	margin:2px 0px;
}
.editVendorForm .cls-data-th-detail{
	border:none;
}
.editVendorForm .cls-data-td-editdetail{
	border:none;
}
.editVendorForm table{
	margin:0px auto;
}
.modal{
	width:500px;
	margin:0px auto;
}
.forEditVendor{
	display:none;
}
img{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	var table = null;
	var tree = null;
	
	var str ='{"data":[{"address":"","brand":"大众","contact":"","fax":"","habit":"广州","id":"1","mail":"","memo":"","name":"简美","postCode":"","shortName":"精品","tel":"","vendorId":"A00"}]}';
      eval("var result = " + str);
	
    function editVendor(vendorId) {
    	alert("should popup window to edit id:" + vendorId);
    	$(".forEditVendor").show();
    	$("#editVendor").modal('show');
    }

	$(function() {
		table = $("#vendorTb").DataTable({
			data:result.data,
			"columns": [
			            {"data" : "id"},
			            {"data" : "vendorId"},
			            {"data" : "shortName"},
			            {"data" : "habit"},
			            {"data" : "brand"},
			            {"data" : null,
			             render : function (data,type,row) {
			            	 //return "<a href=\"#editVendor\" onclick='editVendor(\"" + row.vendorId+"\");'>Edit</a>";
			            	 return "<img src=\"${ctxStatic}/images/rowedit.gif\" onclick='editVendor(\"" + row.vendorId+"\");'></img>";
			             }	      
			            }
			           ],
			"language" : {
				"lengthMenu" : "每页显示 _MENU_ 条记录",
				"zeroRecords" : "没有数据显示",
				"info" : "当前第_PAGE_页/_PAGES_页 共_TOTAL_条记录",
				"infoEmpty" : "无数据可用",
				"paginate" : {
					"previous" : "上页",
					"next" : "下页"
				},
				
			},
		    searching:true,
		    order : [[1,"asc"]],
		     "dom" :"<<t>ip>"
		});
		$("#editVendor").on("hidden.bs.modal" , function(){
			$(".forEditVendor").hide();
		});
	});
	
	alert("intialized finished");

</script>
</head>
<body>
	
	<form action="" method="post" class="searchForm" role="form" style="margin-bottom: 1em;">
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">商品名称</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1" style="text-align: right;">
				<button>查询</button>
			</div>
		</div>
	</form>
	<font color="red">说明：</font><br/>
	<font color="blue">
		1、生日输入格式，比如9月8日，请输入0908；<br/>
		2、关于发信息，选中要发送人（确保有手机号），然后点击发送信息，在打开的窗口编辑发送内容，最后点击发送
	</font>
	<div style="height: 15px;"></div>
	<div>
		<form method="post" onsubmit="return false" style="margin: 0px">
			<span class="cls-title">厂家资料</span>
			<div style="float: right;">
				<input type="button" value="添加" id="" name="" onclick="" /><span style="margin-left: 9px;"></span>
				<input type="button" value="删 除" class="cls-button" /><span style="margin-left: 9px;"></span>
				<input type="button" value="导出Excel" class="cls-button2" />
			</div>
		</form>
	</div>
	<div class="data">
		<table class="order-column" id="vendorTb">
			<thead>
				<tr>
					<td>序号</td>
					<td>厂家编号</td>
					<td>厂家简称</td>
					<td>产地</td>
					<td>品牌</td>
					<td>编辑</td>
				</tr>
			</thead>
		</table>
	</div>
	<div class="modal fade" id="editVendor" tabindex="-1" role="dialog" data-backdrop="false" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						编辑厂家资料
					</h5>
				</div>
				<div class="modal-body">
					<div style="height: 230px; border: 0px none;">
						<form method="post" onsubmit="return false" class="editVendorForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span>厂家资料</span>
								</div>
								<div class="floatRight">
									<input type="button" value="保 存" onclick="saveVendor();"/> 
									<input type="button" value="重 置" />
								</div>
							</div>
							<table class='cls-data-table-detail'
								style="table-layout: fixed; border: none;" width="100%">
								<tr>
									<td class='cls-data-th-detail' width="120px"><font color="red">*</font>厂家编号：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">联系人：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">简称：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">电话：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">厂家全称：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">传真：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">产地：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="B19" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">品牌：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<select style="width: 95%">
												<option value='male'>路1</option>
												<option value='female'>路2</option>
											</select>
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
	<div class="modal-backdrop fade forEditVendor in"></div>
</body>
</html>