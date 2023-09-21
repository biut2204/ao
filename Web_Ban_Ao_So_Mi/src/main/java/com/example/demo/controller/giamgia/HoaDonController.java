package com.example.demo.controller.giamgia;

import com.example.demo.entity.giamgia.HoaDon;
import com.example.demo.entity.giamgia.HoaDonChiTiet;
import com.example.demo.entity.khachhang.KhachHang;
import com.example.demo.ser.GiamGiaHoaDonSer;
import com.example.demo.ser.HoaDonChiTietSer;
import com.example.demo.ser.HoaDonSer;
import com.example.demo.ser.KhachHangSer;
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
import java.util.List;
import java.util.UUID;

@Controller
public class HoaDonController {

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    KhachHangSer khachHangSer;

    @GetMapping("/hoa-don/*")
    public String hoaDon(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] p = url.split("/hoa-don/");
        String id = p[1];

        Long sl = hoaDonSer.tongSl(UUID.fromString(id));
        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
        List<HoaDonChiTiet> hoaDonChiTiets = hoaDonChiTietSer.findByHoaDon(hoaDon.getId());

        model.addAttribute("CTGG",giamGiaHoaDonSer.findBySlandTt(Integer.valueOf(sl.intValue()),hoaDon.getTongTien()));
        model.addAttribute("hoaDon",hoaDonSer.findId(UUID.fromString(id)));
        model.addAttribute("listSP",hoaDonChiTiets);
        model.addAttribute("idKh",hoaDon.getKhachHang().getMa());
        model.addAttribute("sdt",hoaDon.getKhachHang().getSdt());
        model.addAttribute("diaChi",hoaDon.getKhachHang().getDia_chi() + " , " + hoaDon.getKhachHang().getThanh_pho() +" , "+ hoaDon.getKhachHang().getQuoc_gia());

        String qrCodeText = "http://192.168.99.107:8080/thanh-toan/"+id;
        model.addAttribute("qrCodeText", qrCodeText);
        model.addAttribute("idCode", id);

