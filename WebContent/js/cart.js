
function addToCart(bId, bImage,bTitle, bPrice, bQuantity ){
	
	let cart = localStorage.getItem('cart');
	
	if(cart == null){
		// No cart yet
		let books = []
		let book = {'bookId':bId, 'bookImage':bImage, 'bookTitle':bTitle, 'bookPrice':bPrice, 'bookQuantity':bQuantity };
		
		books.push(book);
		
		localStorage.setItem('cart', JSON.stringify(books));
	}
}


$(document).ready(function(){
	
	
	$(document).on('click','#addToCart', function(){
		let bookCard = this.parentElement;
		console.log(bookCard)
		let id = $(this).data('id');
		let bookImg = document.getElementsByClassName('productinfo')[0].children[0].src;
		let bookPrice =parseFloat(document.getElementsByClassName('productinfo')[0].children[1].innerText.replace('Rs:','').trim());
		let bookTitle = document.getElementsByClassName('productinfo')[0].children[2].innerText;
		
		console.log(id, bookImg, bookPrice, bookTitle);
		
		let cart = localStorage.getItem('cart');
		
		if(cart == null){
			// No cart yet
			let books = []
			let book = {"bookId":id,"bookImg":bookImg,"bookTitle":bookTitle,"bookPrice":bookPrice,"bookQuantity":1 };
			
			books.push(book);
			
			localStorage.setItem('cart',JSON.stringify(books));
		}
		
		
	});
	
	
	
	
});