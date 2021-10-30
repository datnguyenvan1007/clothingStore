<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Quản lý hóa đơn</title>
    <jsp:include page="/WEB-INF/views/administrator/layout/lib.jsp"></jsp:include>
    <link href="${pageContext.servletContext.contextPath}/css/admin.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid">
                    <div class="card mb-4 mt-5">
                        <div class="card-header">
                            <i class="fas fa-table mr-1"></i>
                            Data Table Products
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Code</th>
                                            <th>Fullname</th>
                                            <th>Phone Number</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Created Date</th>
                                            <th>Status</th>
                                            <th>TotalPrice</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${saleorder }" var="item" varStatus="loop">
                                        	<tr data-id = ${item.id }>
	                                            <td>${loop.index + 1 }</td>
	                                            <td>${item.code }</td>
	                                            <td>${item.customerName }</td>
	                                            <td>${item.customerPhone }</td>
	                                            <td>${item.customerEmail }</td>
	                                            <td>${item.customerAddress }</td>
	                                            <td>${item.createdDate }</td>
	                                            <td id="statusSaleOrder">
	                                            	<c:choose>
	                                            		<c:when test="${item.status == true }">
	                                            			Active
	                                            		</c:when>
	                                            		<c:otherwise>
	                                            			InActive
	                                            		</c:otherwise>
	                                            	</c:choose>
	                                            </td>
	                                            <td>
	                                            	<fmt:setLocale value="vi_VN" scope="session" />
													<fmt:formatNumber value="${item.total }" type="currency" />
	                                            </td>
	                                            <td>
	                                            	<div class="d-flex">
	                                            		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="detail(${item.id})">Detail</button>
	                                            		<button type="button" class="btn btn-danger ml-1" onclick="deleteSaleOrder(${item.id})">Delete</button>
	                                            	</div>
	                                            </td>
	                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                    
                                   </table>
                               </div>
                           </div>
                       </div>
                       
                       <div class="modal fade" id="myModal">
					    	<div class="modal-dialog modal-dialog-centered">
						      <div class="modal-content">
						      
						        <!-- Modal Header -->
						        <div class="modal-header">
						          <h4 class="modal-title">Detail SaleOrder</h4>
						          <button type="button" class="close" data-dismiss="modal">&times;</button>
						        </div>
						        
						        <!-- Modal body -->
						        <div class="modal-body">
						          <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                            <th>#</th>
	                                            <th>Image</th>
	                                            <th>Product Name</th>
	                                            <th>Product Quantity</th>
	                                            <th>Product Price</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="detailSaleOrder">
	                                    </tbody>
	                                   </table>
	                               </div>
						        </div>
				      		</div>
					    </div>
					  </div>
                       
                   </div>
               </main>
           </div>
       </div>
</body>
<script src="${pageContext.servletContext.contextPath}/js/admin.js"></script>
</html>
