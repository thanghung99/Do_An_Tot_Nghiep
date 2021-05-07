package com.dev.Sales.Services;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.RollbackException;
import javax.transaction.Transactional;

import com.dev.Sales.Entities.TinTucEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dev.Sales.Entities.NguoiDungEntity;
import com.dev.Sales.Entities.SanPhamEntity;
import com.dev.Sales.Entities.SlideEntity;
import com.dev.Sales.Repositories.SanPhamRepository;

@Service
public class SanPhamService {
	@Autowired
	private SanPhamRepository sanhamRepository;
	@PersistenceContext
	protected EntityManager entityManager;
	@Value("${attachment.path}")
	private String attachmentPath;

	@Transactional(rollbackOn = RollbackException.class)
	public void addSP(SanPhamEntity sanpham, MultipartFile anh1,MultipartFile anh2,MultipartFile anh3,MultipartFile anh4, HttpServletRequest request) throws Exception {
		File file1 = null;
		File file2 = null;
		File file3 = null;
		File file4 = null;
		try {
				HttpSession sesstion = request.getSession();
				NguoiDungEntity nguoidung = (NguoiDungEntity) sesstion.getAttribute("ThongTinCaNhan");
				System.out.println("aaaaaaaaaaaaaaaa = "+nguoidung.getUserName());
			// kiểm tra xem người dùng có upload ảnh lên không ?
			if(anh1 != null && anh1.getSize() > 0  ) {
				// thực hiện lưu attacment vào folder trên server.
				file1 = new File(attachmentPath + anh1.getOriginalFilename());
				anh1.transferTo(file1);
			}
				if(anh2 != null && anh2.getSize() > 0){
						file2 = new File(attachmentPath + anh2.getOriginalFilename());
						anh2.transferTo(file2);
				}
						
			if(anh3 != null && anh3.getSize() > 0){
				file3 = new File(attachmentPath + anh3.getOriginalFilename());
				anh3.transferTo(file3);
			}
						
			if(anh4 != null && anh4.getSize() > 0){
				file4 = new File(attachmentPath + anh4.getOriginalFilename());
				anh4.transferTo(file4);
			}

			if(anh1 != null && anh1.getSize() > 0 ||anh2 != null && anh2.getSize() > 0||anh3 != null && anh3.getSize() > 0||anh4 != null && anh4.getSize() > 0 ) { 	
				// thực hiện lưu thông tin file trong database.
				SanPhamEntity sp = new SanPhamEntity();
				sp.setAnh1(anh1.getOriginalFilename());
				sp.setAnh2(anh2.getOriginalFilename());
				sp.setAnh3(anh3.getOriginalFilename());
				sp.setAnh4(anh4.getOriginalFilename());
				sp.setChatlieu(sanpham.getChatlieu());
				sp.setCreatedby(nguoidung.getId().toString());
				sp.setCreatedDate(new Date());
				sp.setGia(sanpham.getGia());
				sp.setHangsx(sanpham.getHangsx());
				sp.setLuotMua(sanpham.getLuotMua());
				sp.setLuotXem(sanpham.getLuotXem());
				sp.setMoTa(sanpham.getMoTa());
				sp.setStatus(sanpham.getStatus());
				sp.setTenSP(sanpham.getTenSP());
				sp.setTheloai(sanpham.getTheloai());
				sanhamRepository.save(sp);
			}
		}catch(

	Exception x)
	{
		if (file1 != null) {
			file1.deleteOnExit();
		}
		if (file2 != null) {
			file2.deleteOnExit();
		}
		if (file3 != null) {
			file3.deleteOnExit();
		}
		if (file4 != null) {
			file4.deleteOnExit();
		}
		throw x;
	}
}

