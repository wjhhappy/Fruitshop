<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Login</title>
	<script type="text/javascript">
    //注册时检查输入项
    function allIsNull(){
    var name=document.loginForm.uname.value;
    var pwd=document.loginForm.upass.value;
    if(name==""){
    alert("请输入姓名!");
    document.loginForm.uname.focus();
    return false;
    }
    if(pwd==""){
    alert("请输入密码!");
    document.loginForm.upass.focus();
    return false;
    }
    document.loginForm.submit();
    return true;
    } 
    </script>	
  </head>
  
  <body>
   <%@ include file="header.jsp" %>
   <div class="heading-inner-page">
			<div class="container">
				<h2>Login</h2>
				<ul class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li>Login</li>
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
								<form action="login" method="post" name="loginForm">
									<div class="form-group">
										<label class="control-label" for="input-email">Name</label>
										<input type="text" name="uname" value="" placeholder="Name" id="input-email" class="form-control form-item">
									</div>
									<div class="form-group m-t-30">
										<label class="control-label" for="input-password">Password</label>
										<input type="password" name="upass" value="" placeholder="Password" id="input-password" class="form-control form-item">
										<a class="m-b-30" href="register.jsp">Register</a>
									</div>
									<button type="button" onclick="allIsNull()" class="btn ht-btn bg-6">Login</button>
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
