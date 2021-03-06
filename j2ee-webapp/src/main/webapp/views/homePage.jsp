<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
  
<jsp:include page="include.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/static/css/jquery-ui.min.css">
<link rel="stylesheet" href="/static/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/static/css/style.css">
<script src="/static/js/jquery.js"></script>
<script src="/static/js/jquery-ui.min.js"></script>
<script src="/static/js/jquery.dataTables.min.js"></script>
<style type="text/css">
body{
	font-size : 14px;
	margin:0px auto;
}
table {
	margin-top:20px;
	text-align: center;
}
#table{
	width:100%;
	margin:0px;
}
.accountInfo {
    display: block;
    overflow: hidden;
    height: 35px;
    padding: 0 10px;
    background-color:#F4FAFF;
    line-height:5px;
}
.accountInfo .right {
    float: right;
    padding-right: 10px;
    text-align: right;
}
.accountInfo p {
    /* padding: 8px 0 0 0;
    line-height: 19px; */
}
.accountInfo p span {
    font-size: 14px;
    font-weight: bold;
}
</style>
<script type="text/javascript">
	$(function() {
		var table = $("#table").DataTable({
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
		$(window).on('resize', function () {
			console.log(table);
			var width = $("#table_wrapper").width();
			$("#table").width(width);
			//table.fnAdjustColumnSizing();
		} );
		$("#table tbody").on('mouseenter', 'td', function () {
            $(this).siblings("td").removeClass( 'highlight' );
            $(this).siblings("td").addClass('highlight');
            $(this).removeClass( 'highlight' );
            $(this).addClass('highlight');
		});
		$("#table tbody").on('mouseleave', 'td', function () {
			$(this).siblings("td").removeClass( 'highlight' );
			$(this).removeClass( 'highlight' );
		});
	});
	//var json = [{"name":"shifre","age":"28","staff":"123456"},{"name":"shifre","age":"28","staff":"123456"}];
</script>
</head>
<body>
	<div class="accountInfo">
		<div id="todayinfo" class="right"><p>2017年12月6日，星期三</p></div>
		<p><span id="accountinfo">欢迎您：【kit】刘亚容，职务：内务总监，所属部门：【10000】公司</span></p>
   </div>
		<div class="detail">
			<table id="table" class="order-column" >
				<thead>
					<tr>
						<td>name</td>
						<td>销售单编号</td>
						<td>staff</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>test</td>
						<td>
							<span style="color:#0000FF;cursor:pointer;" onclick="window.open('./showReport.jsp','查看销售单明细','toolbar=no,location=no,menubar=no')">6800022</span>
						</td>
						<td>test</td>
					</tr>
					<tr>
						<td>123</td>
						<td>test</td>
						<td>test</td>
					</tr>
					<tr>
						<td>gba</td>
						<td>test</td>
						<td>test</td>
					</tr>
				</tbody>
			</table>
		</div>
</body>
</html>