        return "/hoa-don/hoa-don";
    }

    @GetMapping("/thanh-toan/*")
    public String thanhToanView(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] p = url.split("/thanh-toan/");
        String id = p[1];
        model.addAttribute("idThanhToan",id);

        return "/hoa-don/thanh-toan";
    }

    @GetMapping("/hoa-don/cho-thanh-toan/*")
    public ModelAndView hoaDonChoThanhToan(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/hoa-don/cho-thanh-toan/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        }catch (Exception e){
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByKhAndTrangThai(pageNo, 5,khachHang.getId(),0);
        ModelAndView mav = new ModelAndView("/hoa-don/hoa-don-cho-thanh-toan");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/amin/cho-xac-nhan")
    public ModelAndView adminChoThanhToan(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByTrangThai(pageNo, 5,1);
        ModelAndView mav = new ModelAndView("/admin/hoa-don-cho-xac-nhan");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/amin/dang-giao")
    public ModelAndView adminDangGiao(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByTrangThai(pageNo, 5,2);
        ModelAndView mav = new ModelAndView("/admin/hoa-don-dang-giao");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/amin/hoan-thanh")
    public ModelAndView adminHoanThanh(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByTrangThai(pageNo, 5,3);
        ModelAndView mav = new ModelAndView("/admin/hoa-don-hoan-thanh");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/hoa-don/cho-xac-nhan/*")
    public ModelAndView hoaDonChoXacNhan(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/hoa-don/cho-xac-nhan/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        }catch (Exception e){
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByKhAndTrangThai(pageNo, 5,khachHang.getId(),1);
        ModelAndView mav = new ModelAndView("/hoa-don/hoa-don-cho-xac-nhan");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/hoa-don/dang-giao/*")
    public ModelAndView hoaDonDangGiao(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/hoa-don/dang-giao/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        }catch (Exception e){
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByKhAndTrangThai(pageNo, 5,khachHang.getId(),2);
        ModelAndView mav = new ModelAndView("/hoa-don/hoa-don-dang-giao");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/hoa-don/hoan-thanh/*")
    public ModelAndView hoaDonHoanThanh(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/hoa-don/hoan-thanh/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        }catch (Exception e){
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByKhAndTrangThai(pageNo, 5,khachHang.getId(),3);
        ModelAndView mav = new ModelAndView("/hoa-don/hoa-don-hoan-thanh");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/hoa-don/huy/*")
    public ModelAndView hoaDonHuy(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] parts = url.split("/hoa-don/huy/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        }catch (Exception e){
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        Page<HoaDon> page = hoaDonSer.listHoaDonFindByKhAndTrangThai(pageNo, 5,khachHang.getId(),4);
        ModelAndView mav = new ModelAndView("/hoa-don/hoa-don-huy");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/thanh-toan/thanh-toan/*")
    public String thanhToanMua(HttpServletRequest request, Model model){

        String url = request.getRequestURI();
        String[] p = url.split("/thanh-toan/thanh-toan/");
        String id = p[1];

        HoaDon hd = hoaDonSer.findId(UUID.fromString(id));
        HoaDon hoaDon = new HoaDon();

        hoaDon.setMa(hd.getMa());
        hoaDon.setTongTien(hd.getTongTien());
        hoaDon.setNgayTao(hd.getNgayTao());
        hoaDon.setKhachHang(hd.getKhachHang());
        hoaDon.setTrangThai(1);

        hoaDonSer.update(hd.getId(),hoaDon);
        return "/hoa-don/thanh-cong";
    }

    @PostMapping("/hoa-don/mua/*")
    public String hoaDonMua(HttpServletRequest request, HttpSession session, Model model){
        String hinhThuc = request.getParameter("payment-method");
        String tongTien = request.getParameter("tongTien");
        String url = request.getRequestURI();
        String[] p = url.split("/hoa-don/mua/");
        String id = p[1];
        if (hinhThuc.equals("banking")){
            HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
            if (hoaDon.getTrangThai() == 0){
                session.setAttribute("thongBao","bạn chưa thanh toán");
                return "redirect:/hoa-don/"+id;
            }
        }else if (hinhThuc.equals("cash")){
            String diaChiChon = request.getParameter("diaChiChon");
            if(diaChiChon.equals("diaChiCu")){
                String sdt = request.getParameter("sdt");
                String diaChi = request.getParameter("diaChi");

                HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
                model.addAttribute("idKh", hoaDon.getKhachHang().getMa());
                HoaDon hd = new HoaDon();

                hd.setMa(hoaDon.getMa());
                hd.setTongTien(BigDecimal.valueOf(Double.valueOf(tongTien)));
                hd.setNgayTao(hoaDon.getNgayTao());
                hd.setKhachHang(hoaDon.getKhachHang());
                hd.setTrangThai(1);
                hd.setMoTa("Sđt nhận hàng: "+ sdt + " , Địa chỉ giao hàng" + diaChi);
                hoaDonSer.update(hoaDon.getId(),hd);
                return "/hoa-don/thanh-cong";
            }else if (diaChiChon.equals("diaChiMoi")){
                String sdt = request.getParameter("sdt");
                String diaChi = request.getParameter("diaChi");
                HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(id));
                model.addAttribute("idKh", hoaDon.getKhachHang().getMa());
                HoaDon hd = new HoaDon();

                hd.setMa(hoaDon.getMa());
                hd.setTongTien(BigDecimal.valueOf(Double.valueOf(tongTien)));
                hd.setNgayTao(hoaDon.getNgayTao());
                hd.setKhachHang(hoaDon.getKhachHang());
                hd.setTrangThai(1);
                hd.setMoTa("Sđt nhận hàng: "+ sdt + " , Địa chỉ giao hàng" + diaChi);
                hoaDonSer.update(hoaDon.getId(),hd);
                return "/hoa-don/thanh-cong";
            }
        }
        return "redirect:/hoa-don/"+id;
    }

    @PostMapping("/hoa-don/huy")
    public String huy(HttpServletRequest request){
        String huy = request.getParameter("huy");
        String idKh = request.getParameter("idKh");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(huy));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setTrangThai(4);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(),hd);
        return "redirect:/nguoi-dung/thong-tin/"+idKh;
    }

    @PostMapping("/hoa-don/thanh-cong")
    public String thanhCong(HttpServletRequest request){
        String thanhCong = request.getParameter("thanhCong");
        String idKh = request.getParameter("idKh");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(thanhCong));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setTrangThai(3);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(),hd);
        return "redirect:/nguoi-dung/thong-tin/"+idKh;
    }

    @PostMapping("/hoa-don/xac-nhan")
    public String xacNhan(HttpServletRequest request){
        String huy = request.getParameter("huy");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(huy));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setTrangThai(2);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(),hd);
        return "redirect:/trang-chu";
    }

    @PostMapping("/hoa-don/amin-thanh-cong")
    public String aminThanhCong(HttpServletRequest request){
        String thanhCong = request.getParameter("thanhCong");

        HoaDon hoaDon = hoaDonSer.findId(UUID.fromString(thanhCong));
        HoaDon hd = new HoaDon();

        hd.setMa(hoaDon.getMa());
        hd.setTongTien(hoaDon.getTongTien());
        hd.setNgayTao(hoaDon.getNgayTao());
        hd.setKhachHang(hoaDon.getKhachHang());
        hd.setTrangThai(3);
        hd.setMoTa(hoaDon.getMoTa());
        hoaDonSer.update(hoaDon.getId(),hd);
        return "redirect:/trang-chu";
    }
}
