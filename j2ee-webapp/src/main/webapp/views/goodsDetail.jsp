<%@ page contentType="text/html;charset=UTF-8" %>

<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctxStatic}/css/jquery-ui.min.css">
<link rel="stylesheet" href="${ctxStatic}/css/style.css">
<link rel="stylesheet" href="${ctxStatic}/css/jquery.dataTables.min.css">
<link href="${ctxStatic}/css/bootstrap.min.css" rel="stylesheet">
<script src="${ctxStatic}/js/jquery.js"></script>
<script src="${ctxStatic}/js/jquery-ui.min.js"></script>
<script src="${ctxStatic}/js/jquery.dataTables.min.js"></script>
<script src="${ctxStatic}/js/bootstrap.js"></script>
<style type="text/css">
body{
	font-size:13px;
}

.goodsDetailForm {
	margin: 10px;
}

td input{
	height:20px;
	margin:2px 0px;
}
select{
	padding:0px 0px 3px 0px;
}
tr{
	margin:2px 0px;
}
.cls-data-th-detail {
	border:none;
}
.cls-data-td-editdetail{
	border:none;
}

</style>
</head>
<body>
	<div id="">
		<div id="">
			<form method="post" onsubmit="return false" class="goodsDetailForm">
				<div class="floatLeft" style="font-weight:bold;">
					<span>商品资料</span>
				</div>
				<div class="floatRight">
					<input type="button" value="添 加" /> <input type="button"
						value="保 存" /> <input type="button" value="重 置" />
				</div>
				<table class='cls-data-table-detail'
					style="table-layout: fixed; border: none;" width="100%">
					<tr>
						<td class='cls-data-th-detail' width="95px" >厂家编号：</td>
						<td class="cls-data-td-editdetail" colspan='1' width='120px'>
							<font>
								<select>
									<option value='A00'>A00</option>
									<option value='A08' selected>A08</option>
									<option value='Z99'>Z99</option>
								</select>
							</font>
						</td>
						<td class='cls-data-th-detail' width="95px" >商品编号<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='2'><font><input
								type='text' value="A08CFC03500003" style="width: 99%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >商品名称<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='2'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_goodsname'
								name='goodsEdit_guid_report_wxcol_goodsname' value="茶几"
								style="width: 90%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >商品类别：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select
								name='goodsEdit_guid_report_wxcol_lb'
								id='goodsEdit_guid_report_wxcol_lb' style="width: 95%"><option
										value='A'>餐台、玄关</option>
									<option value='B'>床、床尾凳、床头柜</option>
									<option value='C' selected>茶几</option>
									<option value='D'>餐椅、吧椅</option>
									<option value='E'>挂衣架</option>
									<option value='M'>钱</option></select></font></td>
						<td class='cls-data-th-detail' width="95px" >单位：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select><option
										value='1' selected>张</option>
									<option value='2'>个</option>
									<option value='3'>件</option>
									<option value='10'>箱</option></select></font></td>
						<td class='cls-data-th-detail' width="95px" >货期（销售）<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_getdate'
								name='goodsEdit_guid_report_wxcol_getdate' value="55"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >货期（业务）<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_mygetdate'
								name='goodsEdit_guid_report_wxcol_mygetdate' value="50"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >重量：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_zl'
								name='goodsEdit_guid_report_wxcol_zl' value="0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >体积：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_tj'
								name='goodsEdit_guid_report_wxcol_tj' value="0.0000"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >颜色<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_spys'
								name='goodsEdit_guid_report_wxcol_spys' value="黑胡桃"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >尺寸<font
							color=red>*</font>：
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_spcc'
								name='goodsEdit_guid_report_wxcol_spcc' value="1372x772x390"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >商品材质：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='7'><font><textarea
									typename='textareabox'
									name='goodsEdit_guid_report_wxcol_standard'
									id='goodsEdit_guid_report_wxcol_standard' style="width: 60%;"
									rows="4">~1、法国流金大理石面板；2、木材为黑胡桃实木表面开放清漆处理；3不锈钢底架,表面抛亮光</textarea></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >进价：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_costprice'
								name='goodsEdit_guid_report_wxcol_costprice' value="2950.0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >倍数：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_beishu'
								name='goodsEdit_guid_report_wxcol_beishu' value=""
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >售价：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_price'
								name='goodsEdit_guid_report_wxcol_price' value="7640.0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >乐从售价：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_newprice'
								name='goodsEdit_guid_report_wxcol_newprice' value="0.0"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >毛利：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_profit'
								name='goodsEdit_guid_report_wxcol_profit' value="0.61"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >件数：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_js'
								name='goodsEdit_guid_report_wxcol_js' value="3"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >是否隐藏：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><span
								id="">
								<input type="radio" name="goodsEdit_guid_report_wxcol_outid"
									id="" label="是" value="1" checked />是
								<input type="radio" name="goodsEdit_guid_report_wxcol_outid"
									id="" label="否" value="0" />否
							</span></font></td>
						<td class='cls-data-th-detail' width="95px" >商品类型：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select>
									<option value='0' selected>商品类</option>
									<option value='1'>服务类</option>
							</select></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >订货详情：</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='7'><textarea
									style="width: 60%;" rows="4"></textarea></td>
					</tr>
				</table>

				<font color="red">说明：</font> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="blue">1、商品编号：保存后会自动将厂家编号和商品类别代码加到商品编号中；</font> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="blue">2、商品类型：比如商场卖的物品则选商品类，“搬运费用”等类似的收费服务则选服务类，；</font>
			</form>
		</div>
	</div>
</body>
</html>