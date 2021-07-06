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
	
	var bookId = parseFloat(button.dataset['id']);
	
	console.log(bookId)
	
	var bookImg = button.parentElement.getElementsByClassName('book-image')[0].src;
	var bookTitle = button.parentElement.getElementsByClassName('book-title')[0].innerText;
	var bookRent = button.parentElement.getElementsByClassName('book-rent')[0].innerText;
	
	var localSt = localStorage.getItem('cart-books');
	
	
	if(localSt == null){
		
		console.log('Cart is null, creating new cart...');
		var books = [];
		
		var book = {
				'bookId':bookId,
				'bookImg':bookImg,
				'bookTitle':bookTitle,
				'bookRent':bookRent,
				'bookQuantity':1
		}
		
		books.push(book);
		console.log('books = '+JSON.stringify(books))
		
		localStorage.setItem('cart-books', JSON.stringify(books));
	}else{
		
		console.log('Cart is already present, modifying...')
		
		var allBooks = JSON.parse(localSt);
		
		let oldProduct = allBooks.find((item)=>item.bookId == bookId);
		
		if(oldProduct){
			// book is already present. just increse the quantity
			console.log('This book is already present, modifying the quantity...')
			oldProduct.bookQuantity += 1;
			
			allBooks.map((item)=>{
				if(item.bookId == oldProduct.bookId){
					item.bookQuantity = oldProduct.bookQuantity;
				}
			});
			
			console.log('books = '+JSON.stringify(allBooks))
			
			localStorage.setItem('cart-books', JSON.stringify(allBooks));
			
		}else{
			console.log('This book is a new book, adding to cart...')
			var book = {
					'bookId':bookId,
					'bookImg':bookImg,
					'bookTitle':bookTitle,
					'bookRent':bookRent,
					'bookQuantity':1
			}
			
			allBooks.push(book);
			console.log('books = '+JSON.stringify(allBooks))
			localStorage.clear();
			localStorage.setItem('cart-books', JSON.stringify(allBooks));
		}
	}
	
}