	@Transactional(rollbackOn = RollbackException.class)
	public void updateSP(SanPhamEntity sanpham,int id, MultipartFile anh1,MultipartFile anh2,MultipartFile anh3,MultipartFile anh4, HttpServletRequest request) throws Exception {
		File file1 = null;
		File file2 = null;
		File file3 = null;
		File file4 = null;
		try {
			HttpSession sesstion = request.getSession();
			NguoiDungEntity nguoidung = (NguoiDungEntity) sesstion.getAttribute("ThongTinCaNhan");
			// kiểm tra xem người dùng có upload ảnh lên không ?
			if(anh1 != null && anh1.getSize() > 0  ) {
				// thực hiện lưu attacment vào folder trên server.
				file1 = new File(attachmentPath + anh1.getOriginalFilename());
				anh1.transferTo(file1);
			}
			if(anh2 != null && anh2.getSize() > 0){
				file2 = new File(attachmentPath + anh2.getOriginalFilename());
				anh2.transferTo(file2);
			}

			if(anh3 != null && anh3.getSize() > 0){
				file3 = new File(attachmentPath + anh3.getOriginalFilename());
				anh3.transferTo(file3);
			}

			if(anh4 != null && anh4.getSize() > 0){
				file4 = new File(attachmentPath + anh4.getOriginalFilename());
				anh4.transferTo(file4);
			}
				// thực hiện lưu thông tin file trong database.
				SanPhamEntity sp = sanhamRepository.getOne(id);
				if(anh1 != null && anh1.getSize() > 0 )
					sp.setAnh1(anh1.getOriginalFilename());
				if(anh2 != null && anh2.getSize() > 0 )
					sp.setAnh2(anh2.getOriginalFilename());
				if(anh3 != null && anh3.getSize() > 0 )
					sp.setAnh3(anh3.getOriginalFilename());
				if(anh4 != null && anh4.getSize() > 0 )
					sp.setAnh4(anh4.getOriginalFilename());
				sp.setChatlieu(sanpham.getChatlieu());
				sp.setCreatedby(nguoidung.getId().toString());
				sp.setCreatedDate(new Date());
				sp.setGia(sanpham.getGia());
				sp.setKhuyenMai(sanpham.getKhuyenMai());
				sp.setHangsx(sanpham.getHangsx());
				sp.setMoTa(sanpham.getMoTa());
				sp.setStatus(sanpham.getStatus());
				sp.setTenSP(sanpham.getTenSP());
				sp.setTheloai(sanpham.getTheloai());
				sanhamRepository.save(sp);
		}catch(

				Exception x)
		{
			if (file1 != null) {
				file1.deleteOnExit();
			}
			if (file2 != null) {
				file2.deleteOnExit();
			}
			if (file3 != null) {
				file3.deleteOnExit();
			}
			if (file4 != null) {
				file4.deleteOnExit();
			}
			throw x;
		}
	}

	public long soSPByHang(int idHang){
		String sql = "SELECT * from sales.sanpham where maHang = '"+idHang+"'";
		Query query = entityManager.createNativeQuery(sql,SanPhamEntity.class);
		List<SanPhamEntity> list = query.getResultList();
		return list.stream().count();
	}
	public long soSPByLoai(int idLoai){
		String sql = "SELECT * from sales.sanpham where maLoai = '"+idLoai+"'";
		Query query = entityManager.createNativeQuery(sql,SanPhamEntity.class);
		List<SanPhamEntity> list = query.getResultList();
		return list.stream().count();
	}

	public List<SanPhamEntity> searchSP(String name){
		String sql = "SELECT * FROM sales.sanpham where tenSP like '%"+name+"%'";
		Query query = entityManager.createNativeQuery(sql,SanPhamEntity.class);
		return query.getResultList();
	}
	public int  soSP()  {
		int count = 0;
		String jpql = "select * from sales.sanpham ";
		Query query = entityManager.createNativeQuery(jpql, SanPhamEntity.class);
		List<SanPhamEntity> Lsp = (List<SanPhamEntity>) query.getResultList();
		for(SanPhamEntity sp : Lsp)
			count++;
		return count;
	}
	private static int LIMIT = 8;

	public List<SanPhamEntity> sanPhamPaging(int pageNumber) {
		String jpql = "SELECT * From sales.sanpham";
		Query query = entityManager.createNativeQuery(jpql, SanPhamEntity	.class);

		query.setFirstResult((pageNumber-1) * LIMIT); // bản ghi đầu tiên của trang thứ n
		query.setMaxResults(LIMIT); // số lượng items trên 1 trang.
		return  query.getResultList();
	}
}
