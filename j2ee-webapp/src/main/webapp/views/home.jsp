<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
  
<!--<jsp:include page="include.jsp"/>
-->
<%@ include file="include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./static/css/jquery-ui.min.css">
<link rel="stylesheet" href="./static/css/style.css">
<link rel="stylesheet" href="./static/css/jquery.dataTables.min.css">
<link href="./static/css/bootstrap.min.css" rel="stylesheet">
<script src="./static/js/jquery.js"></script>
<script src="./static/js/jquery-ui.min.js"></script>
<script src="./static/js/jquery.dataTables.min.js"></script>
<script src="./static/js/bootstrap.js"></script>
<style type="text/css">
body {
	width: 100%;
	height: 100%;
	font-size : 12px;
	margin:0px;
	padding:0px;
	background-color:#E5EDEF;
}

li {
	list-style-type: none;
}

/* a {
	cursor: pointer;
} */
.rightAlign {
	float: right;
	margin: 10px auto;
}

.leftAlign {
	float: left;
	margin-right:20px;
	background: url(./static/images/listLine.png) no-repeat;
	font-size: 12px;
	line-height:10px;
	padding:0px 10px;
}

#top {
	height: 50px;
	width: 100%;
	background-image: url('./static/images/top.png');
	background-repeat: repeat-x;
}

#middle {
	height: 500px;
	margin-top:5px;
}



#menu {
	width: 100%;
	/* height: 100%; */
	float: left;
	/* border:1px solid #B8D0D6; */
}

#menu li {
	cursor: pointer;
	font-size:12px;
	height:22px;
	line-height:22px;
	padding-left:20px;
	/* list-style-image: url('./static/images/file.png'); */
}
#menu ul {
	padding-left:0px;
}
#menu image {
	width:22px;
	height:22px;
}
#menu div {
	height: 100%;
	padding:0px;
}
#menu .select{
	background-color: #e8edf3;
}

iframe{
	width:100%;
	border:none;
	background-color:#fff;
}
.displayMenu{
	/* height:100%; */
	/* float: left;  */
	border: 1px solid #B8D0D6; 
	display:none;
	position:absolute;
	left:5px;
	width:25px;
	text-align:center;
}
.displayMenu a{
	cursor:pointer;
}
.ui-state-active, 
.ui-widget-content .ui-state-active, 
.ui-widget-header .ui-state-active, 
a.ui-button:active, 
.ui-button:active, 
.ui-button.ui-state-active:hover {
	border: 1px solid #c5c5c5;
    background: #E3EBED;
/*     font-weight: bold; */
    color: #183152;
}
.menuPanel h2{
	font-size:12px;
}
.menuPanel{
	float: left; 
	/* border: 1px solid #B8D0D6;  */
	height: 100%; 
	width: 200px;
}

.menuPanel div:first-child{
	border: 1px solid #B8D0D6;
}

