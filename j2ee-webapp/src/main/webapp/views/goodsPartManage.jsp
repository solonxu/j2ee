<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配件管理</title>
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
	width:100px;
}
.editForm .cls-data-td-editdetail{
	border:none;
}
.editForm table{
	margin:0px auto;
}
.modal{
	width:650px;/*需要自己定义，默认如果不定义的话，是100%*/
	margin:0px auto;
}
img{
	cursor: pointer;
}
.modal textarea{
	vertical-align: bottom;
	width:100%;
    margin-top: 2px;
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
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家编号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">索引号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">配件编号</label>
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
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">颜色</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control">
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">配件名称</label>
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
			<div class="col-lg-2 col-md-2 col-sm-2" style="text-align:center;">
				<button>查询</button>
			</div>
		</div>
	</form>
	<div id="">
		<div class="detail">
			<form method="post" onsubmit="return false" class="">
				<div style="height:24px;">
					<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
						<span>配件资料</span>
					</div>
					<div class="floatRight">
						<input type="button" value="添 加" data-toggle="modal" data-target="#addGoodsPart" /> 
						<input type="button" value="删 除"/>
						<input type="button" value="导 出" /> 
					</div>
				</div>
			</form>
			<table class="dataTable order-column">
				<thead>
					<tr>
						<td><input type="checkbox" /></td>
						<td>序号</td>
						<td>编辑</td>
						<td>配件索引号</td>
						<td>配件编号</td>
						<td>配件名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>配件材质</td>
						<td>售价</td>
						<td>进价</td>
						<td>毛利</td>
						<td>单位</td>
						<td>订货详情</td>
						<td>重量</td>
						<td>体积</td>
						<td>货期</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" /></td>
						<td>序号</td>
						<td><img src="/static/images/rowedit.gif" data-toggle="modal" data-target="#addGoodsPart" /></td>
						<td>配件索引号</td>
						<td>配件编号</td>
						<td>配件名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>配件材质</td>
						<td>售价</td>
						<td>进价</td>
						<td>毛利</td>
						<td>单位</td>
						<td>订货详情</td>
						<td>重量</td>
						<td>体积</td>
						<td>货期</td>
					</tr>
					<tr>
						<td><input type="checkbox" /></td>
						<td>序号</td>
						<td><img src="/static/images/rowedit.gif" data-toggle="modal" data-target="#addGoodsPart" /></td>
						<td>配件索引号</td>
						<td>配件编号</td>
						<td>配件名称</td>
						<td>颜色</td>
						<td>尺寸</td>
						<td>配件材质</td>
						<td>售价</td>
						<td>进价</td>
						<td>毛利</td>
						<td>单位</td>
						<td>订货详情</td>
						<td>重量</td>
						<td>体积</td>
						<td>货期</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="modal fade" id="addGoodsPart" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h5 class="modal-title" id="myModalLabel">
						新增配件资料
					</h5>
				</div>
				<div class="modal-body">
					<div style="width: 100%; height: 330px; border: 0px none;">
						<form method="post" onsubmit="return false" class="editForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span>配件资料信息</span>
								</div>
								<div class="floatRight">
									<input type="button" value="保 存" onclick="saveAddGoodsPart();"/> 
									<input type="button" value="重 置" />
								</div>
							</div>
							<table class='cls-data-table-detail'
								style="table-layout: fixed; border: none;" width="100%">
								<tr>
									<td class='cls-data-th-detail' >厂家编号：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='3'>
										<font>
											<select style="width: 25%">
												<option value='male'>广州市</option>
												<option value='female'>佛山</option>
											</select>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >配件编号<font color="red">*</font>：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" style="padding-right:10px;">
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
									<td class='cls-data-th-detail' >配件名称<font color="red">*</font>：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" >
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >售价：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" style="padding-right:10px;">
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
									<td class='cls-data-th-detail' >进价：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" >
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >单位：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" style="padding-right:10px;">
										<font>
											<select style="width: 100%">
												<option value='male'>白云</option>
												<option value='female'>从化</option>
											</select>
										</font>
									</td>
									<td class='cls-data-th-detail' >重量：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" >
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >体积：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" style="padding-right:10px;">
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
									<td class='cls-data-th-detail' >货期<font color="red">*</font>：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" >
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >颜色：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" style="padding-right:10px;">
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
									<td class='cls-data-th-detail' >尺寸：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" >
										<font>
											<input type="text" value="" style=""/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >商品材质：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan="3">
										<textarea rows="3" cols="10"></textarea>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' >订货详情：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan="3">
										<textarea rows="3" cols="10"></textarea>
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