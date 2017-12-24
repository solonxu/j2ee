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

.cls-title {
	font-weight: bold;
}

label {
	font-weight: normal;
	font-size: 13px;
}

h3 {
	font-size: 13px;
}

#staff_contact_report1_nodata_tr {
	text-align: center;
}

#staffContactData td {
	font-size: 13px;
}

#staff_contact_report1_nodata_tr {
	display: none;
}

.cls-data-tr-head-list {
	height: 20px;
}

.tree {
	width: 200px;
	height: 230px;
	font-size: 11px;
	border: 1px solid #C0C0C0;
	position: absolute;
	z-index: 23;
	/* float:left; */
	background-color: white;
	right: 0px;
}

#tree {
	height: 200px;
	overflow: auto;
}

.bottomTree {
	text-align: center;
}

.bottomTree button {
	margin-top: 3px;;
}
.displayTree{
	margin-left:5px;
}
</style>
<script type="text/javascript">
	var table = null;
	var tree = null;
	
	var str ='{"data":[{"address":"","brand":"大众","contact":"","fax":"","habit":"广州","id":"1","mail":"","memo":"","name":"简美","postCode":"","shortName":"精品","tel":"","vendorId":"A00"}]}';
      eval("var result = " + str);
	
    function editVendor(vendorId) {
    	alert("should popup window to edit id:" + vendorId);
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
			            	 return "<a><href=\"#\" onclick='editVendor(\"" + row.vendorId+"\");'>Edit</a>";
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
	});
	
	alert("intialized finished");

</script>
</head>
<body>
	
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
	<div>
		<h3>
			<font color="red">说明</font>： 1、生日输入格式，比如9月8日，请输入0908；
			2、关于发信息，选中要发送人（确保有手机号），然后点击发送信息，在打开的窗口编辑发送内容，最后点击发送
		</h3>
	</div>
	<div>
	  <span>厂家资料</span>
	  <button>添加</button> <button>删除</button><button>导出excel</button>
	</div>
	<div class="data">
		<table class="order-column" id="vendorTb">
			<thead>
				<tr>
					<th>序号</th>
					<th>厂家编号</th>
					<th>厂家简称</th>
					<th>产地</th>
					<th>品牌</th>
					<th>编辑</th>
				</tr>
			</thead>
		</table>
	</div>
</body>
</html>