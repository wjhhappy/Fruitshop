<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Items"%>
<%@ page import="entity.Cart"%>
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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Cart</title>
<link type="text/css" rel="stylesheet" href="css/style1.css" />
	 <script language="javascript">
	    function delcfm() {
	        if (!confirm("确认要删除？")) {
	            window.event.returnValue = false;
	        }
	    }
   </script>	
  </head>
  
  <body>
   <%@ include file="header.jsp" %>
   
    <div class="heading-inner-page">
			<div class="container">
				<h2>Cart</h2>
				<ul class="breadcrumb">
					<li><a href="index.jsp">Home</a></li>
					<li>Cart</li>
				</ul>
			</div>
		</div>
		<div style="height:40px"></div>
	<div id="shopping">
   <form action="" method="">		
			<table>
				<tr>
					<th>Name</th>
					<th>Unit Price</th>
					<th>Number</th>
					<th>Price</th>
					<th>operation</th>
				</tr>
				<% 
				   //首先判断session中是否有购物车对象
				   if(request.getSession().getAttribute("cart")!=null)
				   {
				%>
				<!-- 循环的开始 -->
				     <% 
				         Cart cart = (Cart)request.getSession().getAttribute("cart");
				         HashMap<Items,Integer> goods = cart.getGoods();
				         Set<Items> items = goods.keySet();
				         Iterator<Items> it = items.iterator();
				         
				         while(it.hasNext())
				         {
				            Items i = it.next();
				     %> 
				<tr name="products" id="product_id_1">
					<td class="thumb"><img style="width: 100px;height: 100px" src="images/tupian/<%=i.getPicture()%>" /><a href=""><%=i.getName()%></a></td>
					<td class="number"><%=i.getPrice() %></td>
					<td class="number">
                     	<%=goods.get(i)%>					
					</td>
					<td class="price" id="price_id_1">
						<span><%=i.getPrice()*goods.get(i) %></span>
						<input type="hidden" value="" />
					</td>                        
                    <td class="delete">
					  <a href="servlet/CartServlet?action=delete&id=<%=i.getId()%>" onclick="delcfm();">delete</a>					                  
					</td>
				</tr>
				     <% 
				         }
				     %>
				<!--循环的结束-->
				
			</table>
			 <div class="total"><span style="font-size: 20px" id="total">Total:$<%=cart.getTotalPrice() %></span></div>
			  <% 
			    }
			 %>
			
		</form>
	</div>	
	
 <%@ include file="tail.jsp" %>
  </body>
</html>