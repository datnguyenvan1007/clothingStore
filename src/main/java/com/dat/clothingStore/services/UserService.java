package com.dat.clothingStore.services;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dat.clothingStore.dto.AccountSearchModel;
import com.dat.clothingStore.entities.ProductImages;
import com.dat.clothingStore.entities.Products;
import com.dat.clothingStore.entities.Roles;
import com.dat.clothingStore.entities.Users;

@Service
public class UserService extends BaseService<Users>{

	@Override
	protected Class<Users> clazz() {
		// TODO Auto-generated method stub
		return Users.class;
	}
	
	public PagerData<Users> search(AccountSearchModel searchModel, Roles role){
		
		String sql = "select * from tbl_users u join tbl_users_roles ur on u.id = ur.user_id join tbl_roles r on r.id = ur.role_id"
				+ " where r.id = '" + role.getId() + "'";
//		if(searchModel != null) {	
//			sql += "  " ;
//		}
		return runTransactQuerySQL(sql, searchModel == null ? 0 : searchModel.getPage());
	}
	
	public Users loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'";
		List<Users> users = this.runTransactQuerySQL(sql, 0).getData();
		
		if(users == null || users.size() <= 0) return null;
		return users.get(0);
	}
}
