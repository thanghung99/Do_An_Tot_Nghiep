package com.dev.Sales.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.Sales.Services.SanPhamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.dev.Sales.Entities.NguoiDungEntity;
import com.dev.Sales.Entities.SanPhamEntity;
import com.dev.Sales.Model.Mail;
import com.dev.Sales.Repositories.GioHangRepository;
import com.dev.Sales.Repositories.NguoiDungRepository;
import com.dev.Sales.Repositories.SanPhamRepository;
import com.dev.Sales.Repositories.ThanhToanRepository;
import com.dev.Sales.Services.MailService;
import com.dev.Sales.Services.MuaHangService;
import com.dev.Sales.Services.NguoiDungService;
import com.dev.Sales.dto.ApiGioHang;
import com.dev.Sales.dto.ApiResponse;
import com.dev.Sales.dto.DoiMKdto;
import com.dev.Sales.dto.GioHangDto;
import com.dev.Sales.dto.SanPhamDTO;
import com.dev.Sales.dto.ThongTinGioHang;
import com.dev.Sales.dto.soLuong;

@Controller
public class ApiController {
	@Autowired
	private MuaHangService muahangService;
	@Autowired
	private SanPhamRepository sanphamRepository;
	@Autowired
	private NguoiDungRepository nguoidungRepository;
	@Autowired
	private NguoiDungService nguoidungSerVice;
	@Autowired
	private ThanhToanRepository thanhtoanRepository;
	@Autowired
	private GioHangRepository GioHangRepository;
	@Autowired
	private MailService mailService;
	@Autowired
	private SanPhamService sanPhamService;
	@PostMapping(value = "/api/XemSP")
	public ResponseEntity<ApiResponse> xemsp(@RequestBody final Map<String, Object> id, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		int maSP = (int) id.get("id");
		SanPhamEntity sanpham = sanphamRepository.getOne(maSP);
		// HttpSession session = request.getSession();
		// session.setAttribute("XemSP", sanpham.);
		
		 
		 

		SanPhamDTO phamDto = new SanPhamDTO();
		phamDto.setId(maSP);
		phamDto.setTenSP(sanpham.getTenSP());
		phamDto.setAnh1(sanpham.getAnh1());
		phamDto.setAnh2(sanpham.getAnh2());
		phamDto.setAnh3(sanpham.getAnh3());
		phamDto.setAnh4(sanpham.getAnh4());
		phamDto.setChatlieu(sanpham.getChatlieu());
		phamDto.setGia(sanpham.getGia());
		phamDto.setMoTa(sanpham.getMoTa());
		phamDto.setKhuyenMai(sanpham.getKhuyenMai());
		
		SanPhamEntity sp = sanphamRepository.getOne(maSP);
		  sp.setLuotXem(sp.getLuotXem()+1); sanphamRepository.save(sp);
		return ResponseEntity.ok(new ApiResponse(200, phamDto));
	}

	@PostMapping(value = "/api/AddSanPham")
	public ResponseEntity<ApiResponse> addsp(@RequestBody final ApiGioHang giohang, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		int maSP = giohang.getId();
		int soLuong = 0;
		SanPhamEntity sp = sanphamRepository.getOne(maSP);
		HttpSession session = request.getSession();
		List<GioHangDto> LsanPham = new ArrayList<GioHangDto>();
		if (session.getAttribute("LGioHang") != null) {
			LsanPham = (List<GioHangDto>) session.getAttribute("LGioHang");
		} else
			session.setAttribute("LGioHang", LsanPham);

		// b2: b??? sung s???n ph???m v??o trong gi??? h??ng(s??? c?? tr?????ng h???p trong gi??? h??ng ???? c??
		// s???n ph???m ???? r???i)
		boolean sanphamdaco = false;

		// b3: tr?????ng h???p s???n ph???m ch??a c??
		if (sanphamdaco == false) {
			GioHangDto cartItem = new GioHangDto();
			cartItem.setId(maSP);

			cartItem.setSoLuong(1);
			cartItem.setAnh(sp.getAnh1());
			cartItem.setTenSP(sp.getTenSP());
			if(sp.getKhuyenMai() != null)
			cartItem.setGia(Integer.parseInt(sp.getKhuyenMai()));
			else cartItem.setGia(sp.getGia());
			cartItem.setSize(giohang.getSize());
			cartItem.setId(maSP);
			LsanPham.add(cartItem);
		}

		int total = 0;
		for (GioHangDto gh : LsanPham) {
			total += gh.getGia();
		}
		session.setAttribute("TongTien", total);
		for (GioHangDto gh : LsanPham)
			soLuong++;
		session.setAttribute("SoLuongSP", soLuong);

		return ResponseEntity.ok(new ApiResponse(200, soLuong));
	}

