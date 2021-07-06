if(document.readyState == 'loading'){
	document.addEventListener('DOMContentLoaded', ready);
}else{
	ready();
}


function ready(){
	
	var addToCartButtons = document.getElementsByClassName('add-to-cart');
	console.log(addToCartButtons);
	
	for (var i = 0; i < addToCartButtons.length; i++) {
		var button = addToCartButtons[i];
		button.addEventListener('click', addToCartClicked);
	}
	
}


function addToCartClicked(event){
	var button = event.target;
	console.log(button.parentElement)
	var bookImg = button.parentElement.getElementsByClassName('book-image')[0].src;
	var bookTitle = button.parentElement.getElementsByClassName('book-title')[0].innerText;
	var bookRent = button.parentElement.getElementsByClassName('book-rent')[0].innerText;
	
	var localSt = localStorage.getItem('cart-books');
	var book = {
			'bookImg':bookImg,
			'bookTitle':bookTitle,
			'bookRent':bookRent
	}
	
	if(localSt == null){
		var books = [];
		
		books.push(book);
		
		localStorage.setItem('cart-books', JSON.stringify(books));
	}else{
		var books = JSON.parse(localStorage.getItem('cart-books'));
		books.push(book);
		
		localStorage.setItem('cart-books', JSON.stringify(books));
	}
	
}