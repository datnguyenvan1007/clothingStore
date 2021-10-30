<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Quản Lý Sản Phẩm</title>
        
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
	                        	<div class="d-flex justify-content-between mt-4 mb-4"> 
	                        		<a href="${pageContext.servletContext.contextPath}/admin/category/addOrUpdateCategory" class="btn btn-success">Add new</a>
		                         	<form class="form-inline" action="${base }/admin/category" method="GET">
										<div class="d-flex flex-row input-group">
											<!-- dữ liệu để thực hiện tìm kiếm sản phẩm -->
											<input type="hidden" id="page" name="page">
											<input type="text" id="keyword" name="keyword" class="form-control" placeholder="Search" value="${searchModel.keyword }">
											<div class="input-group-append">
								                 <button class="btn btn-primary" type="submit" id="btnSearch" name="btnSearch" value="Search"><i class="fas fa-search"></i></button>
								            </div>
										</div>
									</form>
	                        	</div>
	                            <div class="table-responsive">
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <thead>
	                                        <tr>
	                                        	<th>#</th>
	                                            <th>Category</th>
	                                            <th>Status</th>
	                                            <th>Update</th>
	                                        </tr>
	                                    </thead>
	                                    
	                                    <tbody>
	                                    
	                                    	<c:forEach var="item" items="${categoryWithPaging.data }" varStatus="loop">
	                                    		<tr data-id = ${item.id }>
	                                            	<td>${loop.index + 1 }</td>
	                                            	<td>${item.name }</td>
	                                            	<td id="statusCategory">
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
		                                             	<a type="button" class="btn btn-primary"
		                                                     href="${pageContext.servletContext.contextPath}/admin/category/addOrUpdateCategory/${item.id}">Update</a>
		                                                 <button type="button" class="btn btn-danger" onclick="deleteCategory(${item.id})">Delete</button> 
		                                             </td>
	
	                                        	</tr>
	                                    	</c:forEach>
	                                        
	                                    </tbody>
	                                </table>
	                            </div>
	                       	</div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="${base}/js/admin.js"></script>
</html>
