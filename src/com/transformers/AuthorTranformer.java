package com.transformers;

import java.util.ArrayList;
import java.util.List;

import com.dto.AuthorDTO;
import com.models.Author;

public class AuthorTranformer {
	
	public static AuthorDTO toAuthorDTO(Author author) {
		AuthorDTO authorDTO = new AuthorDTO();
		
		if (author.getId() != null) {
			authorDTO.setId(author.getId().toString());
		}
		if (author.getAuthorName() != null) {
			authorDTO.setAuthorName(author.getAuthorName());
		}
		if (author.getNoOfPublications() != null) {
			authorDTO.setNoOfPublications(author.getNoOfPublications().toString());
		}
		if (author.getCreateDate() != null) {
			authorDTO.setCreateDate(author.getCreateDate().toString());
		}else {
			authorDTO.setCreatedBy("--");
		}
		if (author.getCreatedBy() != null) {
			authorDTO.setCreatedBy(author.getCreatedBy().toString());
		}else {
			authorDTO.setCreatedBy("--");
		}
		if (author.getUpdateDate() != null) {
			authorDTO.setUpdateDate(author.getUpdateDate().toString());
		}else {
			authorDTO.setUpdateDate("--");
		}
		if (author.getUpdatedBy() != null) {
			authorDTO.setUpdatedBy(author.getUpdatedBy().toString());
		}else {
			authorDTO.setUpdatedBy("--");
		}
		
		return authorDTO;
	} 
	
	
	public static List<AuthorDTO> toAuthorDTO(List<Author> authors){
		List<AuthorDTO> authorDTOs = new ArrayList<AuthorDTO>();
		
		for(Author author : authors) {
			authorDTOs.add(AuthorTranformer.toAuthorDTO(author));
		}
		
		return authorDTOs;
	}

}
