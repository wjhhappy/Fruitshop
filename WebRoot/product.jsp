<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="entity.Items"%>
<%@ page import="dao.ItemsDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Product</title>
		
  </head>
  
  <body>
   <%@ include file="header.jsp" %>
   <div style="height:40px"></div>
   <!-- 商品循环开始 -->
           <%
                 ItemsDAO itemsDao = new ItemsDAO(); 
                 String  type=(String)session.getAttribute("type");
                 ArrayList<Items> list = itemsDao.getAllItems(type);
         
               if(list!=null&&list.size()>0)
               {
	               for(int i=0;i<list.size();i++)
	               {
	                  Items item = list.get(i);
           %>   
           
<div class="col-sm-6 col-md-4 col-lg-3">
							<!-- Product item -->
							<div class="product-item border-green">
								<a href="product_detail.jsp?id=<%=item.getId()%>">
									<img src="images/tupian/<%=item.getPicture()%>" alt="image">
								</a>
								<div class="product-caption">
									<h4 class="product-name">
										<a href="product_detail.jsp?id=<%=item.getId()%>"><%=item.getName() %></a>
									</h4>
									<div class="product-price-group">
										<span class="product-price">$ <%=item.getPrice() %></span>
									</div>
								</div>
							</div>
						</div>
  <%
                   }
              } 
          %>
          <div style="height:40px"></div>
  <%@ include file="tail.jsp" %>
</body>
</html>