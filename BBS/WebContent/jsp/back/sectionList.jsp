<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../../common/common.jspi"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的园子 后台- 版块列表</title>
    
    <link rel="stylesheet" type="text/css" href="${ctx}/css/back/Iframe.css" />
    <link rel="stylesheet" href="${ctx}/css/comme/bootstrap.min.css" type="text/css" media="screen" />
      <script type="text/javascript" src="${ctx}/js/comme/jquery-1.9.0.min.js"></script>
      <script type="text/javascript" src="${ctx}/js/comme/formValues.js"></script>
    <script src="${ctx}/js/layer/layer.js"></script>
    
    <script type="text/javascript">

       function addSectionForm(){
    	   layer.open({
    		   type: 1,
    		   title:"添加版块",
    		   skin: 'layui-layer-rim', //加上边框
    		   area: ['420px', '240px'], //宽高
    		   content: "<div id='abc'>"+$("#sectionFormId").prop("outerHTML")+"</div>",
    		   btn: ['提交','取消'],
    		   yes: function(index, layero){
    			   var parms=$('#abc').find("form[name=sectionForm]").getjsonvalues();
    				 $.ajax({
    						type: 'post',
    						url: "${ctx}/bblog/addSection.do",
    						data: parms,
    						dataType: 'json',
    						success: function(result) {
    							if(result<1){
  				    			    layer.closeAll();
    								layer.msg('添加失败'); 
    						    }else{
    						    	window.location.href="${ctx}/bblog/findSections.do";
    				    			layer.msg('添加成功'); 
    							 }
    						}
    					});
        		}
    		   
		   
    		 });

          }


       function updatesection(obj,sectionId,name,remarks){
    	   layer.open({
    		   type: 1,
    		   title:"修改版块",
    		   skin: 'layui-layer-rim', //加上边框
    		   area: ['420px', '240px'], //宽高
    		   content: "<div id='abc'>"+$("#sectionFormId").prop("outerHTML")+"</div>",
    		   btn: ['修改','取消'],
    		   yes: function(index, layero){
    			   var parms=$('#abc').find("form[name=sectionForm]").getjsonvalues();
     				 $.ajax({
    						type: 'post',
    						url: "${ctx}/bblog/editSection.do",
    						data: parms,
    						dataType: 'json',
    						success: function(result) {
    							if(result<1){
  				    			    layer.closeAll();
    								layer.msg('修改失败'); 
    						    }else{
    						    	window.location.href="${ctx}/bblog/findSections.do";
    				    			layer.msg('修改成功'); 
    							 }
    						}
    					}); 
        		}
    		 });

		   var vales={"sectionId":sectionId,"name":name,"remarks":remarks};
		   var form=$('#abc').find("form[name=sectionForm]");
		   form.setjsonvalues(vales);

           }

       function deletsection(obj,sectionId){
			 $.ajax({
					type: 'post',
					url: "${ctx}/bblog/deleteSection.do",
					data: {sectionId:sectionId},
					dataType: 'json',
					success: function(result) {
						if(result<1){
		    			    layer.closeAll();
							layer.msg('删除失败'); 
					    }else{
					    	window.location.href="${ctx}/bblog/findSections.do";
			    			layer.msg('删除成功'); 
						 }
					}
				});

       }



    </script>
    

</head>
<body>
<span class="cp_title">版块列表</span>
<div class="add_cp">
	<a onclick="addSectionForm()" href="javascript:void(0)" >+添加版块</a>
</div>
<div class="table_con">
	<table>
    	<tr class="tb_title">
        	<td width="8%">序号</td>
            <td width="15%">版块名称</td>
            <td width="19%">创建时间</td>
            <td width="12%">创建人</td>
            <td width="12%">备注</td>
            <td width="26%">操作</td>
        </tr>
        <c:forEach items="${sectionList}" var="section" varStatus="xh">
        <tr>
        	<td width="8%">${xh.count}</td>
            <td width="15%"><c:out value="${section.name}"/></td>
            <td width="19%">${section.createDate}</td>
            <td width="12%">
            ${section.createUser}
            </td>
            <td width="12%">
            ${section.remarks}
            </td>
            <td width="26%">
            	<input class="bj_btn" type="button" value="编辑" onclick="updatesection(this,${section.id},'${section.name}','${section.remarks}')"/>
                <input class="del_btn" type="button" value="删除" onclick="deletsection(this,${section.id})"/>
            </td>
        </tr>
        </c:forEach>
    </table>
</div>
<div style="display: none;">
	<div id="sectionFormId" style="padding:20px 20px 20px 20px;text-align: left;">
	   <form name="sectionForm">
              <div>
                 <label style="width: 60px;">版块名称:</label>
                 <input type="text" name="name"/>
                 <input type="hidden" name="sectionId"/>
              </div>
              <div>
                <label style="width: 60px;text-align: right;">备注:</label>
                <textarea name="remarks"></textarea>
              </div>
	   </form>
	</div>
</div>


</body>
</html>