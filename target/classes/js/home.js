$('.product-quantity button').on('click', function(){
    var pt = $(this).val();
    var sl = $(this).parent().find('input').val();
    if(pt == '+'){
        sl++;
    }
    else{
        if(sl > 1)
            sl--;
    }
    $(this).parent().find('input').val(sl);
});

$('.search').on('click', function(){
    $('.search-bar').css('margin-right', 0);
});

$('.close').on('click', function(){
    $('.search-bar').css('margin-right', '-500px');
});

$('#key-search').on('keyup', function(){
	var key = $('#key-search').val();
	key = key.trim();
	$('#search-content').html('');
	if(key != ''){
		$.ajax({
			url: "/ajax/search/" + key,
			type: "POST",
			contentType: "application/json",
			success: function(jsonResult){
				$('#search-content').html('');
				if(jsonResult != ""){
					for(let item of jsonResult){
						let price = nganSo(item['price']);
						let tag = `
							<div class="search-product">
				                <div class="search-content">
				                    <a href="/product_info/${item['seo']}">
										<div>
					                        ${item['title']}
					                    </div>
					                    <div>${price}</div>
									</a>
				                </div>
				                <div class="search-img">
				                    <img src="/upload/${item['path']}" alt="" width="100%">
				                </div>
				            </div>
						`;
						$('#search-content').append(tag);
					}
				}
			},
			error: function(){
				alert('loi');
			}
		});
	}
})
/** 
if(jsonResult != ""){
	$('#search-content').html('');
	for(let item of jsonResult){
		let tag = `
			<div class="search-product">
                <div class="search-content">
                    <div>
                        ${item['title']}
                    </div>
                    <div></div>
                </div>
                <div class="search-img">
                    <img src="/upload/${item['path']}" alt="" width="100%">
                </div>
            </div>
		`;
		$('#search-content').append(tag);
	}
}

*/
function cart(productId, productQuantity){
	productQuantity = parseInt(productQuantity);
	let data = {
		productId : productId,
		quantity: productQuantity,
	};
	$.ajax({
		url: "/ajax/cart",
		type: "post",
		contentType:"application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(jsonResult) {
			$( "#cartIndex" ).html(jsonResult.totalItems);
			$([document.documentElement, document.body]).animate({
			    scrollTop: 0
			}, 200);
		},
		error: function(jqXhr, textStatus, errorMessage) {
		}
	});
}

function productInfoToCart(productId, t){
	productQuantity = parseInt($(t).closest('.right-info').find('.product-quantity input').val());
	let data = {
		productId : productId,
		quantity: productQuantity,
	};
	$.ajax({
		url: "/ajax/cart",
		type: "post",
		contentType:"application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(jsonResult) {
			$( "#cartIndex" ).html(jsonResult.totalItems);
			$([document.documentElement, document.body]).animate({
			    scrollTop: 0
			}, 200);
		},
		error: function(jqXhr, textStatus, errorMessage) {
		}
	});
}
/**
contact
 */

$(document).on('click','#contact', function(){
	var email = $(this).parent().parent().find('input').val();
	var isEmail = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/.test(email);
	if(!isEmail){
		const m = `Email bạn nhập không đúng`;
		message('danger', m);
		return;
	}
	let data = {
		email : email	
	};
	$(this).parent().parent().find('input').val('');
	$.ajax({
		url: "/ajax/contact",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(){
			const m = `
				Cảm ơn bạn đã liên hệ với chúng tôi <br>
				Chúng tôi sẽ liên hệ sớm nhất cho bạn
			`;
			message('success', m);
		},
		error: function(){
			alert("loi");
		}
	});
});

$('#register').on('click', function(){
	var fullname = $(this).closest('#form-register').find('input[name="fullname"]').val();
	var username = $(this).closest('#form-register').find('input[name="username"]').val();
	var password = $(this).closest('#form-register').find('input[name="password"]').val();
	var email = $(this).closest('#form-register').find('input[name="email"]').val();
	let data = {
		fullname : fullname,
		username : username,
		password : password,
		email : email	
	};
	$.ajax({
		url: "/ajax/register",
		type: "post",
		contentType: "application/json",
		data: JSON.stringify(data),
		dataType: "json",
		success: function(){
			$(this).closest('#form-register').find('input[name="password"]').val('');
			$(this).closest('#form-register').find('input[name="username"]').val('');
			$(this).closest('#form-register').find('input[name="fullname"]').val('');
			$(this).closest('#form-register').find('input[name="email"]').val('');
			const m = `
				Bạn đã đăng ký thành công
			`;
			message('success', m);
		},
		error: function(){
			alert("loi");
		}
	});
});


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
		    
		}, 2000);
	setTimeout(() => {
		$('#message .message').remove();
	    
	}, 2500);
}

/*
$('#register').on('click', function(event){
	event.preventDefault();
	$("#form-register").validate({
		onfocusout: true,
		onkeyup: true,
		onclick: false,
		rules: {
			"fullname": {
				required: true
			},
			"username":{
				required: true
			},
			"password": {
				required: true,
			},
			"email": {
				required: true
			}
			
		},
		messages: {
			"fullname": {
				required: "Lỗi",
			},
			"username": {
				required: "Lỗi",
			},
			"password": {
				required: "Lỗi",
			},
			"email": {
				required: "Lỗi",
			}
		}
	});
	message('success', 'Bạn đã đăng ký thành công');
	$('#form-register').submit();
})
*/
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


$('.sub-img').on('click', function(){
	var src = $(this).attr('src');
	$('.main-img').attr('src', src);
	
})
