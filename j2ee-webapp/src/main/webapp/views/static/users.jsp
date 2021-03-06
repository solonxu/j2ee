<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERP</title>
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/jstree.css">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css">

<script type="text/javascript" src="${ctxStatic}/js/jquery-1.12.4.js"></script>
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
	$(function() {
		table = $("#staffContactData").DataTable({
			"language" : {
				"lengthMenu" : "每页显示 _MENU_ 条记录",
				"zeroRecords" : "没有数据显示",
				"info" : "当前第_PAGE_页/_PAGES_页 共_TOTAL_条记录",
				"infoEmpty" : "无数据可用",
				"paginate" : {
					"previous" : "上页",
					"next" : "下页"
				}
			},
		    "dom" :"<<t>ip>"
		});
		$("#tree").jstree({
			"checkbox" : {
				"keep_selected_style" : false
			},
			"plugins" : [ "checkbox", "wholerow" ]
		});
		tree = $("#tree").jstree(true);
		tree.open_node('#all');
		//console.log(tree);
		//console.log(table);
		$(document).on("click", function(e){
			//console.log(e);
			var target = e.target;
			if($(target).parents(".tree").length == 0 && !$(target).hasClass("displayTree")){
				$(".tree").hide();
			}
		})
	});

	function createTable() {
		var p = [];
		$("#staffContactData").find("thead tr td:visible").each(function(i) {
			p.push($(this).attr("name"));
		});
		var count = 0;
		console.log(tree);
		$("#tree li[role=treeitem]").each(function(i) {
			if (p.indexOf($(this).attr("name")) != -1) {
				var node = tree.get_node($("li[name="+$(this).attr("name")+"]"));
				tree.check_node(node);
			}
		});
	}

	function createTree(target) {
		createTable();
		var _this = $(target);
		var treeDiv = $(".tree");
		treeDiv.css("top", $(".detail").position().top+_this.position().top +15);
		treeDiv.show();
	}

	function changeColumn() {
		if(tree.get_checked(true).length == 0){
			alert("请至少选择一列数据显示");
			return;
		}
		var button = $("#staffContactData thead tr td:last").children("input[type=button].displayTree");
		$("#tree ul li ul li[role=treeitem]").each(function(i) {
			var column = table.column($(this).attr("data-column"));
			if (!$(this).children("a").hasClass("jstree-clicked")) {
				//没有被选中（需要隐藏的）
				
				column.visible(false);
			}else{
				column.visible(true);
			}
		});
		$("#staffContactData").css("width","100%");
		if(button){
			button.remove();
			$("#staffContactData thead tr td:last").append(button);
		}
		var treeDiv = $(".tree");
		treeDiv.hide();
	}
</script>
</head>
<body>
	<div class="tree" style="display: none;">
		<div id="tree">
			<ul>
				<li id="all" name="all">全部
					<ul class="childs">
						<li name="no" data-column="0">序号</li>
						<li name="account" data-column="1">帐号</li>
						<li name="name" data-column="2">姓名</li>
						<li name="sex" data-column="3">性别</li>
						<li name="position" data-column="4">职位</li>
						<li name="dept" data-column="5">部门</li>
						<li name="status" data-column="6">状态</li>
						<li name="phone" data-column="7">联系电话</li>
						<li name="email" data-column="8">电子邮件</li>
						<li name="hireDate" data-column="9">入职日期</li>
						<li name="remark" data-column="10">备注</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class="bottomTree">
			<button onclick="changeColumn();">确定</button>
		</div>
	</div>
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
	<div class="detail">
		<div>
			<h3>
				<font color="red">说明</font>： 1、生日输入格式，比如9月8日，请输入0908；
				2、关于发信息，选中要发送人（确保有手机号），然后点击发送信息，在打开的窗口编辑发送内容，最后点击发送
			</h3>
		</div>

		<table class="order-column" id="staffContactData">
			<thead>
				<tr>
					<td name="no" width="8%">序号</td>
					<td name="account" width="8%">帐号</td>
					<td name="name" width="10%">姓名</td>
					<td name="sex" width="8%">性别</td>
					<td name="position" width="8%">职位</td>
					<td name="dept" width="10%">部门 <input
						type="button"
						style="width: 16px; height: 17px; background-color: transparent; border: 0px; vertical-align: middle; background-image: url(${ctxStatic}/images/filter1.jpg); cursor: pointer;" />
					</td>
					<td name="status" width="8%">状态</td>
					<td name="phone" width="9%">联系电话</td>
					<td name="email" width="10%">电子邮件</td>
					<td name="hireDate" width="10%">入职日期</td>
					<td name="remark" width="8%">备注<input class="displayTree"
						type="button" onclick="createTree(this);"
						style="width: 19px; height: 13px; background-color: transparent; border: 0px; vertical-align: top; background-image: url(${ctxStatic}/images/selectcols.gif); cursor: pointer;" />
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2</td>
					<td>0922</td>
					<td>设计师</td>
					<td>男</td>
					<td>物业经理</td>
					<td>乐从北欧</td>
					<td>有效</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>3</td>
					<td>123</td>
					<td>123</td>
					<td>男</td>
					<td>物业经理</td>
					<td>乐从北欧</td>
					<td>有效</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>