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
        <title>Quản lý khách hàng</title>
        
        <jsp:include page="/WEB-INF/views/administrator/layout/lib.jsp"></jsp:include>
        <link href="${base}/css/admin.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        
                        <div class="row">
                            <div class="card mb-4 mt-4">
                                <div class="card-header">
                                    <i class="fas fa-table mr-1"></i>
                                    Data Table Staff Account
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Fullname</th>
                                                    <th>Username</th>
                                                    <th>Email</th>
                                                    <th>Edit</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            	<c:forEach items="${users }" var="item" varStatus="loop">
                                            		<tr>
	                                                    <td>${loop.index + 1 }</td>
	                                                    <td>${item.fullname }</td>
	                                                    <td>${item.username }</td>
	                                                    <td>${item.email }</td>
	                                                    <td> 
	                                                        <div class="d-flex">
	                                                        	<a type="button" class="btn btn-primary" href="${base }/admin/account/addAccount/${item.id}/${roleId }">Update</a>
	                                                        	<button type="button" class="btn btn-danger remove ml-1" onclick="deleteAccount(${item.id}, ${roleId })">Delete</button>
	                                                        </div>
	                                                    </td>
	                                                </tr>
                                            	</c:forEach>                                       
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <script src="${base}/js/admin.js"></script>
    </body>
</html>
