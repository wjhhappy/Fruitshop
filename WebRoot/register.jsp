<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Register</title>
<script type="text/javascript">
    //输入姓名后，调用方法，判断用户名
    function nameIsNull(){
    var name=document.registForm.uname.value;
    if(name==""){
    alert("请输入姓名!");
    document.registForm.uname.focus();
    return false;
    }
    document.registForm.flag.value="0";
    document.registForm.submit();
    return true;
    } 
    
    //注册时检查输入项
    function allIsNull(){
    var name=document.registForm.uname.value;
    var pwd=document.registForm.upass.value;
    var repwd=document.registForm.reupass.value;
    if(name==""){
    alert("请输入姓名!");
    document.registForm.uname.focus();
    return false;
    }
    if(pwd==""){
    alert("请输入密码!");
    document.registForm.upass.focus();
    return false;
    }
    
    if(repwd==""){
    alert("请输入确认密码!");
    document.registForm.reupass.focus();
    return false;
    }
    if(pwd!=repwd){
    alert("2次密码不一致,请重新输入!");
    document.registForm.upass.value="";
    document.registForm.reupass.value="";
    document.registForm.upass.focus();
    return false;
    }
    document.registForm.flag.value="1";
    document.registForm.submit();
    return true;
    } 
    </script>		
  </head>
  
  <body>
   <%@ include file="header.jsp" %>
 <div class="heading-inner-page">
			<div class="container">
				<h2>Register</h2>
				<ul class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li>Register</li>
				</ul>
			</div>
		</div>
		<!-- Login page -->
		<div class="m-t-60">
			<div class="container">
				<div class="bg-img-2 position-left">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<div class="box p-40 p-xs-20 bg-white">
								<form action="registServlet" method="post" name="registForm">
                                 <input type="hidden" name="flag">
									<div class="form-group">
										<label class="control-label" for="input-email">Name</label>
										<input type="text" name="uname" value="${requestScope.userName}" onblur="nameIsNull()" placeholder="Name" id="input-first-name" class="form-control form-item">
									   <c:if test="${requestScope.isExit=='false'}">
                                       <font color=red size=5>×</font>
                                        </c:if>
                                     <c:if test="${request.isExit=='true'}">
                                       <font color=green size=5>√</font>
                                       </c:if>
									</div>
									<div class="form-group">
										<label class="control-label" for="input-password">Password</label>
										<input type="password" name="upass" value="" placeholder="Password" id="input-password" class="form-control form-item">
									</div>
									<div class="form-group">
										<label class="control-label" for="input-password">Confirm Password</label>
										<input type="password" name="reupass" value="" placeholder="Password" id="input-password" class="form-control form-item">
									</div>
									<div class="m-t-15"> 
									<input type="checkbox" name="agree" class="m-r-10" value="1"> I have read and agree to the 
									<a href="#" class="agree"><b class="color-6">Privacy Policy</b></a>                       
									<br>
								</div>
									<button type="button" onclick="allIsNull()" class="btn ht-btn bg-6 m-t-30">Register</button>
								</form>
							</div>
						</div>
					 </div>
				 </div>
			</div>
		</div>
 <%@ include file="tail.jsp" %>
  </body>
</html>