package com.dat.clothingStore.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name = "tbl_roles")
public class Roles extends BaseEntity implements GrantedAuthority{
	
	@Column(name = "name", length = 45, nullable = false)
	private String name;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", joinColumns = @JoinColumn(name = "role_id"),
				inverseJoinColumns = @JoinColumn(name = "user_id"))
	private Set<Users> users = new HashSet<Users>();
	
	public void addUser(Users user) {
		user.getRoles().add(this);
		users.add(user);
	}
	
	public void deleteUser(Users user) {
		user.getRoles().remove(this);
		users.remove(user);
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Users> getUsers() {
		return users;
	}

	public void setUsers(Set<Users> users) {
		this.users = users;
	}
	
	/**
	 * chính là tên ROLE.
	 */
	@Override
	public String getAuthority() {
		return name;
	}
}
