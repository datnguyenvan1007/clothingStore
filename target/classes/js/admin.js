function deleteProduct(id){
	var c = confirm('Bạn chắc chắn muốn xóa');
    if(c == true){
		$.ajax({
			url: "/admin/ajax/product/deleteProduct/" + id , //->action
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult) {
				const selector = "tr[data-id='" + jsonResult.productId + "']";
				$(selector).find('#statusProduct').html("InActive");
				alert("thành công");
			},
			error: function() {
				alert("loi");
			}
		});
    }
}

function deleteAccount(accountId, roleId){
	var c = confirm('Bạn chắc chắn muốn xóa');
    if(c == true){
		$.ajax({
			url: "/admin/ajax/account/deleteAccount/" + accountId + "/" + roleId, //->action
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult) {
				const selector = "tr[data-id='" + jsonResult.accountId + "']";
				$(selector).remove();
				alert("thành công");
			},
			error: function() {
				alert("loi");
			}
		});
    }
}

//detele category
function deleteCategory(id){
	var c = confirm('Bạn chắc chắn muốn xóa');
    if(c == true){
		$.ajax({
			url: "/admin/ajax/category/deleteCategory/" + id , //->action
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult) {
				const selector = "tr[data-id='" + jsonResult.categoryId + "']";
				$(selector).find('#statusCategory').html("InActive");
				alert("thành công");
			},
			error: function() {
				alert("loi");
			}
		});
    }
}

//delete saleorder
function deleteSaleOrder(id){
	var c = confirm('Bạn chắc chắn muốn xóa');
    if(c == true){
		$.ajax({
			url: "/admin/ajax/saleorder/deleteSaleOrder/" + id , //->action
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult) {
				const selector = "tr[data-id='" + jsonResult.saleorderId + "']";
				$(selector).find('#statusSaleOrder').html("InActive");
				alert("thành công");
			},
			error: function() {
				alert("loi");
			}
		});
    }
}

//delete contact
function deleteContact(id){
	var c = confirm('Bạn chắc chắn muốn xóa');
    if(c == true){
		$.ajax({
			url: "/admin/ajax/contact/deleteContact/" + id , //->action
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult) {
				const selector = "tr[data-id='" + jsonResult.contactId + "']";
				$(selector).remove();
			},
			error: function() {
				alert("loi");
			}
		});
    }
}



function nganSo(x){
    x = x.toString();
    var a = new Array();
    var dem = 0;
    for(let i = (x.length - 1); i >= 0; i--){
        if(dem == 3){
            a.push('.');
            dem = 0;
        }
        dem++;
        a.push(x[i]);
    }
    a.reverse();
    var y = "";
    for(let i = 0; i < a.length; i++){
        y += a[i];
    }
	y += ' đ';
    return y;
}




/**Detail SaleOrder */
function detail(id){
	$.ajax({
		url: "/admin/ajax/detailSaleOrder/" + id,
		type: "POST",
		contentType: "application/json",
		success: function(jsonResult){
			$('#detailSaleOrder').html('');
			var i = 1;
			for(let item of jsonResult){
				let price = nganSo(item['price']);
				let detail = `
					<tr>
						<td>${i}</td>
						<td>
							<img src="/upload/${item['path']}" width="100" height="100">
						</td>
						<td>${item['name']}</td>
						<td>${item['quantity']}</td>
						<td>${price}</td>
					</tr>
				`;
				i++;
				$('#detailSaleOrder').append(detail);
			}
		},
		error: function(){
			alert('loi');
		}
	});
}




