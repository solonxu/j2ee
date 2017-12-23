<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
  
<jsp:include page="include.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../static/css/style.css">
<style type="text/css">
body{
	padding:0px;
	font-size:13px !important;
}
.cls-data-th-list { /*数据自动列表报表数据标题行每个<td/>的样式#3AA8F3/#64A5F8*/
	/**background-color: #64A5F8;*/
	/* BACKGROUND-IMAGE: url(./webresources/skin/vista/images/datatitle_bg.gif); */
	text-align: center;
	vertical-align: middle;/* 
	border: 1px solid #C0C0C0; */
}

.cls-data-td-list { /*数据自动列表报表数据行每个<td/>的样式*/
	/* border: 1px solid #C0C0C0; */
	min-height: 23px;
	height: 23px;
	padding-top: 0px;
	padding-bottom: 0px;
}

.cls-data-content-list {
	/*如果cellresize配置为1或者显示了垂直滚动条，则会将单元格内容自动包在一个<div/>中，下面就是设置这个div的样式*/
	/*white-space:nowrap;*/
	overflow: hidden;
	text-overflow: ellipsis;
	width: 100%
}
.cls-data-th-detail{
	background-color: #EBF0FE;
	font-size:13px;
}
table td{
	border:none;
}
#ordersdetail_guid_report1_data td{
	height:25px;
}
#ordersdetail_guid_report2{
	border-collapse: collapse;
}

