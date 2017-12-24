<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cls-data-td-editlist{
	text-align:center;
}
.editVendorForm{
	margin: 10px;
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
</style>
</head>
<body>
<button data-toggle="modal" data-target="#editVendor">编辑</button>
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
					<div style="width: 100%; height: 130px; border: 0px none;">
						<form method="post" onsubmit="return false" class="addFloorForm">
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
</body>
</html>