package com.dev.Sales.Controller;

import com.dev.Sales.Entities.HangSXEntity;
import com.dev.Sales.Entities.NguoiDungEntity;
import com.dev.Sales.Entities.TheLoaiEntity;
import com.dev.Sales.Repositories.HangSXRepository;
import com.dev.Sales.Repositories.NguoiDungRepository;
import com.dev.Sales.Repositories.TheLoaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class DoiMatKhauController {
    @Autowired
    private HangSXRepository hangsx;
    @Autowired private TheLoaiRepository theloai;
    @Autowired private NguoiDungRepository nguoiDungRepository;
    @GetMapping("/DoiMatKhau")
    public String dmk (Model model, HttpServletRequest request){

        //			HANGSX
        List<HangSXEntity> Lhangsx = new ArrayList<HangSXEntity>();
        for (HangSXEntity Hang : hangsx.findAll()) {
            Lhangsx.add(Hang);

        }
        model.addAttribute("HangSX", Lhangsx);
//	 		THELOAI
        List<TheLoaiEntity> LtheLoai = new ArrayList<TheLoaiEntity>();
        for (TheLoaiEntity loai : theloai.findAll()) {
            LtheLoai.add(loai);
        }
        model.addAttribute("TheLoai", LtheLoai);

        HttpSession session = request.getSession();
        NguoiDungEntity nguoiDungEntity = (NguoiDungEntity) session.getAttribute("ThongTinCaNhan");
        model.addAttribute("ThongTinCaNhan",nguoiDungEntity);
        return "DoiMatKhau";
    }
}