#container{
	position:absolute;
	left:205px;
	height: 100%;
	border:1px solid #B8D0D6;
}
#bottom{
	height:29px;
}
#bottom {
	width: 100%;
	height: 20px;
	background-color:#E5EDEF;
}
.nav-tabs {
	margin-left:5px;
}
.nav-tabs li{
	/* background-color:#f5f8f9; */
	/* border:1px solid #cbdce1; */
}
.nav-tabs li a{
	/* background-color:#f5f8f9; */
	border:1px solid #cbdce1;
}
#menu .ui-state-active .ui-icon, .ui-button:active .ui-icon,
#menu .ui-state-active .ui-icon, .ui-button:active .ui-icon-circle-arrow-e{
	background-image: url('./static/images/folder.png');
	background-position: center;
}
#menu .ui-icon, .ui-widget-content .ui-icon,
#menu .ui-icon, .ui-widget-content .ui-icon-circle-arrow-s{
	background-image: url('./static/images/folder.png');
	background-position: center;
}
#top a{
	color:#b9ccda;
	cursor: pointer;
}
.changeCityContent{
	display:none;
    width: 230px;
    border: solid 1px #06223e;
    overflow: hidden;
    background: #FFF;
    position: absolute;
    top: 30px;
    right: 70px;
    padding-left:0px;
    z-index:13;
}
.changeCityContent li{
	float:left;
	margin-top: 10px;
    height: 21px;
    line-height:11px;
    padding:0px 10px;
    background: url(./static/images/listLine.png) no-repeat;
}
#top .changeCityContent a{
	color:black;
}
#container .nav-tabs .close{
	background: url(./static/images/tabspage_icon.png) no-repeat;
	display: block;
    overflow: hidden;
    width: 11px;
    height: 11px;
    padding: 0;
    text-indent: -1000px;
    position: absolute;
    top: 3px;
    right: 3px;
    border:none;
    cursor: pointer;
    opacity: 1;
}
#container .nav-tabs .close.hover{
	background-position:bottom;
	opacity: 1;
}
</style>
<script type="text/javascript">
	$(function() {
		var width = $(window).width();
		var height = $(window).height();
		$("#container").width(width-210);
		$("#container").height(height-70-5);
		$("#middle").height(height-70-5);
		$(".displayMenu").height($("#middle").height());
		$("iframe").height($("#middle").height()-$("#container .accountInfo").height()-$("#container ul").height());
		/* $("iframe").width(width-210); */
		$(".rightAlign .changeCity a").on("click", function(){
			$(".rightAlign .changeCity").addClass("select");
			var selected = $(".rightAlign .changeCity").hasClass("select");
			if(!!selected){
				$(".changeCityContent").show();
			}else{
				$(".changeCityContent").hide();
			}
		});
		$(".rightAlign .changeCity a").on("blur", function(){
			console.log("aaa");
			$(".rightAlign .changeCity").removeClass("select");
			$(".changeCityContent").hide();
		});
		
		var icons = {
	      header: "ui-icon-circle-arrow-e",
	      activeHeader: "ui-icon-circle-arrow-s"
	    };
		$("#menu").accordion({
			heightStyle : "fill",
			icons: icons
		});
		$(".hideBtn").on("click", function() {
			$(".menuPanel").hide();
			$(".displayMenu").show();
			$("#container").width(width-30);
			$("#container").css("left","35px");
		});
		$(".displayMenu a").on("click", function(){
			$(".menuPanel").show();
			$(".displayMenu").hide();
			$("#container").width(width-210);
			$("#container").css("left","205px");
		});
		$(window).resize(function(){
			width = $(this).width();
			$("#container").width(width-210);
			height = $(this).height();
			/* $("#container").width(width-210); */
			$("#middle").height(height-70-5);
			$(".displayMenu").height($("#middle").height());
			$("#container").height(height-70-5);
			$("#menu").accordion( "refresh");
			$("iframe").height($("#middle").height()-$("#container .accountInfo").height()-$("#container ul").height());
		});
		$("#container .nav").on("mouseover", "a.close", function(){
			$(this).addClass("hover");
		});
		$("#container .nav").on("mouseout", "a.close", function(){
			$(this).removeClass("hover");
		});
		$(".changeCityContent").mouseout(function(){
			$(this).hide();
		});
		$(".changeCityContent").mouseover(function(){
			$(this).show();
		});
	});
	function goHome(menuIndex){
		$("iframe").attr("src","./views/homePage.jsp");
		$(".nav.nav-tabs li").removeClass("active");
		$(".nav.nav-tabs li.myHome").addClass("active");
	}
	function goGoodsManage(menuIndex){
		//更新菜单的select状态
		$("#menu li").removeClass("select");
		$("#menu li."+menuIndex+"").addClass("select");
		var exist = $(".nav.nav-tabs li").hasClass("goodsManage");
		if(!!exist){
			//这个标签已经存在
			if(!$(".nav.nav-tabs li.goodsManage").hasClass("active")){
				//但是没有激活
				$(".nav.nav-tabs li").removeClass("active");
				$(".nav.nav-tabs li.goodsManage").addClass("active");
				$("iframe").attr("src","/goods/list");
			}
		}else{
			$(".nav.nav-tabs li").removeClass("active");
			$(".nav.nav-tabs").append('<li class="active goodsManage"><a onclick="javascript:goGoodsManage(\'goodsManage\');">商品资料</a><a onclick="removeTab(\'goodsManage\')" class="close">close</a></li>');
			$("iframe").attr("src","/goods/list");
		}
	}
	function removeTab(menuIndex){
		$(".nav li."+menuIndex+"").remove();
		$("iframe").attr("src","./homePage.jsp");
		$(".nav.nav-tabs li").removeClass("active");
		$(".nav.nav-tabs li.myHome").addClass("active");
		$("#menu li").removeClass("select");
	}
	function goStaffContact(menuIndex){
		$("#menu li").removeClass("select");
		$("#menu li."+menuIndex+"").addClass("select");
		var exist = $(".nav.nav-tabs li").hasClass(menuIndex);
		if(!!exist){
			//这个标签已经存在
			if(!$(".nav.nav-tabs li."+menuIndex).hasClass("active")){
				//但是没有激活
				$(".nav.nav-tabs li").removeClass("active");
				$(".nav.nav-tabs li."+menuIndex).addClass("active");
				$("iframe").attr("src","./staffContact.html");
				$("iframe")
			}
		}else{
			$(".nav.nav-tabs li").removeClass("active");
			$(".nav.nav-tabs").append('<li class="active staffContact"><a onclick="javascript:goStaffContact(\'staffContact\');">员工信息</a><a onclick="removeTab(\'staffContact\')" class="close">close</a></li>');
			$("iframe").attr("src","./staffContact.html");
		}
	}