#ordersdetail_guid_report2 table td{
	border:1px solid #C0C0C0;
	font-size:13px;
}
#ordersdetail_guid_report2 table tbody td{
		background-color: #fff;
}
body font{
	font-size:13px;
}
</style>
</head>
<body>
	<div class="" style="display: none; position: absolute;">
		<div class="aui_outer">
			<table class="aui_border">
				<tbody>
					<tr>
						<td class="aui_nw"></td>
						<td class="aui_n"></td>
						<td class="aui_ne"></td>
					</tr>
					<tr>
						<td class="aui_w"></td>
						<td class="aui_c"><div class="aui_inner">
								<table class="aui_dialog">
									<tbody>
										<tr>
											<td colspan="2" class="aui_header"><div
													class="aui_titleBar">
													<div class="aui_title"
														style="cursor: move; display: block;"></div>
													<a class="aui_close" href=""
														style="display: block;">×</a>
												</div></td>
										</tr>
										<tr>
											<td class="aui_icon" style="display: none;"><div
													class="aui_iconBg" style="background: none;"></div></td>
											<td class="aui_main" style="width: auto; height: auto;"><div
													class="aui_content" style="padding: 20px 25px;"></div></td>
										</tr>
										<tr>
											<td colspan="2" class="aui_footer"><div
													class="aui_buttons" style="display: none;"></div></td>
										</tr>
									</tbody>
								</table>
							</div></td>
						<td class="aui_e"></td>
					</tr>
					<tr>
						<td class="aui_sw"></td>
						<td class="aui_s"></td>
						<td class="aui_se" style="cursor: se-resize;"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div id="WX_CONTENT_ordersdetail">
		<table cellspacing="0" cellpadding="0" width="100%" id="ordersdetail">
			<tbody>
				<tr>
					<td style = "border:none;"><table width="100%" cellspacing="0" cellpadding="0"
							style="margin: 0;">
							<tbody>
								<tr>
									<td><table cellspacing="0" cellpadding="0"
											class="cls-page-content" width="100%"
											style="border: solid -1px;">
											<tbody>
												<tr>
													<td>
														<table cellspacing="0" cellpadding="0" width="100%">
															<tbody>
																<tr>
																	<td valign="top">

																		<table cellspacing="0" cellpadding="0" width="100%"
																			id="ordersdetail_guid_report1">
																			<tbody>
																				<tr>
																					<td valign="top">
																						<div id="WX_CONTENT_ordersdetail_guid_report1">
																							<form method="post" onsubmit="return false"
																								autocomplete="off"
																								name="frm_ordersdetail_guid_report1"
																								style="margin: 0px">


																								<table class="cls-data-table-detail"
																									cellspacing="0" cellpadding="0"
																									id="ordersdetail_guid_report1_data"
																									style="table-layout: fixed; border: none;"
																									width="100%">
																									<tbody>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">VIP卡号：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="vipcode" value="800002"
																												oldvalue="800002">800002</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">积分：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="jf" value="51884"
																												oldvalue="51884">51884</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">联系电话：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="shiptel" value="13719379994"
																												oldvalue="13719379994">13719379994</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">其它电话：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="othertel" value="1" oldvalue="1">1</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">客户姓名：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="clientname" value="李海林"
																												oldvalue="李海林">李海林</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">性别：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="xb" value="男" oldvalue="男">男</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">联系人：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="connectman" value="" oldvalue="">&nbsp;</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">送货日期：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="secondshipdate"
																												value="2017-07-26" oldvalue="2017-07-26">2017-07-26</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">送货地址：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="5"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="shipaddr"
																												value="广州市白云区广州大道北1968号合一国际"
																												oldvalue="广州市白云区广州大道北1968号合一国际">广州市白云区广州大道北1968号合一国际</font></td>
																											<td class="cls-data-th-detail"
																												style="color: red; border: none;"
																												width="100px" align="right"
																												bgcolor="#f0f0f0">是否送完货：</td>
																											<td class="cls-data-td-editdetail"
																												style="color: red; border: none;"
																												align="left" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="finish" value="是" oldvalue="是">是</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">备注：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="7"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="memo" value="" oldvalue="">&nbsp;</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">销售单编码：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="ordercode" value="6800022"
																												oldvalue="6800022">6800022</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">销售人员：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="xsry" value="1001"
																												oldvalue="1001">1001</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">带客销售人员：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="dkxsry" value="" oldvalue="">&nbsp;</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">设计师：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="sjs" value="" oldvalue="">&nbsp;</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">服务费金额：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="shipprice" value="0.00"
																												oldvalue="0.00">0.00</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">已收服务费：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="preshipprice" value="0.00"
																												oldvalue="0.00">0.00</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">实收金额：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="prices" value="7,344.00"
																												oldvalue="7,344.00">7,344.00</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">已收货款：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="preprices" value="3,000.00"
																												oldvalue="3,000.00">3,000.00</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">是否定制：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="dzflag" value="否" oldvalue="否">否</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">本次使用积分数：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="ysyjf" value="0" oldvalue="0">0</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">商场：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="scmc" value="乐从美式店"
																												oldvalue="乐从美式店">乐从美式店</font></td>
																											<td class="cls-data-th-detail" width="100px"
																												align="right"
																												style="border: none;">带客商场：</td>
																											<td class="cls-data-td-editdetail"
																												align="left"
																												style="border: none;" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="scmc2" value="" oldvalue="">&nbsp;</font></td>
																										</tr>
																										<tr>
																											<td class="cls-data-th-detail"
																												style="color: red; border: none;"
																												width="100px" align="right"
																												bgcolor="#f0f0f0">是否注销：</td>
																											<td class="cls-data-td-editdetail"
																												style="color: red; border: none;"
																												align="left" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="logout" value="否" oldvalue="否">否</font></td>
																											<td class="cls-data-th-detail"
																												style="color: red; border: none;"
																												width="100px" align="right"
																												bgcolor="#f0f0f0">注销日期：</td>
																											<td class="cls-data-td-editdetail"
																												style="color: red; border: none;"
																												align="left" colspan="1"
																												width="150px"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="canceldate" value="" oldvalue="">&nbsp;</font></td>
																											<td class="cls-data-th-detail"
																												style="color: red; border: none;"
																												width="100px" align="right"
																												bgcolor="#f0f0f0">换单情况：</td>
																											<td class="cls-data-td-editdetail"
																												;="" style="color: red; border: none;"
																												align="left" colspan="3"><font
																												id="font_ordersdetail_guid_report1"
																												name="font_ordersdetail_guid_report1"
																												value_name="hdqk" value="" oldvalue="">&nbsp;</font></td>
																										</tr>
																										<tr></tr>
																									</tbody>
																								</table>
																								<span id="ordersdetail_guid_report1_metadata"
																									style="display: none;" pageid="ordersdetail"
																									componentid="report1"
																									refreshcomponentguid="ordersdetail"
																									componenttypename="application.report"
																									reportid="report1" reportfamily="form"
																									dependingchildreportids="report2;"
																									current_accessmode="readonly"></span><font
																									id="font_ordersdetail_guid_report1_conditions"
																									name="font_ordersdetail_guid_report1_conditions"
																									value_name="txtid"
																									value="ff8080815d7cacc4015d7cbb6eff0001"
																									style="display: none"></font><font
																									id="font_ordersdetail_guid_report1_conditions"
																									name="font_ordersdetail_guid_report1_conditions"
																									value_name="txtorderid" value=""
																									style="display: none"></font>
																							</form>
																						</div>
																					</td>
																				</tr>
																			</tbody>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td valign="top">

																		<table cellspacing="0" cellpadding="0" width="100%"
																			id="ordersdetail_guid_report2">
																			<tbody>
																				<tr>
																					<td valign="top">
																						<div id="WX_CONTENT_ordersdetail_guid_report2">
																							<form method="post" onsubmit="return false"
																								autocomplete="off"
																								name="frm_ordersdetail_guid_report2"
																								style="margin: 0px">
																								<table width="100%" cellspacing="1"
																									bgcolor="#C0C0C0">
																									<thead>
																										<tr class="cls-data-th-list">
																											<td width="5%">商品索引号</td>
																											<td width="8%">商品编码</td>
																											<td width="10%">商品名称</td>
																											<td width="4%">颜色</td>
																											<td width="4%">尺寸</td>
																											<td width="10%">材质</td>
																											<td width="2%">单位</td>
																											<td width="3%">数量</td>
																											<td width="3%">已出数量</td>
																											<td width="6%">成本价</td>
																											<td width="6%">单价</td>
																											<td width="5%">折率</td>
																											<td width="6%">合计</td>
																											<td width="5%">样板标识</td>
																											<td width="10%">备注</td>
																											<td width="5%">体积</td>
																											<td width="5%">标识</td>
																											<td width="3%">可用量</td>
																											<td width="3%">在售量</td>
																											<td width="3%">在购量</td>
																										</tr>
																									</thead>
																									<tbody>
																										<tr>
																											<td>148140</td>
																											<td>S01RF817-MC01</td>
																											<td>妆凳</td>
																											<td>//</td>
																											<td>502*540*864</td>
																											<td>502*540*864~橡胶木+白杨木实木，东北桦薄片</td>
																											<td>张</td>
																											<td>3</td>
																											<td>3</td>
																											<td>721.00</td>
																											<td>2,720.00</td>
																											<td>90.0</td>
																											<td>7,344.00</td>
																											<td>新货</td>
																											<td></td>
																											<td>0.0000</td>
																											<td>新货</td>
																											<td>0</td>
																											<td>0</td>
																											<td>0</td>
																										</tr>
																									</tbody>
																								</table>
																								<span id="ordersdetail_guid_report2_metadata"
																									style="display: none;" pageid="ordersdetail"
																									componentid="report2"
																									refreshcomponentguid="ordersdetail_guid_report2"
																									componenttypename="application.report"
																									reportid="report2" reportfamily="list"
																									isslavedetailreport="true"
																									navigate_reportid="report2"></span><font
																									id="font_ordersdetail_guid_report2_conditions"
																									name="font_ordersdetail_guid_report2_conditions"
																									value_name="orderid"
																									value="ff8080815d7cacc4015d7cbb6eff0001"
																									style="display: none"></font>
																							</form>
																						</div>
																					</td>
																				</tr>
																			</tbody>
																		</table>

																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table></td>
								</tr>
							</tbody>
						</table> <span id="ordersdetail_metadata" style="display: none;"
						pageid="ordersdetail" componentid="ordersdetail"
						refreshcomponentguid="ordersdetail"
						componenttypename="container.page"
						childcomponentids="report1;report2"></span></td>
				</tr>
			</tbody>
		</table>
		<div id="wx_titletree_container" style="display: none;"
			class="titletree_container">
			<div id="titletree_container_inner" class="titletree_container_inner">
				<div id="tree" class="bbit-tree">
					<div class="bbit-tree-bwrap">
						<div class="bbit-tree-body" id="wx_titletree_content"></div>
					</div>
				</div>
			</div>
			<div id="wx_titletree_buttoncontainer"
				style="padding-top: 3px; padding-bottom: 5px; text-align: center"></div>
		</div>
		<div id="LOADING_IMG_ID" class="cls-loading-img"></div>
	</div>
	<script type="text/javascript" src="./script/jquery.js"></script>
	<span id="ordersdetail_url_id" style="display: none;"
		value="/jmerp/ShowReport.wx?DISPLAY_TYPE=1&amp;PAGEID=ordersdetail&amp;txtid=ff8080815d7cacc4015d7cbb6eff0001&amp;txtorderid=&amp;report1_PAGENO=1&amp;report1_ACCESSMODE=update&amp;report1_RECORDCOUNT=1&amp;report1_PAGECOUNT=1&amp;report2_PAGENO=1&amp;orderid=ff8080815d7cacc4015d7cbb6eff0001&amp;report2_ALLDATASETS_RECORDCOUNT=report2__default_default_default_key__default_default_default_key%3D1%3B&amp;report2_RECORDCOUNT=1&amp;report2_PAGECOUNT=1"></span>
	<div
		style="display: none; position: fixed; left: 0px; top: 0px; width: 100%; height: 100%; cursor: move; opacity: 0; background: rgb(255, 255, 255);"></div>
</body>
</html>