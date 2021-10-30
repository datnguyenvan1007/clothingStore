<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
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
    <link href="${base }/css/admin.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                </div>
            </div>
            <div id="layoutSidenav_content">
                <main class="container">
                    <section class="row" style="width: 1200px;">
                        <div class="col mt-4">
                            <sf:form action="/admin/category/addOrUpdateCategory" method="POST" modelAttribute="category" class="col-sm-12" id="form-1">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <h2>Add New Category</h2>
                                    </div>
                                    <div class="card-body"  >
                                        <div class="row col-12" style="justify-content: center;">
                                            <div class="col-7">
                                                <div class="form-group">
                                                    <label for="moTa">Category: </label>
                                                    <sf:input type="text" class="form-control" name="nameCategory" id="nameCategory" path="name"></sf:input>
                                                    <span class="form-message" id="error_name_cate" style="color: red;"></span>
                                                </div>
                                            </div>
                                            <div class="col-3">
                                                <div class="form-group">
                                                    <label for="moTa">Status </label>
                                                    <sf:select class="form-control" name="status" id="status" path="status">
		                                             	<sf:option value="1">Active</sf:option>
		                                                <sf:option value="0">InActive</sf:option>
		                                             </sf:select>
                                                </div>
                                            </div>
                                            <!-- 
                                            <div class="col-3">
                                                <label for="cate">cate</label>
                                                <select name="cate" id="cate" class="form-control">
                                                	<option value="0" selected="selected"></option>
                                                	<c:forEach var="item" items="${categories}" varStatus="loop">
                                                     <option value="${item.id }">${item.name }</option>
                                                	</c:forEach>
                                               	</select>
                                            </div>-->
                                        </div> 
                                    </div>
                                    <div class="card-footer text-muted">
                                        <a class="btn btn-success" href="${base }/admin/category/addOrUpdateCategory">New</a>
                                        <button type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </div>
                            </sf:form>
                        </div>
                    </section>
                </main>
            </div>
        </div>
    </div>
</body>

<script type="text/javascript">
/**
 * $(document).on('change', '#cate', function(){
		var add = `
			<div class="row" style="justify-content: center;">
	            <div class="col-7">
	                <div class="form-group">
	                    <label for="moTa">Category: </label>
	                    <input type="text" class="form-control" name="nameCategory1" id="nameCategory1" path="name">
	                    <span class="form-message" id="error_name_cate" style="color: red;"></span>
	                </div>
	            </div>
	            <div class="col-3">
	                <label for="cate1">cate1</label>
	                <select name="cate" id="cate1" class="form-control">
	                	<option value="0"></option>
	                	<c:forEach var="item" items="${categories}" varStatus="loop">
	                     <option value="${item.id }">${item.name }</option>
	                	</c:forEach>
	               	</select>
	            </div>
	        </div>
		`;
		var value = $(this).val();
        var name = $('#cate :selected').text();
        var cate = $('#nameCategory').val();
        console.log(cate);
        $('#nameCategory').val(name.trim());
        if(value != 0){
            if(cate == '')
                $('.card-body').append(add);
        }
        else{
        	$('.card-body').children('div:last-child').remove();
        }
	});
 */
	
</script>
</html>
