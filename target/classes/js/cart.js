$('.delete').on('click', function(){
	$(this).closest('.container-product').remove();
});

function deleteCart(productId){
	let data = {
		productId : productId
	};
	$.ajax({
		url: "/ajax/deleteCart",
		type: "post",
		contentType:"application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(jsonResult) {
			$( "#cartIndex" ).html(jsonResult.totalItems);
			total();
		},
		error: function(jqXhr, textStatus, errorMessage) {
		}
	});
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

function total(){
    var total = 0;
    $('.sub-total').each(function(){
        var subTotal = $(this).text().trim();
		subTotal = subTotal.substring(0, subTotal.length - 2);
        subTotal = subTotal.replace(/\./g, '');
        subTotal = parseInt(subTotal);
		total += subTotal;
    });
    total = nganSo(total);
    $('.total').find('span').html(total);
}
total();


function changeQuantity(productId, price, t){
	var pt = $(t).val();
    var quantity = $(t).parent().find('input').val();
	if(pt == '+'){
		quantity++;
	}
	else if(quantity > 1){
		quantity--;
	}
	$(t).parent().find('input').val(quantity);
	$(t).closest('.content').find('.sub-total ').html(nganSo(quantity * price));
	total();
	let data = {
		productId : productId,
		quantity : quantity,
	};
	
	$.ajax({
		url: "/ajax/changeQuantity",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(jsonResult) {
			$( "#cartIndex" ).html(jsonResult.totalItems);
		},
		error: function(jqXhr, textStatus, errorMessage) {
		}
	});
}


$('#checkout').on('click', function(event){
	event.preventDefault();
	var fullname = $('input[name="fullname"]').val();
	var email = $("input[name='email']").val();
	var phone = $("input[name='phonenumber']").val();
	var address = $("input[name='address']").val();
	var isEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(email);
	var isPhone = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im.test(phone);
	if(!isEmail){
		$('.email-error').html('Lỗi');
	}
	else{
		$('.email-error').html('');
	}
	if(!isPhone){
		$('.phonenumber-error').html('Lỗi');
	}
	else{
		$('.phonenumber-error').html('');
	}
	if(fullname.trim()==""){
		$('.fullname-error').html('Lỗi');
	}
	else{
		$('.fullname-error').html('');
	}
	if(address.trim() == ""){
		$('.address-error').html('Lỗi');
	}
	else{
		$('.address-error').html('');
	}
	if(isEmail && isPhone && !(fullname.trim()=="") && !(address.trim() == "")){
		message('success', 'Bạn đã mua hàng thành công');
		setTimeout(() => {
			$('#checkout-form').submit();
		}, 3000);
		
	}
})

function message(type, message){
	const messageTag = `<div class="alert alert-${type} alert-dismissible fade show message">
			            <button type="button" class="close" data-dismiss="alert">&times;</button>
			            ${message}
			        </div>`;
	$('#message').append(messageTag);
	setTimeout(() => {
		$('#message .message').css('margin-top', '120px');
		    
		}, 100);
	setTimeout(() => {
		$('#message .message').css('margin-top', '-120px');
		    
		}, 2100);
	setTimeout(() => {
		$('#message .message').remove();
	    
	}, 2999);
}