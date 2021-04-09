package com.dev.Sales.Controller.ADMIN;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.client.HttpServerErrorException;

import com.dev.Sales.Model.exportHDModel;
import com.dev.Sales.Services.ExportHoaDonService;

@Controller
public class Export {

	static int idND ;
	@Autowired ExportHoaDonService exportService;
	@GetMapping("/Admin/exportHoaDon/{id}")
	public String exportHDNDShow(@PathVariable("id") int id, @ModelAttribute("exportHD") exportHDModel export) {
		idND = id;
		return "Admin/exportND";
	}
	@PostMapping("/Admin/exportHoaDonND")
	public String exportHDND(@ModelAttribute("exportHD") exportHDModel export,HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println(idND);
		if(export.getFromDate().after(export.getToDate()))
			exportService.exportHoaDonId(request, response, export.getToDate(), export.getFromDate(),idND);
		exportService.exportHoaDonId(request, response, export.getFromDate(), export.getToDate(),idND);
		
		return "Admin/exportND";
		
	}
	
	@GetMapping("/Admin/exportHoaDon")
	public String exportHDShow(@ModelAttribute("exportHD") exportHDModel export) {
		return "Admin/export";
	}
	@PostMapping("/Admin/exportHoaDon")
	public String exportHD(@ModelAttribute("exportHD") exportHDModel export,HttpServletRequest request, HttpServletResponse response) throws IOException {
		if(export.getFromDate().after(export.getToDate()))
			exportService.exportHoaDon(request, response, export.getToDate(), export.getFromDate());
		exportService.exportHoaDon(request, response, export.getFromDate(), export.getToDate());
		return "Admin/export";
		
	}
}
