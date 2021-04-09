package com.dev.Sales.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dev.Sales.Entities.NguoiDungEntity;
import com.dev.Sales.Model.RegisterModel;
import com.dev.Sales.Repositories.NguoiDungRepository;
import com.dev.Sales.dto.ApiResponse;
import com.dev.Sales.dto.DoiMKdto;


@Controller
public class RegisterController {
	@Autowired private NguoiDungRepository nguoidungRepository;
	
	
	@RequestMapping(value = { "/Register" }, method = RequestMethod.GET)
	public String view(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response) {
		return "register";
	}
	@PostMapping(value = "/api/Register")
	public ResponseEntity<ApiResponse> regis( @RequestBody RegisterModel regi) {
		String userName = regi.getUserName();
		String passWord = regi.getPassWord();
		String confirmPass = regi.getConfirmPassWord();
		String kq = null;
		int count = 0;
		int test = 0;
		if (passWord.equals(confirmPass)) {
			
			for (NguoiDungEntity nguoidung : nguoidungRepository.findAll()) {
				System.out.println("tss = "+nguoidung.getUserName());
				 if(userName.equals(nguoidung.getUserName()))
				{
					
					test++;
					break;
				}

				}
			if(test== 0) {
				NguoiDungEntity nd = new NguoiDungEntity();
				
				nd.setTenND(regi.getTenND());
				nd.setDiaChi(regi.getDiaChi());
				nd.setEmail(regi.getEmail());
				nd.setUserName(regi.getUserName());
				nd.setPassWord(regi.getPassWord());
				nd.setCreatedby("1");
				nd.setStatus((byte) 1);
				count++;
				nguoidungRepository.save(nd);
				
			}
			}
			if(test!=0)
				kq = "User Name Đã Tồn Tại";
			else if( count !=0)
				kq = "Đăng ký thành công";
			else if(count ==0)
			kq = "Xac nhan mat khau sai";

		return ResponseEntity.ok(new ApiResponse(200, kq));
	}

}
