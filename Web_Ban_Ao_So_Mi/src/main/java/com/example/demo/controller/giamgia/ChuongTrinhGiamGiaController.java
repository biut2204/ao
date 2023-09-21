package com.example.demo.controller.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDon;
import com.example.demo.entity.giamgia.GiamGiaSanPham;
import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.repo.sanpham.AoDAO;
import com.example.demo.ser.AoChiTietSer;
import com.example.demo.ser.GiamGiaHoaDonSer;
import com.example.demo.ser.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.GiamGiaSanPhamSer;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.UUID;

@Controller
public class ChuongTrinhGiamGiaController {

    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    AoDAO aoDAO;

    @GetMapping("/trang-chu")
    public String trangChu() {
        return "/admin/view-admin";
    }

    @GetMapping("/chuong-trinh-giam-gia")
    public ModelAndView view(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, Model model) {
        Page<GiamGiaSanPham> page = giamGiaSanPhamSer.view(pageNo, 5);
        Page<GiamGiaHoaDon> page1 = giamGiaHoaDonSer.view(pageNo, 5);
        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/chuong-trinh-giam-gia");
        mav.addObject("page", page);
        mav.addObject("page1", page1);
        return mav;
    }

    @GetMapping("/ap-dung")
    public ModelAndView apDung(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, Model model) {
        Page<GiamGiaSanPhamChiTiet> page = giamGiaSanPhamChiTietSer.view(pageNo, 5);
        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/ap-dung");
        mav.addObject("page", page);
        return mav;
    }

