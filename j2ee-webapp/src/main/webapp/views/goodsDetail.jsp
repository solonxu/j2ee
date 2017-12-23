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
					<span>ååèµæ</span>
				</div>
				<div class="floatRight">
					<input type="button" value="æ·» å " /> <input type="button"
						value="ä¿ å­" /> <input type="button" value="é ç½®" />
				</div>
				<table class='cls-data-table-detail'
					style="table-layout: fixed; border: none;" width="100%">
					<tr>
						<td class='cls-data-th-detail' width="95px" >åå®¶ç¼å·ï¼</td>
						<td class="cls-data-td-editdetail" colspan='1' width='120px'>
							<font>
								<select>
									<option value='A00'>A00</option>
									<option value='A08' selected>A08</option>
									<option value='Z99'>Z99</option>
								</select>
							</font>
						</td>
						<td class='cls-data-th-detail' width="95px" >ååç¼å·<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='2'><font><input
								type='text' value="A08CFC03500003" style="width: 99%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >åååç§°<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='2'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_goodsname'
								name='goodsEdit_guid_report_wxcol_goodsname' value="è¶å "
								style="width: 90%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >ååç±»å«ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select
								name='goodsEdit_guid_report_wxcol_lb'
								id='goodsEdit_guid_report_wxcol_lb' style="width: 95%"><option
										value='A'>é¤å°ãçå³</option>
									<option value='B'>åºãåºå°¾å³ãåºå¤´æ</option>
									<option value='C' selected>è¶å </option>
									<option value='D'>é¤æ¤ãå§æ¤</option>
									<option value='E'>æè¡£æ¶</option>
									<option value='M'>é±</option></select></font></td>
						<td class='cls-data-th-detail' width="95px" >åä½ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select><option
										value='1' selected>å¼ </option>
									<option value='2'>ä¸ª</option>
									<option value='3'>ä»¶</option>
									<option value='10'>ç®±</option></select></font></td>
						<td class='cls-data-th-detail' width="95px" >è´§æï¼éå®ï¼<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_getdate'
								name='goodsEdit_guid_report_wxcol_getdate' value="55"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >è´§æï¼ä¸å¡ï¼<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_mygetdate'
								name='goodsEdit_guid_report_wxcol_mygetdate' value="50"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >ééï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_zl'
								name='goodsEdit_guid_report_wxcol_zl' value="0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >ä½ç§¯ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_tj'
								name='goodsEdit_guid_report_wxcol_tj' value="0.0000"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >é¢è²<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_spys'
								name='goodsEdit_guid_report_wxcol_spys' value="é»è¡æ¡"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >å°ºå¯¸<font
							color=red>*</font>ï¼
						</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_spcc'
								name='goodsEdit_guid_report_wxcol_spcc' value="1372x772x390"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >ååæè´¨ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='7'><font><textarea
									typename='textareabox'
									name='goodsEdit_guid_report_wxcol_standard'
									id='goodsEdit_guid_report_wxcol_standard' style="width: 60%;"
									rows="4">~1ãæ³å½æµéå¤§çç³é¢æ¿ï¼2ãæ¨æä¸ºé»è¡æ¡å®æ¨è¡¨é¢å¼æ¾æ¸æ¼å¤çï¼3ä¸éé¢åºæ¶,è¡¨é¢æäº®å</textarea></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >è¿ä»·ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_costprice'
								name='goodsEdit_guid_report_wxcol_costprice' value="2950.0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >åæ°ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_beishu'
								name='goodsEdit_guid_report_wxcol_beishu' value=""
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >å®ä»·ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_price'
								name='goodsEdit_guid_report_wxcol_price' value="7640.0"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >ä¹ä»å®ä»·ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_newprice'
								name='goodsEdit_guid_report_wxcol_newprice' value="0.0"
								style="width: 60%" /></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >æ¯å©ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_profit'
								name='goodsEdit_guid_report_wxcol_profit' value="0.61"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >ä»¶æ°ï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><input
								type='text' id='goodsEdit_guid_report_wxcol_js'
								name='goodsEdit_guid_report_wxcol_js' value="3"
								style="width: 60%" /></font></td>
						<td class='cls-data-th-detail' width="95px" >æ¯å¦éèï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><span
								id="">
								<input type="radio" name="goodsEdit_guid_report_wxcol_outid"
									id="" label="æ¯" value="1" checked />æ¯
								<input type="radio" name="goodsEdit_guid_report_wxcol_outid"
									id="" label="å¦" value="0" />å¦
							</span></font></td>
						<td class='cls-data-th-detail' width="95px" >ååç±»åï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='1' width='120px'><font><select>
									<option value='0' selected>ååç±»</option>
									<option value='1'>æå¡ç±»</option>
							</select></font></td>
					</tr>
					<tr>
						<td class='cls-data-th-detail' width="95px" >è®¢è´§è¯¦æï¼</td>
						<td class="cls-data-td-editdetail" bgcolor="#ffffff"
							 colspan='7'><textarea
									style="width: 60%;" rows="4"></textarea></td>
					</tr>
				</table>

				<font color="red">è¯´æï¼</font> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="blue">1ãååç¼å·ï¼ä¿å­åä¼èªå¨å°åå®¶ç¼å·åååç±»å«ä»£ç å å°ååç¼å·ä¸­ï¼</font> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font color="blue">2ãååç±»åï¼æ¯å¦ååºåçç©ååéååç±»ï¼âæ¬è¿è´¹ç¨âç­ç±»ä¼¼çæ¶è´¹æå¡åéæå¡ç±»ï¼ï¼</font>
			</form>
		</div>
	</div>
</body>
</html>