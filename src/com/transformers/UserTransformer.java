package com.transformers;

import java.util.ArrayList;
import java.util.List;

import com.dto.UserDTO;
import com.models.User;

public class UserTransformer {
	
	public static UserDTO toUserDTO(User user) {
		UserDTO userDTO = new UserDTO();
		
		if (user.getId() != null) {
			userDTO.setId(user.getId().toString());
		}
		if (user.getUserName() != null) {
			userDTO.setUserName(user.getUserName());
		}
		if (user.getEmail() != null) {
			userDTO.setEmail(user.getEmail());
		}
		if (user.getPassword() != null) {
			userDTO.setPassword(user.getPassword());
		}
		if (user.getCreateDate() != null) {
			userDTO.setCreateDate(user.getCreateDate().toString());
		}
		if (user.getCreatedBy() != null) {
			userDTO.setCreatedBy(user.getCreatedBy().toString());
		}else {
			userDTO.setCreatedBy("--");
		}
		if (user.getUpdateDate() != null) {
			userDTO.setUpdateDate(user.getUpdateDate().toString());
		}else {
			userDTO.setUpdateDate("--");
		}
		if (user.getUpdatedBy() != null) {
			userDTO.setUpdatedBy(user.getUpdatedBy().toString());
		}else {
			userDTO.setUpdatedBy("--");
		}
		
		return userDTO;
		
	}
	
	public static List<UserDTO> toUserDTO(List<User> allUsers){
		List<UserDTO> allDtos = new ArrayList<UserDTO>();
		
		for(User user : allUsers) {
			UserDTO userDTO = UserTransformer.toUserDTO(user);
			allDtos.add(userDTO);
		}
		return allDtos;
	}

}
