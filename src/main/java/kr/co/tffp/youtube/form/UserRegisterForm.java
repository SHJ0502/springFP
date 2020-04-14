package kr.co.tffp.youtube.form;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("UserRegisterForm")
public class UserRegisterForm {

	public String id;
	public String password;
	public String name;
	public String email;
	public Date birthDay;
	public MultipartFile userImagePath;
	
	public UserRegisterForm() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public MultipartFile getUserImagePath() {
		return userImagePath;
	}

	public void setUserImagePath(MultipartFile userImagePath) {
		this.userImagePath = userImagePath;
	}

	

	
	
}