	@PostMapping(value = "/api/DoiMK")
	public ResponseEntity<ApiResponse> doimk(@RequestBody DoiMKdto doimk, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		String userName = doimk.getUserName();
		String passWord = doimk.getPassWord();
		String newPassWord = doimk.getNewPassWord();
		String confirmPass = doimk.getConfirmPassWord();
		String kq = null;
		int count = 0;

		if (newPassWord.equals(confirmPass)) {
			for (NguoiDungEntity nguoidung : nguoidungRepository.findAll()) {
				if (userName.equals(nguoidung.getUserName()) && passWord.equals(nguoidung.getPassWord())) {
					NguoiDungEntity nd = nguoidungSerVice.searchUserByUserName(userName);
					nd.setPassWord(newPassWord);
					count++;
					nguoidungRepository.save(nd);
					kq = "Thay ?????i th??nh c??ng";
					break;
				}

			}
			if (count == 0)
				kq = "T??i kho???n ho???c m???t kh???u sai";
		} else
			kq = "Xac nhan mat khau sai";

		return ResponseEntity.ok(new ApiResponse(200, kq));
	}

	@PostMapping(value = "/api/addSoluong")
	public ResponseEntity<ApiResponse> sl(@RequestBody final soLuong sl, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		HttpSession session = request.getSession();
		List<GioHangDto> LgioHang = (List<GioHangDto>) session.getAttribute("LGioHang");
		for (GioHangDto gh : LgioHang) {
			if (gh.getId() == sl.getId()) {
				gh.setSoLuong(sl.getSoLuong());
				System.out.println(gh.getSoLuong() + "---------------------------------");
				break;
			}
		}

		return ResponseEntity.ok(new ApiResponse(200, "ThanCONg"));
	}

	@PostMapping(value = "/api/muaSP")
	public ResponseEntity<ApiResponse> muasp(@RequestBody final ThongTinGioHang thongtin, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String kq = null;
		NguoiDungEntity nguoidung = (NguoiDungEntity) session.getAttribute("ThongTinCaNhan");
		if (session.getAttribute("ThongTinCaNhan") == null)
			kq = "B???n c???n ????ng nh???p tr?????c khi th???c hi???n ch???c n??ng n??y";
		else {
			List<GioHangDto> LgioHang = (List<GioHangDto>) session.getAttribute("LGioHang");
			if (LgioHang.isEmpty())
				kq = "B???n ch??a c?? s???n ph???m n??o trong gi??? h??ng";
			else {

				muahangService.addMuaHang(thongtin, request);
				 Mail mail = new Mail();
			        mail.setMailFrom("nhtthang1999@gmail.com");
			        mail.setMailTo("nguyenhungthang1999@gmail.com");
			        mail.setMailSubject("Spring Boot - Email Example");
			        mail.setMailContent("B???n c?? ????n h??ng m???i");
			        mailService.sendEmail(mail);
				/////
				kq = "Mua h??ng th??nh c??ng";
			}

		}

		return ResponseEntity.ok(new ApiResponse(200, kq));
	}

}
