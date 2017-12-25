<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctxStatic}/css/jquery-ui.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/style.css">
<script src="${ctxStatic}/js/jquery.js"></script>
<script src="${ctxStatic}/js/jquery-ui.min.js"></script>
<script src="${ctxStatic}/js/jquery.dataTables.min.js"></script>
<script src="${ctxStatic}/js/bootstrap.js"></script>
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
.modal{
	width:500px;/*需要自己定义，默认如果不定义的话，是100%*/
	margin:0px auto;
}
img{
	cursor: pointer;
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
		    "dom" :"<<t>ip>"
		});
	});
	
</script>
</head>
<body>
<div>
	<form action="" method="post" class="searchForm" role="form">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">区域名称</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-1 col-md-1 col-sm-1">
				<button>查询</button>
			</div>
		</div>
	</form>
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>区域信息</span>
					</div>
					<div class="floatRight">
						<input type="button" value="添 加" data-toggle="modal" data-target="#addArea" /> 
						<input type="button" value="删 除" />
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td>序号</td><td>城市名称</td><td>区域名称</td><td>编辑</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td><td>广州市</td><td>白云区</td><td><img src="./images/rowedit.gif" data-toggle="modal" data-target="#addArea" /></td>
					</tr>
					<tr>
						<td>1</td><td>广州市</td><td>白云区</td><td><img src="./images/rowedit.gif" data-toggle="modal" data-target="#addArea" /></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="addArea" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						新增区域信息
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 130px; border: 0px none;">
						<form method="post" onsubmit="return false" class="editForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span>详细信息</span>
								</div>
								<div class="floatRight">
									<input type="button" value="保 存" onclick="saveAddArea();"/> 
									<input type="button" value="重 置" />
								</div>
							</div>
							<table class='cls-data-table-detail'
								style="table-layout: fixed; border: none;" width="100%">
								<tr>
									<td class='cls-data-th-detail' width="120px">城市：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<select style="width: 95%">
												<option value='male'>广州市</option>
												<option value='female'>佛山</option>
											</select>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">区域名称：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" value="" style="width:95%"/>
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