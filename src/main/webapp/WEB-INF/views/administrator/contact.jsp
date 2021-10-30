<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<title>Quản lý Liên Hệ</title>
	<jsp:include page="/WEB-INF/views/administrator/layout/lib.jsp"></jsp:include>
	<link href="${base }/css/admin.css" rel="stylesheet" />
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
                         Data Table Contacts
                     </div>
                     <div class="card-body">
                         <div class="table-responsive">
                             <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                 <thead>
                                     <tr>
                                     	<th>#</th>
                                         <th>Email</th>
                                         <th>Created Date</th>
                                         <th>Action</th>
                                     </tr>
                                 </thead>
                                 
                                 <tbody>
                                 
                                 	<c:forEach var="item" items="${contact }" varStatus="loop">
                                 		<tr data-id = ${item.id }>
                                         	<td>${loop.index + 1 }</td>
                                         	<td>${item.email }</td>
                                         	<td>${item.createdDate }</td>
                                           <td> 
                                           		<a href="#" class="btn btn-primary">Trả Lời</a>
                                               <button type="button" class="btn btn-danger" onclick="deleteContact(${item.id})">Delete</button> 
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
<script src="${pageContext.servletContext.contextPath}/js/admin.js"></script>
</html>