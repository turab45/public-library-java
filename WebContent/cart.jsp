<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart | Public Library</title>
    
    <jsp:include page="allCss.jsp" />
    
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	<header id="header"><!--header-->
		<jsp:include page="navbar.jsp" />
	</header><!--/header-->

	<section id="cart_items">
		<div class="container">
			<div class="breadcrumbs">
				<ol class="breadcrumb">
				  <li><a href="#">Home</a></li>
				  <li class="active">Shopping Cart</li>
				</ol>
			</div>
			<div class="table-responsive cart_info">
				<table class="table table-condensed">
					<thead>
						<tr class="cart_menu">
							<td class="image">Item</td>
							<td class="description"></td>
							<td class="price">Price</td>
							<td class="quantity">Quantity</td>
							<td class="total">Total</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<tr class='cart_books'>
							<td class="cart_product">
								<a href=""><img src="images/cart/one.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>Rs: 59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="number" name="quantity" value="1" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total" style="width: 150px">
								<p class="cart_total_price">Rs: 59</p>
							</td>
							<td class="cart_delete">
								<button class="btn-danger cart-delete" href=""><i class="fa fa-times"></i></button>
							</td>
						</tr>

						<tr class='cart_books'>
							<td class="cart_product">
								<a href=""><img src="images/cart/two.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>Rs: 59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									
									<input class="cart_quantity_input" type="number" name="quantity" value="1" autocomplete="off" size="2">
									
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">Rs: 59</p>
							</td>
							<td class="cart_delete">
								<a class="cart_quantity_delete" href=""><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr class='cart_books'>
							<td class="cart_product">
								<a href=""><img src="images/cart/three.png" alt=""></a>
							</td>
							<td class="cart_description">
								<h4><a href="">Colorblock Scuba</a></h4>
								<p>Web ID: 1089772</p>
							</td>
							<td class="cart_price">
								<p>Rs: 59</p>
							</td>
							<td class="cart_quantity">
								<div class="cart_quantity_button">
									<input class="cart_quantity_input" type="number" name="quantity" value="1" autocomplete="off" size="2">
								</div>
							</td>
							<td class="cart_total">
								<p class="cart_total_price">Rs: 59</p>
							</td>
							<td class="cart_delete">
								<button class="btn-danger cart-delete" href=""><i class="fa fa-times"></i></button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section> <!--/#cart_items-->

	<section id="do_action">
		<div class="container">
			<div class="heading">
				<h3>Checkout here.</h3>
			</div>
			<div class="row">
				
				<div class="col-sm-12">
					<div class="total_area">
						<ul>
							<li class="cart_sub_total">Cart Sub Total <span>Rs: 59</span></li>
							<li class="cart_tax">Eco Tax <span>Rs: 10</span></li>
							<li class="cart_shipping_cost">Shipping Cost <span>Rs: 10</span></li>
							<li class="cart_final_total">Total <span>Rs: 61</span></li>
						</ul>
							<a class="btn btn-default update" href="">Update</a>
							<a class="btn btn-default check_out" href="">Check Out</a>
					</div>
				</div>
			</div>
		</div>
	</section><!--/#do_action-->

	<footer id="footer"><!--Footer-->
		<jsp:include page="footer.jsp"></jsp:include>
		
	</footer><!--/Footer-->
	


    <script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
   
    
<script type="text/javascript">

$(document).ready(function(){
	upgradeTotal();

	function upgradeTotal(){
		var total = 0;
		var allCartItems = $('.cart_books');
		
		for(var i=0; i<allCartItems.length; i++){
			var cart_price = parseFloat(document.getElementsByClassName('cart_books')[0].getElementsByClassName('cart_total_price')[0].innerText.replace('Rs:','').trim());
			total = total+cart_price;
		}

		document.getElementsByClassName('cart_sub_total')[0].firstElementChild.innerText = "Rs: "+total;
		document.getElementsByClassName('cart_tax')[0].firstElementChild.innerText = "Rs: 10";
		document.getElementsByClassName('cart_shipping_cost')[0].firstElementChild.innerText = "Rs: 10";
		document.getElementsByClassName('cart_final_total')[0].firstElementChild.innerText = "Rs: "+(total+10+10);
		console.log(total)
	}

	
		$(document).on('change', '.cart_quantity_input', function(){
			console.log(this.parentElement.parentElement.parentElement)
			var parentElement = this.parentElement.parentElement.parentElement;
			var value = $('.cart_quantity_input').val();
			
			//console.log(cart_price);
			
			if (value <=0) {
				$('.cart_quantity_input').val("1")
			}else{
				
				var cart_price = parseFloat(parentElement.children.item(2).innerText.replace('Rs:','').trim());
				
				//var cart_total = parseFloat(parentElement.children.item(4).innerText.replace('Rs:','').trim());
				
				
				
				var quantity = parseFloat(value);
				console.log(parentElement.children.item(4).firstElementChild);
				parentElement.children.item(4).firstElementChild.innerText = "Rs: "+(quantity * cart_price);

				upgradeTotal();
			}
		});	
	

	$(document).on('click','.cart-delete', function(){

		console.log('Delete button clicked...');
		this.parentNode.parentNode.remove();
		upgradeTotal();
		});
});
</script>
</body>
</html>