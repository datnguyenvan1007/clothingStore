<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- taglib SPRING-FORM -->
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Static Navigation - SB Admin</title>
    <jsp:include page="/WEB-INF/views/administrator/layout/lib.jsp"></jsp:include>
	
    <link href="${base }/css/admin.css" rel="stylesheet" />
</head>

<body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/views/administrator/layout/header.jsp"></jsp:include>
    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/views/administrator/layout/sidebar.jsp"></jsp:include>
        <div id="layoutSidenav_content">
            <main>
	             <section class="row" style="width: 1200px;">
	                 <div class="col mt-4">
	                     <sf:form action="${base }/admin/product/addOrUpdateProduct" method="POST" modelAttribute="addProduct" enctype="multipart/form-data" class="col-sm-12" id="form-1">
	                     	<sf:hidden path="id"/>
	                         <div class="card mb-4">
	                             <div class="card-header">
	                                 <h2>Add New Product</h2>
	                             </div>
	                             <div class="card-body">
	                                 <div class="row">
	                                     <div class="col-7">
	                                         <div class="form-group">
	                                             <label for="name">Name Product: </label>
	                                             <sf:input type="text" class="form-control" name="name"
	                                                 id="name-product" aria-describedby="name" placeholder="" path="title" ></sf:input>
	                                             <span class="form-message" id="error_name_product"
	                                                 style="color: red;"></span>
	                                         </div>
	                                         <div class="form-group">
	                                             <label for="category">Category</label>
	                                             <sf:select path="categories.id" class="form-control" id="category" name="category">
													<sf:options items="${categories}" itemValue="id" itemLabel="name" />
												</sf:select>
	                                         </div>
	                                         <div class="form-group">
	                                             <label for="status">Status</label>
	                                             <sf:select class="form-control" name="status" id="status" path="status">
	                                             	<sf:option value="1">Active</sf:option>
	                                                <sf:option value="0">InActive</sf:option>
	                                             </sf:select>
	                                         </div>
	                                         
	                                         <div>
	                                         	<label for="price">Price</label>
	                                          <div class="input-group form-group">
	                                              <sf:input type="number" class="form-control" name="price"
	                                                  id="price" aria-describedby="price" placeholder="" path="price"></sf:input>
	                                              <span class="input-group-text input-group-append">đ</span>
	                                              <span class="form-message" id="error_price_product"
	                                                  style="color: red;"></span>
	                                          </div>
							
												<label for="priceSale">Price Sales</label>
												<div class="input-group form-group">
	                                              <sf:input type="number" class="form-control" name="priceSale"
	                                                  id="priceSale" aria-describedby="priceSale" placeholder="" path="priceSale"></sf:input>
	                                              <span class="input-group-text input-group-append">đ</span>
	                                              <span class="form-message" id="error_price_product"
	                                                  style="color: red;"></span>
	                                          </div>
	                                         </div>
	                                     </div>
	                                     <div class="col-3">
	                                         <div class="form-group">
	                                             <label for="productAvatar">Avatar: </label>
	                                             <input type="file" class="form-control-file" name="productAvatar" id="productAvatar"></input>
	                                         </div>
	                                         <div class="form-group">
	                                             <label for="productPicture">Pictures: </label>
	                                             <input type="file" class="form-control-file" name="productPictures" id="productPictures" multiple="multiple"></input>
	                                         </div>
	                                         
	                                         
	                                     </div>
	                                     <div class="col-3">
	                                         <div class="form-check">
	                                         	<label class="form-check-lable">
	                                         		<sf:radiobutton name="hotNew" class="form-check-input" path="isHotNew" value="1"/>
	                                         		Hot
	                                         	</label>
	                                         </div>
	                                         <div class="form-check">
	                                         	<label class="form-check-lable">
	                                         		<sf:radiobutton name="hotNew" class="form-check-input" path="isHotNew" value="2"/>
	                                         		New
	                                         	</label>
	                                         </div>
	                                     </div>
	                                 </div>
	                                 <div class="row">
	                                     <div class="col">
	                                         <div class="form-group">
	                                             <label for="shortDescription">Short Description</label>
	                                             <sf:textarea class="form-control" name="shortDescription" id="shortDescription"
	                                                 rows="5" path="shortDescription"></sf:textarea>
	                                             <span class="form-message" id="errorshortDescription"
	                                                 style="color: red;"></span>
	                                         </div>
	                                     </div>
	                                 </div>
									<div class="row">
	                                     <div class="col">
	                                         <div class="form-group">
	                                             <label for="detailDescription">Detail Description</label>
	                                             <sf:textarea class="form-control" name="detailDescription" id="detailDescription" path="detailDescription"></sf:textarea>
	                                             <span class="form-message" id="errordetailDescription"
	                                                 style="color: red;"></span>
	                                         </div>
	                                     </div>
	                                 </div>
	                             </div>
	                             <div class="card-footer text-muted">
	                             	<a href="${pageContext.servletContext.contextPath}/admin/product/addOrUpdateProduct" class="btn btn-success">New</a>
	                                 <button class="btn btn-primary" type="submit">Save</button>
	                             </div>
	                         </div>
	                     </sf:form>
	                 </div>
	             </section>
	         </main>
	    </div>
	</div>
</body>
<script>
   $(document).ready(function() {
       $('#detailDescription').summernote({
    	   height: 200
       });
   });
 </script>
</html>