</script>
</head>
<body>
	<div>
		<div id="top">
			<div>
				<ul class="rightAlign">
					<li class="leftAlign changeCity"><a>&nbsp;(<span>广州</span>)切换城市</a></li>
					<li class="leftAlign"><a href="./logout">&nbsp; 退出</a></li>
				</ul>
				<ul class="changeCityContent">
					<li><a href="./home">北京</a></li>
					<li><a href="./home">上海</a></li>
					<li><a href="javascript:" onclick="">广州</a></li>
					<li><a href="javascript:" onclick="">深圳</a></li>
				</ul>
			</div>
		</div>
		<div id="middle">
			<div class="displayMenu">
				<a style="font-size:16px; cursor: pointer; font-weight: bold;">&gt;&gt;</a>
			</div>
			<div class="menuPanel">
				<div>
					<h2 style="width: 90px; display: inline-block; margin: 0px 0px;font-size:12px;padding:0.5em 0.5em 0.5em 0.7em">
						<span class="ui-accordion-header-icon ui-icon ui-icon-triangle-1-s"></span>
						企业管理
					</h2>
					<a class="hideBtn"
						style="width: 21px; float: right; height: 21px; line-height: 26px;font-size:16px; background-repeat: no-repeat; cursor: pointer; font-weight: bold;">&lt;&lt;</a>
				</div>
				<div id="menu">
					<h3>基本信息</h3>
					<div>
						<ul>
							<li class="spareInfor"><img src="./static/images/file.png"/>&nbsp;&nbsp;<a onclick="javascript:goHome('spareInfor');">库存资料</a></li>
							<li class="goodsManage"><img src="./static/images/file.png"/>&nbsp;&nbsp;<a onclick="javascript:goGoodsManage('goodsManage');">商品资料管理</a></li>
							<li class="staffContact"><img src="./static/images/file.png"/>&nbsp;&nbsp;<a onclick="javascript:goStaffContact('staffContact');">员工通讯录</a></li>
						</ul>
					</div>
					<h3>客服管理</h3>
					<div>
						<ul>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>2</a></li>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>3</a></li>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>4</a></li>
						</ul>
					</div>
					<h3>商场管理</h3>
					<div>
						<ul>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>2</a></li>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>3</a></li>
							<li><img src="./static/images/file.png"/>&nbsp;&nbsp;<a>4</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div id="container" class="">
				<ul class="nav nav-tabs">
  					<li class="active myHome">
  						<a onclick="javascript:goHome('spareInfor')">Home</a>
  						
  					</li>
  				</ul>
				<iframe src="./views/homePage.jsp">
				
				</iframe>
			</div>
		</div>
	</div>
	<div id = "bottom">
		
	</div>
</body>
</html>