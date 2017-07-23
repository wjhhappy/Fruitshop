<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Items"%>
<%@ page import="dao.ItemsDAO"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<base href="<%=basePath%>">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="pragma" content="no-cache">
	    <meta http-equiv="cache-control" content="no-cache">
	     <meta http-equiv="expires" content="0">    
	    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	     <meta http-equiv="description" content="This is my page">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Product detail</title>
		<link href="css/main.css" rel="stylesheet" type="text/css">
	    <script type="text/javascript" src="js/lhgcore.js"></script>
       <script type="text/javascript" src="js/lhgdialog.js"></script>
       <script type="text/javascript">
      function selflog_show(id)
      { 
         var num =  document.getElementById("number").value; 
         J.dialog.get({id: 'haoyue_creat',title: '购物成功',width: 600,height:400, link: '<%=path%>/servlet/CartServlet?id='+id+'&num='+num+'&action=add', cover:true});
      }
      function add()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num<100)
         {
            document.getElementById("number").value = ++num;
         }
      }
      function sub()
      {
         var num = parseInt(document.getElementById("number").value);
         if(num>1)
         {
            document.getElementById("number").value = --num;
         }
      }
     
    </script>	
  </head>
  
  <body>
<%@ include file="header.jsp" %>
		<div class="heading-inner-page">
			<div class="container">
				<h2>Product detail</h2>
				<ul class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="product.jsp">Product</a></li>
					<li>Product detail</li>
				</ul>
			</div>
		</div>
		<!-- Product -->
		<% 
             ItemsDAO itemDao = new ItemsDAO();
             Items item = itemDao.getItemsById(Integer.parseInt(request.getParameter("id")));
             if(item!=null)
             {
          %>
		<section class="m-t-30"> 
			<div class="container">
					<div class="row">
						<!-- Product image gallery -->
						<div class="col-sm-6 col-md-7">
							<ul class="thumbnails p-0">
								<li>
									<a class="thumbnail img-large image-zoom" href="images/tupian/<%=item.getPicture()%>" title="iPhone">
										<img src="images/tupian/<%=item.getPicture()%>" alt="iPhone">
									</a>
								</li>
								
							</ul>
						</div>
						<!-- Product decr -->
						<div class="col-sm-6 col-md-5">
							<div class="product-pare m-t-xs-60">
								<h1><%=item.getName() %></h1>
								<ul class="list-unstyled m-b-20">
									<li><span>Fruit size:</span><%=item.getSize() %></li>
									<li><span>Matures:</span><%=item.getMatures() %></li>
									<li><span>City:</span><%=item.getCity() %></li>
									<li><span>Type:</span><%=item.getType() %></li>
								</ul>
								<p><%=item.getIntroduce() %></p>
								<p class="product-price">$<%=item.getPrice() %></p>

									<span id="sub" onclick="sub();">-</span><input type="text" id="number" name="number" value="1" size="2"/><span id="add" onclick="add();">+</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<% 
								//User u=(User)session.getAttribute("user");
								if(session.getAttribute("user")!=null){
			                     	%>
									<a href="javascript:selflog_show(<%=item.getId()%>)" class="btn ht-btn bg-3 m-t-0" >Add to Cart</a>
									<% 
								}else{
								
								%>
								<a href="login.jsp" class="btn ht-btn bg-3 m-t-0" >Add to Cart</a>
								<% 
								}
							%>
								
							</div>
						</div>
					</div><!-- End row -->
				<!-- Tabs -->
				<% 
            }
          %>
					
		<!-- Product relaed -->
		
						
		<!-- Process order -->
		<div style="height:400px"></div>
		<!-- Footer -->
		  <%@ include file="tail.jsp" %>
	</body>
</html>
