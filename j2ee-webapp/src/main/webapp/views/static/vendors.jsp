<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/views/include.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


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
.cls-title {
	font-weight: bold;
}
#vendorTb td {
	font-size: 13px;
}

#vendorTb{
	width: 100%!important;
}
.cls-data-tr-head-list {
	height: 20px;
}
.editVendorForm{
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
.forEditVendor{
	display:none;
}
img{
	cursor: pointer;
}
</style>
<script type="text/javascript">
	var table = null;
	
//	var str ='{"data":[{"address":"","brand":"大众","contact":"","fax":"","habit":"广州","id":"1","mail":"","memo":"","name":"简美","postCode":"","shortName":"精品","tel":"","vendorId":"A00"}]}';
    var str = '<c:out value="${requestScope.list}" escapeXml="false" />';
	
  
    eval("var result = " + str);
	
    function editVendor(vendorId) {
    	//alert("should popup window to edit id:" + vendorId);
    	
        if (vendorId == '') {
        	//alert("it's to crated empty");
        	setValue("NEW",'','','','','','','','大众');
        	$(".forEditVendor").show();
          	$("#editVendor").modal('show');
        } else {
            $.ajax( {  
               type : "GET",  
               url : "/vendor/detail",  
               data : "vendorId="+ vendorId,  
               dataType: "text",  
               success : function(msg) {  
                      alert(msg);
                       eval("var result = " + msg);
                 
                       setValue('EDIT',result.data.vendorId,result.data.brand,result.data.habit,result.data.shortName,result.data.tel,
                    		   result.data.fax,result.data.name,result.data.contact);
                       $(".forEditVendor").show();
                   	   $("#editVendor").modal('show');
                   }  
               });  

        }
    	
    	
    }
    
    function setValue(opMode,vendorId,brand,habit,shortName,tel,fax,name,contact) {
    	$('#opInd').val(opMode);
    	$('#newVendorId').val(vendorId);
    	$('#newHabit').val(habit);
    	$('#newShortName').val(shortName);
    	$('#newTel').val(tel);
    	$('#newFax').val(fax);
    	$('#newName').val(name);
    	$('#newBrand').val(brand);
    	$('#newContact').val(contact);
    	
    	//copy search criteria 
    //	alert($("input[name='vendorId']").val())
    		//$('searchVendorId').val();
    		
    }

	$(function() {
		table = $("#vendorTb").DataTable({
			data:result.data,
			"columns": [
			            {"data" : "id"},
			            {"data" : "vendorId"},
			            {"data" : "shortName"},
			            {"data" : "name"},
				        {"data" : "habit"},
			            {"data" : "brand"},
			            {"data" : null,
			             render : function (data,type,row) {
			            	 //return "<a href=\"#editVendor\" onclick='editVendor(\"" + row.vendorId+"\");'>Edit</a>";
			            	 return "<img src=\"${ctxStatic}/images/rowedit.gif\" onclick='editVendor(\"" + row.vendorId+"\");'></img>";
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
		$("#editVendor").on("hidden.bs.modal" , function(){
			$(".forEditVendor").hide();
		});
	});
	
	

</script>
</head>
<body>
	
	<form action="/vendor/list" method="post" class="searchForm" role="form" style="margin-bottom: 1em;">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家编号</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control" name="vendorId" value='<c:out value="${empty searchCriteria.vendorId ? '' : searchCriteria.vendorId}" />'/>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家简称</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control" name="shortName"  value='<c:out value="${empty searchCriteria.shortName ? '' : searchCriteria.shortName}" />'/>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">厂家名称</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control" name="name" value='<c:out value="${empty searchCriteria.name ? '' : searchCriteria.name}" />'>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">品牌</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control" name="brand" value='<c:out value="${empty searchCriteria.brand ? '' : searchCriteria.brand}" />'>
				</div>
				
			</div>
			<div class="col-lg-3 col-md-3 col-sm-3">
				<label class="control-label col-lg-5 col-md-5 col-sm-5">产地</label>
				<div class="col-lg-7 col-md-7 col-sm-7">
					<input type="text" class="form-control" name="habit" value='<c:out value="${empty searchCriteria.habit ? '' : searchCriteria.habit}" />'>
				</div>
				
			</div>
			
			<div class="col-lg-1 col-md-1 col-sm-1" style="text-align: right;">
				<button>查询</button>
			</div>
		</div>
	</form>
	<c:choose> 
      <c:when test="${empty message}">   
      </c:when> 
     <c:when test="${fn:contains(message,'成功')}">   
        <div>
		  <h3>
			 <font color="blue">${message}</font>
		  </h3>
	    </div>  
     </c:when> 

     <c:otherwise>
      <div>
		  <h3>
			 <font color="red">${message}</font>
		  </h3>
	    </div>     
     </c:otherwise> 

    </c:choose> 
	
	<div class="detail">
		<form method="post" onsubmit="return false" style="margin: 0px">
			<span class="cls-title">厂家资料</span>
			<div style="float: right;">
				<input type="button" value="添加" id="" name="" onclick="editVendor('');" /><span style="margin-left: 9px;"></span>
				<input type="button" value="删 除" class="cls-button" /><span style="margin-left: 9px;"></span>
				<input type="button" value="导出Excel" class="cls-button2" />
			</div>
		</form>
		<table class="order-column" id="vendorTb">
			<thead>
				<tr>
					<td>序号</td>
					<td>厂家编号</td>
					<td>厂家简称</td>
					<td>厂家名称</td>
					<td>产地</td>
					<td>品牌</td>
					<td>编辑</td>
				</tr>
			</thead>
		</table>
	</div>
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
					<div style="height: 230px; border: 0px none;">
						<form method="post" action="/vendor/save" class="editVendorForm">
							<div style="height:24px; margin-bottom:10px;">
								<div class="floatLeft" style="font-weight: bold; line-height:24px;height:100%;">
									<span>厂家资料</span>
								</div>
								<div class="floatRight">
									<button>保 存</button> 
									<input type="button" value="重 置" onclick="setValue('NEW','','','','','','','','大众');" />
									<input type="text" style="display:none" name="opind" id="opInd"/>
								    <input type="text" style="display:none" name="searchVendor.vendorId" value='<c:out value="${empty searchCriteria.vendorId ? '' : searchCriteria.vendorId}" />'/>
					                <input type="text" style="display:none" name="searchVendor.shortName"  value='<c:out value="${empty searchCriteria.shortName ? '' : searchCriteria.shortName}" />'/>
					                <input type="text" style="display:none" name="searchVendor.name" value='<c:out value="${empty searchCriteria.name ? '' : searchCriteria.name}" />'>
					                <input type="text" style="display:none" name="searchVendor.brand" value='<c:out value="${empty searchCriteria.brand ? '' : searchCriteria.brand}" />'>
					                <input type="text" style="display:none" name="searchVendor.habit" value='<c:out value="${empty searchCriteria.habit ? '' : searchCriteria.habit}" />'>
								     
								     
								     <!-- -end  -->
								     
									
								</div>
							</div>
							<table class='cls-data-table-detail'
								style="table-layout: fixed; border: none;" width="100%">
								<tr>
									<td class='cls-data-th-detail' width="120px"><font color="red">*</font>厂家编号：
									</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7' width="90%">
										<font>
											<input type="text" name="newVendor.vendorId" id="newVendorId"/>
										</font>
									</td>
								</tr>
								
								
																			<tr>
									<td class='cls-data-th-detail' width="120px">联系人：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="newVendor.contact" id="newContact"/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">简称：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="newVendor.shortName" id="newShortName" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">电话：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="newVendor.tel" id="newTel" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">厂家全称：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="newVendor.name" id="newName"/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">传真：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="fax" id="newFax" />
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">产地：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<input type="text" name="newVendor.habit"  id="newHabit"/>
										</font>
									</td>
								</tr>
								<tr>
									<td class='cls-data-th-detail' width="120px">品牌：</td>
									<td class="cls-data-td-editdetail" bgcolor="#ffffff" colspan='7'>
										<font>
											<select style="width: 95%" name="newVendor.brand"  id="newBrand">
												<option value='大众'>大众</option>
												<option value='高端'>高端</option>
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
	<div class="modal-backdrop fade forEditVendor in"></div>
</body>
</html>