package com.transformers;

import java.util.ArrayList;
import java.util.List;

import com.dto.BookDTO;
import com.models.Book;

public class BookDtoTransformer {
	
	public static BookDTO toBookDTO(Book book) {
		BookDTO bookDTO = new BookDTO();
		
		if (book.getBookId() != null) {
			bookDTO.setBookId(book.getBookId().toString());
		}
		if (book.getTitle() != null) {
			bookDTO.setTitle(book.getTitle());
		}
		if (book.getBookImg() != null) {
			bookDTO.setBookImg(book.getBookImg());
		}
		if (book.getBookRent() != null) {
			bookDTO.setBookRent(book.getBookRent().toString());
		}
		if (book.getAuthor() != null) {
			bookDTO.setAuthor(AuthorTranformer.toAuthorDTO(book.getAuthor()));
		}
		if (book.getCategory() != null) {
			bookDTO.setCategory(CategoryTransformer.toCategoryDTO(book.getCategory()));
		}
		if (book.getNoOfCopies() != null) {
			bookDTO.setNoOfCopies(book.getNoOfCopies().toString());
		}
		if (book.getCreateDate() != null) {
			bookDTO.setCreateDate(book.getCreateDate().toString());
		}
		if (book.getCreatedBy() != null) {
			bookDTO.setCreatedBy(book.getCreatedBy().toString());
		}
		if (book.getUpdateDate() != null) {
			bookDTO.setUpdateDate(book.getUpdateDate().toString());
		}
		if (book.getUpdatedBy() != null) {
			bookDTO.setUpdatedBy(book.getUpdatedBy().toString());
		}
		
		return bookDTO;
	}
	
	public static List<BookDTO> toBookDTO(List<Book> books) {
		List<BookDTO> bookDTOs = new ArrayList<BookDTO>();
		
		for(Book book : books) {
			bookDTOs.add(BookDtoTransformer.toBookDTO(book));
		}
		
		return bookDTOs;
	}
}