    @PostMapping("/chuong-trinh-giam-gia/add")
    public String add(HttpServletRequest request, HttpSession session) {
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {
            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(ma);
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.add(giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {
            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(ma);
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.add(giamGiaHoaDon);
        }
        session.invalidate();
        return "redirect:/chuong-trinh-giam-gia";
    }

    @PostMapping("/chuong-trinh-giam-gia/update")
    public String update(HttpServletRequest request, HttpSession session) {
        String id = request.getParameter("id");
        String ma = request.getParameter("ma");
        String ten = request.getParameter("ten");
        String loai = request.getParameter("loai");
        String sosp = request.getParameter("sosp");
        String phanTramGiamSP = request.getParameter("tigiam");
        String phanTramGiamHD = request.getParameter("tigiam_hd");

        if (loai.equals("giamgia_sp")) {
            GiamGiaSanPham giamGiaSanPham = new GiamGiaSanPham();
            giamGiaSanPham.setMa(ma);
            giamGiaSanPham.setTen(ten);
            giamGiaSanPham.setPhanTramGiam(Integer.parseInt(phanTramGiamSP));

            String ngayBatDauSPString = request.getParameter("ngaybd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaSanPham.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaSanPham.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaSanPhamSer.update(UUID.fromString(id), giamGiaSanPham);
        } else if (loai.equals("giamgia_hd")) {
            BigDecimal tongtien = new BigDecimal(request.getParameter("tongtien"));
            GiamGiaHoaDon giamGiaHoaDon = new GiamGiaHoaDon();
            giamGiaHoaDon.setMa(ma);
            giamGiaHoaDon.setTen(ten);
            giamGiaHoaDon.setSoLuongSanPham(Integer.parseInt(sosp));
            giamGiaHoaDon.setPhanTramGiam(Integer.parseInt(phanTramGiamHD));

            String ngayBatDauSPString = request.getParameter("ngaybd_hd");
            LocalDate ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
            giamGiaHoaDon.setNgayBatDau(Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            String ngayKetThucSPString = request.getParameter("ngaykt_hd");
            LocalDate ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
            giamGiaHoaDon.setNgayKetThuc(Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()));

            giamGiaHoaDon.setSoTienHoaDon(tongtien);
            giamGiaHoaDonSer.update(UUID.fromString(id), giamGiaHoaDon);
        }
        session.invalidate();
        return "redirect:/chuong-trinh-giam-gia";
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_sp")
    public String detailGGSP(HttpServletRequest request, HttpSession session) {
        String detail = request.getParameter("detail_sp");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String ngayBatDau = dateFormat.format(giamGiaSanPhamSer.findId(UUID.fromString(detail)).getNgayBatDau());
        String ngayKetThuc = dateFormat.format(giamGiaSanPhamSer.findId(UUID.fromString(detail)).getNgayKetThuc());
        session.setAttribute("ngayBatDau_sp", ngayBatDau);
        session.setAttribute("ngayKetThuc_sp", ngayKetThuc);

        session.setAttribute("CTGG", giamGiaSanPhamSer.findId(UUID.fromString(detail)));
        session.setAttribute("CTGGSP", giamGiaSanPhamSer.findId(UUID.fromString(detail)));
        session.setAttribute("loai", "giamgia_sp");
        return "redirect:/chuong-trinh-giam-gia";
    }

    @PostMapping("/chuong-trinh-giam-gia/detail_hd")
    public String detailGGHD(HttpServletRequest request, HttpSession session) {
        String detail = request.getParameter("detail_hd");

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String ngayBatDau = dateFormat.format(giamGiaHoaDonSer.findId(UUID.fromString(detail)).getNgayBatDau());
        String ngayKetThuc = dateFormat.format(giamGiaHoaDonSer.findId(UUID.fromString(detail)).getNgayKetThuc());
        session.setAttribute("ngayBatDau_hd", ngayBatDau);
        session.setAttribute("ngayKetThuc_hd", ngayKetThuc);

        session.setAttribute("CTGG", giamGiaHoaDonSer.findId(UUID.fromString(detail)));
        session.setAttribute("CTGGHD", giamGiaHoaDonSer.findId(UUID.fromString(detail)));
        session.setAttribute("loai", "giamgia_hd");
        return "redirect:/chuong-trinh-giam-gia";
    }

    @PostMapping("/chuong-trinh-giam-gia/clear")
    public String clear(HttpSession session) {
        session.invalidate();
        return "redirect:/chuong-trinh-giam-gia";
    }

    @PostMapping("/chuong-trinh-giam-gia/search_ten_sp")
    public ModelAndView searchTenSP(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, Model model, HttpServletRequest request) {
        String searchTenSP = request.getParameter("searchTenSP");
        Page<GiamGiaSanPham> page = giamGiaSanPhamSer.searchTen(searchTenSP, pageNo, 5);
        Page<GiamGiaHoaDon> page1 = giamGiaHoaDonSer.view(pageNo, 5);
        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/chuong-trinh-giam-gia");
        mav.addObject("page", page);
        mav.addObject("page1", page1);
        return mav;
    }

    @PostMapping("/chuong-trinh-giam-gia/search_ten_hd")
    public ModelAndView searchTenHD(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, Model model, HttpServletRequest request) {
        String searchTenHD = request.getParameter("searchTenHD");
        Page<GiamGiaSanPham> page = giamGiaSanPhamSer.view(pageNo, 5);
        Page<GiamGiaHoaDon> page1 = giamGiaHoaDonSer.searchTen(searchTenHD, pageNo, 5);
        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/chuong-trinh-giam-gia");
        mav.addObject("page", page);
        mav.addObject("page1", page1);
        return mav;
    }

    @PostMapping("/chuong-trinh-giam-gia/loc_sp")
    public ModelAndView locSP(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo,
                              @RequestParam(value = "ngaybd_search", required = false) String ngayBatDauSPString,
                              @RequestParam(value = "ngaykt_search", required = false) String ngayKetThucSPString,
                              Model model, HttpServletRequest request) {
        LocalDate ngayBatDauSP = null;
        LocalDate ngayKetThucSP = null;

        if (ngayBatDauSPString != null && !ngayBatDauSPString.isEmpty()) {
            ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
        }

        if (ngayKetThucSPString != null && !ngayKetThucSPString.isEmpty()) {
            ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
        }

        Page<GiamGiaSanPham> page = giamGiaSanPhamSer.loc(ngayBatDauSP != null ? Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null,
                ngayKetThucSP != null ? Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null, pageNo, 5);

        Page<GiamGiaHoaDon> page1 = giamGiaHoaDonSer.view(pageNo, 5);

        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/chuong-trinh-giam-gia");
        mav.addObject("page", page);
        mav.addObject("page1", page1);
        return mav;
    }

    @PostMapping("/chuong-trinh-giam-gia/loc_hd")
    public ModelAndView locHD(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo,
                              @RequestParam(value = "ngaybd_hd_search", required = false) String ngayBatDauSPString,
                              @RequestParam(value = "ngaykt_hd_search", required = false) String ngayKetThucSPString,
                              Model model, HttpServletRequest request) {
        LocalDate ngayBatDauSP = null;
        LocalDate ngayKetThucSP = null;

        if (ngayBatDauSPString != null && !ngayBatDauSPString.isEmpty()) {
            ngayBatDauSP = LocalDate.parse(ngayBatDauSPString);
        }

        if (ngayKetThucSPString != null && !ngayKetThucSPString.isEmpty()) {
            ngayKetThucSP = LocalDate.parse(ngayKetThucSPString);
        }

        Page<GiamGiaSanPham> page = giamGiaSanPhamSer.view(pageNo, 5);

        Page<GiamGiaHoaDon> page1 = giamGiaHoaDonSer.loc(ngayBatDauSP != null ? Date.from(ngayBatDauSP.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null,
                ngayKetThucSP != null ? Date.from(ngayKetThucSP.atStartOfDay(ZoneId.systemDefault()).toInstant()) : null, pageNo, 5);

        ModelAndView mav = new ModelAndView("/chuong-trinh-giam-gia/chuong-trinh-giam-gia");
        mav.addObject("page", page);
        mav.addObject("page1", page1);
        return mav;
    }

    @PostMapping("/chuong-trinh-giam-gia/ap-dung-san-pham")
    public String apDungSanPham(HttpServletRequest request) {

        GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet = new GiamGiaSanPhamChiTiet();

        String tenSanPham = request.getParameter("tenSanPham");
        String tenChuongTrinh = request.getParameter("tenChuongTrinh");
        Ao ao = aoDAO.getAoByTen(tenSanPham);
        GiamGiaSanPham giamGiaSanPham = giamGiaSanPhamSer.findByTen(tenChuongTrinh);

        BigDecimal phanTramGiam = BigDecimal.valueOf(giamGiaSanPham.getPhanTramGiam());

        giamGiaSanPhamChiTiet.setGiamGiaSanPham(giamGiaSanPham);
        giamGiaSanPhamChiTiet.setAo(ao);
        giamGiaSanPhamChiTiet.setSoTienDaGiam(ao.getGiaban().multiply(phanTramGiam));
        giamGiaSanPhamChiTiet.setTrangThai(0);

        giamGiaSanPhamChiTietSer.add(giamGiaSanPhamChiTiet);
        return "redirect:/ap-dung";
    }
}
