package com.transformers;

import java.util.ArrayList;
import java.util.List;

import com.dto.CategoryDTO;
import com.models.Category;

public class CategoryTransformer {
	public static CategoryDTO toCategoryDTO(Category category) {
		CategoryDTO categoryDTO = new CategoryDTO();
		
		if (category.getId() != null) {
			categoryDTO.setId(category.getId().toString());
		}
		if (category.getCategoryName() != null) {
			categoryDTO.setCategoryName(category.getCategoryName());
		}
		if (category.getCreateDate() != null) {
			categoryDTO.setCreateDate(category.getCreateDate().toString());
		}
		if (category.getCreatedBy() != null) {
			categoryDTO.setCreatedBy(category.getCreatedBy().toString());
		}
		if (category.getUpdateDate() != null) {
			categoryDTO.setUpdateDate(category.getUpdateDate().toString());
		}
		if (category.getUpdatedBy() != null) {
			categoryDTO.setUpdatedBy(category.getUpdatedBy().toString());
		}
		
		return categoryDTO;
	}
	
	public static List<CategoryDTO> tocategoryDTO(List<Category> categorys) {
		List<CategoryDTO> categoryDTOs = new ArrayList<CategoryDTO>();
		
		for(Category category : categorys) {
			categoryDTOs.add(CategoryTransformer.toCategoryDTO(category));
		}
		
		return categoryDTOs;
	}

}
