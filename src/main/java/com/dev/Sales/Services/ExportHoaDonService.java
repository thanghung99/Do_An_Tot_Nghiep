package com.dev.Sales.Services;

import com.dev.Sales.Entities.MuaHangEntity;
import com.dev.Sales.Entities.NguoiDungEntity;
import com.dev.Sales.Repositories.MuaHangRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import org.apache.poi.ss.usermodel.*;
import java.io.OutputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

@Service
public class ExportHoaDonService {

	@PersistenceContext
	protected EntityManager entityManager;

	private MuaHangRepository muaHangRepository;

	@Autowired
	public ExportHoaDonService(MuaHangRepository muaHangRepository) {
		this.muaHangRepository = muaHangRepository;
	}

	public void exportHoaDon(HttpServletRequest request, HttpServletResponse response, Date fromNgay, Date toNgay)
			throws IOException {
		int rows = 0;
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Thong ke");
		rows++;
		customHeader(workbook, sheet, rows);
		int stt = 1;
		for (MuaHangEntity muahang : getHoaDon(fromNgay,toNgay)) {

			customData(workbook, sheet, muahang, getNguoiMua(muahang.getCreatedby()), stt, rows);
			rows++;
			stt++;
		}

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=thongke.xlsx");
		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.flush();
		out.close();
		workbook.close();
	}

	public void exportHoaDonId(HttpServletRequest request, HttpServletResponse response, Date fromNgay, Date toNgay, int id)
			throws IOException {
		int rows = 0;
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Thong ke");
		rows++;
		customHeader(workbook, sheet, rows);
		int stt = 1;
		for (MuaHangEntity muahang : getHoaDonId(fromNgay,toNgay,id)) {

			customData(workbook, sheet, muahang, getNguoiMua(muahang.getCreatedby()), stt, rows);
			rows++;
			stt++;
		}

		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment; filename=thongke.xlsx");
		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.flush();
		out.close();
		workbook.close();
	}

	public String getNguoiMua(String id) {
		String jpql = "select * from sales.nguoidung where id = " + "'" + id + "'";
		Query query = entityManager.createNativeQuery(jpql, NguoiDungEntity.class);
		NguoiDungEntity nguoidung = (NguoiDungEntity) query.getSingleResult();
		return nguoidung.getTenND();
	}

	public List<MuaHangEntity> getHoaDon(Date from, Date to) {
		String jpql = "SELECT * FROM sales.muahang where createdDate >= '" + from + "' and createdDate <= '" + to
				+ "' ";
		Query query = entityManager.createNativeQuery(jpql, MuaHangEntity.class);
		return query.getResultList();
	}

	public List<MuaHangEntity> getHoaDonId(Date from, Date to, int id) {
		String jpql = "SELECT * FROM sales.muahang where createdDate >= '" + from + "' " + "and createdDate <= '" + to
				+ "' " + "and createdBy=" + id + "";
		Query query = entityManager.createNativeQuery(jpql, MuaHangEntity.class);
		return query.getResultList();
	}

	/// custom header
	public void customHeader(Workbook workbook, Sheet sheet, int rows) {
		for (int column = 0; column < 7; column++) {
			if (column == 1 || column == 3) {
				sheet.setColumnWidth(column, 8000);
				continue;
			}
			sheet.setColumnWidth(column, 4000);

		}
		Row header = sheet.createRow(rows);
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setFillForegroundColor(IndexedColors.LIGHT_GREEN.getIndex());
		headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
		headerStyle.setAlignment(HorizontalAlignment.CENTER_SELECTION);
		XSSFFont font = ((XSSFWorkbook) workbook).createFont();
		font.setFontName("Arial");
		font.setFontHeightInPoints((short) 14);
		font.setBold(false);
		headerStyle.setFont(font);

		Cell headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(0);
		headerCell.setCellValue("STT");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(1);
		headerCell.setCellValue("NGƯỜI MUA");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(2);
		headerCell.setCellValue("SẢN PHẨM");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(3);
		headerCell.setCellValue("SỐ LƯỢNG");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(4);
		headerCell.setCellValue(" SIZE");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(5);
		headerCell.setCellValue(" TỔNG TIỀN");
		headerCell.setCellStyle(headerStyle);

		headerCell = ((org.apache.poi.ss.usermodel.Row) header).createCell(6);
		headerCell.setCellValue(" NGÀY MUA");
		headerCell.setCellStyle(headerStyle);
	}

	// custom data
	public void customData(Workbook workbook, Sheet sheet, MuaHangEntity muahang, String nguoiMua, int stt, int rows) {

		CellStyle style = workbook.createCellStyle();
		style.setWrapText(true);
		style.setAlignment(HorizontalAlignment.CENTER_SELECTION);

		Row row = (Row) sheet.createRow(rows + 1);
		Cell cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(0);
		if (StringUtils.isEmpty(stt))
			cell.setCellValue("");
		else
			cell.setCellValue(stt);
		cell.setCellStyle(style);

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(1);
		if (StringUtils.isEmpty(nguoiMua))
			cell.setCellValue("");
		else
			cell.setCellValue(nguoiMua);
		cell.setCellStyle(style);

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(2);
		if (StringUtils.isEmpty(muahang.getMuaHang_sanpham().getTenSP()))
			cell.setCellValue("");
		else
			cell.setCellValue(muahang.getMuaHang_sanpham().getTenSP());
		cell.setCellStyle(style);

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(3);
		if (StringUtils.isEmpty(muahang.getSoLuong()))
			cell.setCellValue("");
		else
			cell.setCellValue(muahang.getSoLuong());
		cell.setCellStyle(style);

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(4);
		if (StringUtils.isEmpty(muahang.getSize()))
			cell.setCellValue("");
		else
			cell.setCellValue(muahang.getSize());
		cell.setCellStyle(style);

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(5);
		if (StringUtils.isEmpty(muahang.getTongTien()))
			cell.setCellValue("");
		else
			cell.setCellValue(muahang.getTongTien());
		cell.setCellStyle(style);

		// format date
		CellStyle styleDate = workbook.createCellStyle();
		CreationHelper createHelper = workbook.getCreationHelper();
		styleDate.setDataFormat(createHelper.createDataFormat().getFormat("dd-MM-yyyy"));

		cell = ((org.apache.poi.ss.usermodel.Row) row).createCell(6);
		if (StringUtils.isEmpty(muahang.getCreatedDate()))
			cell.setCellValue("");
		else
			cell.setCellValue(muahang.getCreatedDate());
		cell.setCellStyle(styleDate);
	}
}
