package com.example.demo.controller.trangchu;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.giamgia.HoaDon;
import com.example.demo.entity.giamgia.HoaDonChiTiet;
import com.example.demo.entity.giohang.GioHang;
import com.example.demo.entity.giohang.GioHangChiTiet;
import com.example.demo.entity.khachhang.KhachHang;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.repo.sanpham.AnhDAO;
import com.example.demo.repo.sanpham.AoDAO;
import com.example.demo.repo.sanpham.Ao_chi_tietDAO;
import com.example.demo.repo.sanpham.Chat_vaiDAO;
import com.example.demo.repo.sanpham.Co_aoDAO;
import com.example.demo.repo.sanpham.Cuc_aoDAO;
import com.example.demo.repo.sanpham.FormDAO;
import com.example.demo.repo.sanpham.HangDAO;
import com.example.demo.repo.sanpham.Hoa_tietDAO;
import com.example.demo.repo.sanpham.Huong_dan_bao_quanDAO;
import com.example.demo.repo.sanpham.Mau_sacDAO;
import com.example.demo.repo.sanpham.Nep_che_aoDAO;
import com.example.demo.repo.sanpham.SizeDAO;
import com.example.demo.repo.sanpham.Tay_aoDAO;
import com.example.demo.repo.sanpham.Tui_aoDAO;
import com.example.demo.ser.AoChiTietSer;
import com.example.demo.ser.GiamGiaHoaDonSer;
import com.example.demo.ser.GiamGiaSanPhamChiTietSer;
import com.example.demo.ser.GiamGiaSanPhamSer;
import com.example.demo.ser.GioHangChiTietSer;
import com.example.demo.ser.GioHangSer;
import com.example.demo.ser.HoaDonChiTietSer;
import com.example.demo.ser.HoaDonSer;
import com.example.demo.ser.KhachHangSer;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.mail.javamail.JavaMailSender;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class TrangChu {

    @Autowired
    JavaMailSender mailSender;

    @Autowired
    AoDAO aoDAO;

    @Autowired
    Ao_chi_tietDAO ao_chi_tietDAO;

    @Autowired
    AoChiTietSer aoChiTietSer;

    @Autowired
    GiamGiaSanPhamSer giamGiaSanPhamSer;

    @Autowired
    GiamGiaHoaDonSer giamGiaHoaDonSer;

    @Autowired
    GiamGiaSanPhamChiTietSer giamGiaSanPhamChiTietSer;

    @Autowired
    KhachHangSer khachHangSer;

    @Autowired
    GioHangChiTietSer gioHangChiTietSer;

    @Autowired
    GioHangSer gioHangSer;

    @Autowired
    HoaDonSer hoaDonSer;

    @Autowired
    HoaDonChiTietSer hoaDonChiTietSer;

    @Autowired
    Chat_vaiDAO chat_vaiDAO;

    @Autowired
    Co_aoDAO co_aoDAO;

    @Autowired
    Cuc_aoDAO cuc_aoDAO;

    @Autowired
    FormDAO formDAO;

    @Autowired
    HangDAO hangDAO;

    @Autowired
    Hoa_tietDAO hoa_tietDAO;

    @Autowired
    Nep_che_aoDAO nep_che_aoDAO;

    @Autowired
    Tay_aoDAO tay_aoDAO;

    @Autowired
    Tui_aoDAO tui_aoDAO;

    @Autowired
    Mau_sacDAO mau_sacDAO;

    @Autowired
    SizeDAO sizeDAO;

    @Autowired
    Huong_dan_bao_quanDAO huong_dan_bao_quanDAO;

    @Autowired
    AnhDAO anhDAO;

    @GetMapping("/nguoi-dung/trang-chu/*")
    public ModelAndView trangChu(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/trang-chu/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        model.addAttribute("top5", aoDAO.findTop5ByOrderByMaAsc());
        model.addAttribute("top10", aoDAO.findTop10ByOrderByMaAsc());
        model.addAttribute("items", aoDAO.findAll());

        Page<GiamGiaSanPhamChiTiet> page = giamGiaSanPhamChiTietSer.view1(0, pageNo, 5);
        ModelAndView mav = new ModelAndView("/trang-chu/trang-chu");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/trang-chu/thong-tin-san-pham/*/*")
    public String thongTinSanPham(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/trang-chu/thong-tin-san-pham/");
        String idStr = p[1];
        String[] idSt = idStr.split("/");
        String id = idSt[1];
        if (idSt[0].equalsIgnoreCase("2")) {
            model.addAttribute("idKh", "2");
        } else {
            model.addAttribute("idKh", idSt[0]);
        }

        try {
            List<GiamGiaSanPhamChiTiet> listGiamGiaSanPhamChiTiet = giamGiaSanPhamChiTietSer.findByIdAo(UUID.fromString(id));
            for (GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet : listGiamGiaSanPhamChiTiet) {
                if (giamGiaSanPhamChiTiet.getTrangThai() == 0) {
                    model.addAttribute("giamgia", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getPhanTramGiam());
                    model.addAttribute("time", giamGiaSanPhamChiTiet.getGiamGiaSanPham().getNgayKetThuc());
                } else {
                    model.addAttribute("giamgia", "0");
                }
            }
            model.addAttribute("ao", aoDAO.findId(UUID.fromString(id)));
            model.addAttribute("itemsdetail", ao_chi_tietDAO.getAllByMaAo(aoDAO.findId(UUID.fromString(id)).getMa()));
            model.addAttribute("top5", aoDAO.findTop5ByOrderByMaAsc());
        } catch (Exception e) {
            model.addAttribute("giamgia", null);
            model.addAttribute("ao", aoDAO.findId(UUID.fromString(id)));
            model.addAttribute("itemsdetail", ao_chi_tietDAO.getAllByMaAo(aoDAO.findId(UUID.fromString(id)).getMa()));
            model.addAttribute("top5", aoDAO.findTop5ByOrderByMaAsc());

        }
        return "/trang-chu/thong-tin-san-pham";
    }

    @GetMapping("/nguoi-dung/thong-tin-cua-hang/*")
    public String thongTinCuaHang(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/thong-tin-cua-hang/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/thong-tin-cua-hang";
    }

    @GetMapping("/nguoi-dung/blog/*")
    public String blog(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/blog/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/blog";
    }

    @GetMapping("/nguoi-dung/view-dang-nhap/*")
    public String viewDangNhap(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/nguoi-dung/view-dang-nhap/");
        String idStr = p[1];
        if (idStr.equalsIgnoreCase("2")) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/dang-nhap";
    }

    @GetMapping("/nguoi-dung/view-dang-ki/*")
    public String viewDangKi(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/nguoi-dung/view-dang-ki/");
        String idStr = p[1];
        if (idStr.equalsIgnoreCase("2")) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/dang-ki";
    }

    @GetMapping("/nguoi-dung/view-quen-mat-khau/*")
    public String viewQuenMatKhau(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/nguoi-dung/view-quen-mat-khau/");
        String idStr = p[1];
        if (idStr.equalsIgnoreCase("2")) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/quen-mat-khau";
    }

    @GetMapping("/nguoi-dung/doi-mat-khau/*")
    public String viewDoiMatKhau(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/nguoi-dung/doi-mat-khau/");
        String idStr = p[1];
        if (idStr.equalsIgnoreCase("2")) {
            model.addAttribute("idKh", "2");
        } else {
            model.addAttribute("idKh", idStr);
        }
        return "/trang-chu/doi-mat-khau";
    }

    @GetMapping("/nguoi-dung/view-gio-hang/*")
    public ModelAndView viewGioHang(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/view-gio-hang/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        KhachHang khachHang = khachHangSer.findByMa(ma);
        GioHang gioHang = gioHangSer.findByIdKH(khachHang.getId());

        Page<GioHangChiTiet> page = gioHangChiTietSer.view(gioHang.getId(), pageNo, 5);
        ModelAndView mav = new ModelAndView("/trang-chu/gio-hang");
        mav.addObject("page", page);
        return mav;
    }

    @GetMapping("/nguoi-dung/thong-tin/*")
    public String viewThongTin(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/thong-tin/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }
        return "/trang-chu/thong-tin";
    }

    @PostMapping("/nguoi-dung/tim-kiem/*")
    public ModelAndView viewTrangChuTimKiem(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/tim-kiem/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        model.addAttribute("listChatVai", chat_vaiDAO.findAll());
        model.addAttribute("listCoAo", co_aoDAO.findAll());
        model.addAttribute("listCucAo", cuc_aoDAO.findAll());
        model.addAttribute("listForm", formDAO.findAll());
        model.addAttribute("listHang", hangDAO.findAll());
        model.addAttribute("listHoaTiet", hoa_tietDAO.findAll());
        model.addAttribute("listMauSac", mau_sacDAO.findAll());
        model.addAttribute("listNepCheAo", nep_che_aoDAO.findAll());
        model.addAttribute("listSize", sizeDAO.findAll());
        model.addAttribute("listTayAo", tay_aoDAO.findAll());
        model.addAttribute("listTuiAo", tui_aoDAO.findAll());

        String timKiem = request.getParameter("timKiem");
        model.addAttribute("tk", timKiem);
        if (timKiem.length() == 0) {
            model.addAttribute("items", aoDAO.findAll());
            model.addAttribute("loc", "0");
        } else {
            model.addAttribute("items", aoDAO.findByTen(timKiem));
            model.addAttribute("loc", "1");
        }

        ModelAndView mav = new ModelAndView("/trang-chu/trang-chu-tim-kiem");
        return mav;
    }

    @PostMapping("/nguoi-dung/loc/*")
    public ModelAndView loc(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/loc/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        model.addAttribute("listChatVai", chat_vaiDAO.findAll());
        model.addAttribute("listCoAo", co_aoDAO.findAll());
        model.addAttribute("listCucAo", cuc_aoDAO.findAll());
        model.addAttribute("listForm", formDAO.findAll());
        model.addAttribute("listHang", hangDAO.findAll());
        model.addAttribute("listHoaTiet", hoa_tietDAO.findAll());
        model.addAttribute("listMauSac", mau_sacDAO.findAll());
        model.addAttribute("listNepCheAo", nep_che_aoDAO.findAll());
        model.addAttribute("listSize", sizeDAO.findAll());
        model.addAttribute("listTayAo", tay_aoDAO.findAll());
        model.addAttribute("listTuiAo", tui_aoDAO.findAll());

        String chatVai = request.getParameter("chatVai");
        String coAo = request.getParameter("coAo");
        String cucAo = request.getParameter("cucAo");
        String form = request.getParameter("form");
        String hang = request.getParameter("hang");
        String hoaTiet = request.getParameter("hoaTiet");
        String mauSac = request.getParameter("mauSac");
        String nepCheAo = request.getParameter("nepCheAo");
        String size = request.getParameter("size");
        String tayAo = request.getParameter("tayAo");
        String tuiAo = request.getParameter("tuiAo");

        UUID chatVaiUUID = (chatVai != null) ? UUID.fromString(chatVai) : null;
        UUID coAoUUID = (coAo != null) ? UUID.fromString(coAo) : null;
        UUID cucAoUUID = (cucAo != null) ? UUID.fromString(cucAo) : null;
        UUID formUUID = (form != null) ? UUID.fromString(form) : null;
        UUID hangUUID = (hang != null) ? UUID.fromString(hang) : null;
        UUID hoaTietUUID = (hoaTiet != null) ? UUID.fromString(hoaTiet) : null;
        UUID mauSacUUID = (mauSac != null) ? UUID.fromString(mauSac) : null;
        UUID nepCheAoUUID = (nepCheAo != null) ? UUID.fromString(nepCheAo) : null;
        UUID sizeUUID = (size != null) ? UUID.fromString(size) : null;
        UUID tayAoUUID = (tayAo != null) ? UUID.fromString(tayAo) : null;
        UUID tuiAoUUID = (tuiAo != null) ? UUID.fromString(tuiAo) : null;

        model.addAttribute("chatVaiUUID", chatVaiUUID);
        model.addAttribute("coAoUUID", coAoUUID);
        model.addAttribute("cucAoUUID", cucAoUUID);
        model.addAttribute("formUUID", formUUID);
        model.addAttribute("hangUUID", hangUUID);
        model.addAttribute("hoaTietUUID", hoaTietUUID);
        model.addAttribute("mauSacUUID", mauSacUUID);
        model.addAttribute("nepCheAoUUID", nepCheAoUUID);
        model.addAttribute("sizeUUID", sizeUUID);
        model.addAttribute("tayAoUUID", tayAoUUID);
        model.addAttribute("tuiAoUUID", tuiAoUUID);

        model.addAttribute("items", aoDAO.findByuKien(chatVaiUUID, coAoUUID, hoaTietUUID, tuiAoUUID, tayAoUUID, cucAoUUID, formUUID, hangUUID, nepCheAoUUID));
        model.addAttribute("loc", "2");
        ModelAndView mav = new ModelAndView("/trang-chu/trang-chu-tim-kiem");
        return mav;
    }

    @PostMapping("/nguoi-dung/nang-cao/*")
    public ModelAndView nangCao(@RequestParam(value = "pageNo", required = false, defaultValue = "0") Integer pageNo, HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/nang-cao/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        model.addAttribute("listChatVai", chat_vaiDAO.findAll());
        model.addAttribute("listCoAo", co_aoDAO.findAll());
        model.addAttribute("listCucAo", cuc_aoDAO.findAll());
        model.addAttribute("listForm", formDAO.findAll());
        model.addAttribute("listHang", hangDAO.findAll());
        model.addAttribute("listHoaTiet", hoa_tietDAO.findAll());
        model.addAttribute("listMauSac", mau_sacDAO.findAll());
        model.addAttribute("listNepCheAo", nep_che_aoDAO.findAll());
        model.addAttribute("listSize", sizeDAO.findAll());
        model.addAttribute("listTayAo", tay_aoDAO.findAll());
        model.addAttribute("listTuiAo", tui_aoDAO.findAll());

        String chatVai = request.getParameter("chatVai");
        String coAo = request.getParameter("coAo");
        String cucAo = request.getParameter("cucAo");
        String form = request.getParameter("form");
        String hang = request.getParameter("hang");
        String hoaTiet = request.getParameter("hoaTiet");
        String mauSac = request.getParameter("mauSac");
        String nepCheAo = request.getParameter("nepCheAo");
        String size = request.getParameter("size");
        String tayAo = request.getParameter("tayAo");
        String tuiAo = request.getParameter("tuiAo");
        String sapXep = request.getParameter("sapXep");
        String loc = request.getParameter("loc");

        UUID chatVaiUUID = (chatVai != null) ? UUID.fromString(chatVai) : null;
        UUID coAoUUID = (coAo != null) ? UUID.fromString(coAo) : null;
        UUID cucAoUUID = (cucAo != null) ? UUID.fromString(cucAo) : null;
        UUID formUUID = (form != null) ? UUID.fromString(form) : null;
        UUID hangUUID = (hang != null) ? UUID.fromString(hang) : null;
        UUID hoaTietUUID = (hoaTiet != null) ? UUID.fromString(hoaTiet) : null;
        UUID mauSacUUID = (mauSac != null) ? UUID.fromString(mauSac) : null;
        UUID nepCheAoUUID = (nepCheAo != null) ? UUID.fromString(nepCheAo) : null;
        UUID sizeUUID = (size != null) ? UUID.fromString(size) : null;
        UUID tayAoUUID = (tayAo != null) ? UUID.fromString(tayAo) : null;
        UUID tuiAoUUID = (tuiAo != null) ? UUID.fromString(tuiAo) : null;

        model.addAttribute("chatVaiUUID", chatVaiUUID);
        model.addAttribute("coAoUUID", coAoUUID);
        model.addAttribute("cucAoUUID", cucAoUUID);
        model.addAttribute("formUUID", formUUID);
        model.addAttribute("hangUUID", hangUUID);
        model.addAttribute("hoaTietUUID", hoaTietUUID);
        model.addAttribute("mauSacUUID", mauSacUUID);
        model.addAttribute("nepCheAoUUID", nepCheAoUUID);
        model.addAttribute("sizeUUID", sizeUUID);
        model.addAttribute("tayAoUUID", tayAoUUID);
        model.addAttribute("tuiAoUUID", tuiAoUUID);

        if (loc.equals("0")) {
            if (sapXep.equals("thapcao")) {
                List<Ao> sortedByPriceAscending = aoDAO.findAll();
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban));
                model.addAttribute("items", sortedByPriceAscending);
            } else {
                List<Ao> sortedByPriceAscending = aoDAO.findAll();
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban).reversed());
                model.addAttribute("items", sortedByPriceAscending);
            }
            model.addAttribute("loc", "0");

        } else if (loc.equals("1")) {
            String timKiem = request.getParameter("tk");
            if (sapXep.equals("thapcao")) {
                List<Ao> sortedByPriceAscending = aoDAO.findByTen(timKiem);
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban));
                model.addAttribute("items", sortedByPriceAscending);
            } else {
                List<Ao> sortedByPriceAscending = aoDAO.findByTen(timKiem);
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban).reversed());
                model.addAttribute("items", sortedByPriceAscending);
            }
            model.addAttribute("loc", "1");
            model.addAttribute("tk", timKiem);
        } else if (loc.equals("2")) {
            if (sapXep.equals("thapcao")) {
                List<Ao> sortedByPriceAscending = aoDAO.findByuKien(chatVaiUUID, coAoUUID, hoaTietUUID, tuiAoUUID, tayAoUUID, cucAoUUID, formUUID, hangUUID, nepCheAoUUID);
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban));
                model.addAttribute("items", sortedByPriceAscending);
            } else {
                List<Ao> sortedByPriceAscending = aoDAO.findByuKien(chatVaiUUID, coAoUUID, hoaTietUUID, tuiAoUUID, tayAoUUID, cucAoUUID, formUUID, hangUUID, nepCheAoUUID);
                Collections.sort(sortedByPriceAscending, Comparator.comparing(Ao::getGiaban).reversed());
                model.addAttribute("items", sortedByPriceAscending);
            }
            model.addAttribute("loc", "2");
        }
        ModelAndView mav = new ModelAndView("/trang-chu/trang-chu-tim-kiem");
        return mav;
    }

    @PostMapping("/nguoi-dung/dang-nhap")
    public String dangNhap(HttpServletRequest request, Model model) {
        String tk = request.getParameter("tk");
        String mk = request.getParameter("mk");
        try {
            KhachHang khachHang = khachHangSer.findByEmailAndMatKhau(tk, mk);
            return "redirect:/nguoi-dung/trang-chu/" + khachHang.getMa() + "?pageNo=0";
        } catch (Exception e) {
            model.addAttribute("loi", "tai khoan mat khau ko dung");
            return "/trang-chu/dang-nhap";
        }
    }

    @PostMapping("/nguoi-dung/dang-ki")
    public String dangKi(HttpServletRequest request, Model model) {
        LocalTime now = LocalTime.now();
        LocalDate currentDate = LocalDate.now();

        String ten = request.getParameter("ten");
        String ngaySinhStr = request.getParameter("ngaySinh");
        String quocGia = request.getParameter("quocGia");
        String thanhPho = request.getParameter("thanhPho");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        String matKhau = request.getParameter("matKhau");


        if (ten.length() == 0 || quocGia.length() == 0 || thanhPho.length() == 0 || diaChi.length() == 0 || sdt.length() == 0 || email.length() == 0 || matKhau.length() == 0) {
            model.addAttribute("loi", "điền đầy đủ thông tin");
            return "/trang-chu/dang-ki";
        } else {
            KhachHang khachHang = new KhachHang();
            khachHang.setMa("0" + currentDate.getDayOfMonth() + now.getHour() + now.getMinute() + now.getSecond());
            khachHang.setTen(ten);
            LocalDate ngaySinh = LocalDate.parse(ngaySinhStr);
            khachHang.setNgay_sinh(Date.from(ngaySinh.atStartOfDay(ZoneId.systemDefault()).toInstant()));
            khachHang.setDia_chi(diaChi);
            khachHang.setThanh_pho(thanhPho);
            khachHang.setQuoc_gia(quocGia);
            khachHang.setSdt(sdt);
            khachHang.setEmail(email);
            khachHang.setMatKhau(matKhau);
            khachHang.setTrangThai(1);
            khachHangSer.add(khachHang);

            GioHang gioHang = new GioHang();
            gioHang.setMa("0" + currentDate.getDayOfMonth() + now.getHour() + now.getMinute() + now.getSecond());
            gioHang.setKhachHang(khachHang);
            gioHang.setTrangThai(1);
            gioHangSer.add(gioHang);

            return "redirect:/nguoi-dung/view-dang-nhap/2";
        }
    }

    @PostMapping("/nguoi-dung/quen-mat-khau")
    public String quenMatKhau(HttpServletRequest request, Model model) {

        String email = request.getParameter("email");

        try {

            KhachHang khachHang = khachHangSer.findByEmail(email);

            int min = 100000;
            int max = 999999;
            int randomNumber = (int) (Math.random() * (max - min + 1) + min);

            KhachHang kh = new KhachHang();

            kh.setMa(khachHang.getMa());
            kh.setTen(khachHang.getTen());
            kh.setNgay_sinh(khachHang.getNgay_sinh());
            kh.setDia_chi(khachHang.getDia_chi());
            kh.setThanh_pho(khachHang.getThanh_pho());
            kh.setQuoc_gia(khachHang.getQuoc_gia());
            kh.setSdt(khachHang.getSdt());
            kh.setEmail(khachHang.getEmail());
            kh.setMatKhau(String.valueOf(randomNumber));
            kh.setTrangThai(khachHang.getTrangThai());

            khachHangSer.update(khachHang.getId(), kh);


            SimpleMailMessage message = new SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Mật khẩu mới của bạn");
            message.setText("Mật khẩu mới của bạn là :" + randomNumber);

            mailSender.send(message);
            return "redirect:/nguoi-dung/view-dang-nhap/2";
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
            model.addAttribute("loi", "email không đúng");
            return "/trang-chu/quen-mat-khau";
        }
    }

    @PostMapping("/nguoi-dung/gio-hang/*/*")
    public String themGioHang(HttpServletRequest request, Model model) {
        String url = request.getRequestURI();
        String[] p = url.split("/nguoi-dung/gio-hang/");
        String idStr = p[1];
        String[] idSt = idStr.split("/");
        String id = idSt[1];
        String maKh = idSt[0];

        String mauSac = request.getParameter("mauSac");
        String Size = request.getParameter("Size");
        String sl = request.getParameter("sl");
        String gia = request.getParameter("gia");

        Ao_chi_tiet aoChiTiet = aoChiTietSer.findIdByIdAo(UUID.fromString(id), UUID.fromString(mauSac), UUID.fromString(Size));

        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();

        gioHangChiTiet.setGioHang(gioHangSer.findByIdKH(khachHangSer.findByMa(maKh).getId()));
        gioHangChiTiet.setAoChiTiet(aoChiTiet);
        gioHangChiTiet.setSoLuong(Integer.parseInt(sl));
        gioHangChiTiet.setDonGia(BigDecimal.valueOf(Integer.parseInt(gia)).multiply(BigDecimal.valueOf(Integer.parseInt(sl))));

        gioHangChiTietSer.add(gioHangChiTiet);
        return "redirect:/nguoi-dung/view-gio-hang/" + maKh;
    }

    @PostMapping("/nguoi-dung/add-hoa-don/*")
    public String addHoaDon(HttpServletRequest request, Model model, @RequestParam(value = "chon", required = false) List<UUID> chon,
                            @RequestParam(value = "soLuong", required = false) List<String> soLuong,
                            @RequestParam(value = "donGia", required = false) List<String> donGia) {
        LocalTime now = LocalTime.now();
        String url = request.getRequestURI();
        String[] parts = url.split("/nguoi-dung/add-hoa-don/");
        String ma = parts[1];

        KhachHang khachHang = khachHangSer.findByMa(ma);

        int tongTien = 0;

        HoaDon hoaDon = new HoaDon();
        hoaDon.setMa("Ma" + now.getHour() + now.getMinute() + now.getSecond());
        hoaDon.setKhachHang(khachHang);
        hoaDon.setNgayTao(new Date());
        hoaDon.setTrangThai(0);
        for (int i = 0; i < chon.size(); i++) {
            tongTien += Integer.parseInt(donGia.get(i));
        }
        hoaDon.setTongTien(BigDecimal.valueOf(tongTien));

        hoaDonSer.add(hoaDon);

        if (chon != null) {
            for (int i = 0; i < chon.size(); i++) {
                HoaDonChiTiet hoaDonChiTiet = new HoaDonChiTiet();
                hoaDonChiTiet.setHoaDon(hoaDon);
                hoaDonChiTiet.setAoChiTiet(aoChiTietSer.findId(chon.get(i)));
                hoaDonChiTiet.setSoLuong(Integer.parseInt(soLuong.get(i)));
                hoaDonChiTiet.setDonGia(BigDecimal.valueOf(Integer.parseInt(donGia.get(i))));
                hoaDonChiTietSer.add(hoaDonChiTiet);
            }
        }
        return "redirect:/hoa-don/" + hoaDon.getId();
    }

    @PostMapping("/nguoi-dung/an-doi-mat-khau")
    public String anDoiMatKhau(HttpServletRequest request, Model model) {
        String maKh = request.getParameter("maKh");
        String mkc = request.getParameter("mkc");
        String mkm1 = request.getParameter("mkm1");
        String mkm2 = request.getParameter("mkm2");

        KhachHang khachHang = khachHangSer.findByMa(maKh);

        KhachHang kh = new KhachHang();

        kh.setMa(khachHang.getMa());
        kh.setTen(khachHang.getTen());
        kh.setNgay_sinh(khachHang.getNgay_sinh());
        kh.setDia_chi(khachHang.getDia_chi());
        kh.setThanh_pho(khachHang.getThanh_pho());
        kh.setQuoc_gia(khachHang.getQuoc_gia());
        kh.setSdt(khachHang.getSdt());
        kh.setEmail(khachHang.getEmail());
        kh.setMatKhau(mkm2);
        kh.setTrangThai(khachHang.getTrangThai());

        khachHangSer.update(khachHang.getId(), kh);
        model.addAttribute("idKh", maKh);

        return "redirect:/hoa-don/cho-thanh-toan/" + maKh;

    }

    @PostMapping("/gio-hang/clear/*")
    public String clearGioHang(HttpServletRequest request,Model model) {

        String url = request.getRequestURI();
        String[] parts = url.split("/gio-hang/clear/");
        String ma = parts[1];

        try {
            KhachHang khachHang = khachHangSer.findByMa(ma);
            model.addAttribute("idKh", khachHang.getMa());
        } catch (Exception e) {
            model.addAttribute("idKh", "2");
        }

        String clear = request.getParameter("clear");

        GioHangChiTiet gioHangChiTiet = gioHangChiTietSer.findById(UUID.fromString(clear));

        GioHangChiTiet ghChiTiet = new GioHangChiTiet();
        ghChiTiet.setGioHang(gioHangChiTiet.getGioHang());
        ghChiTiet.setAoChiTiet(gioHangChiTiet.getAoChiTiet());
        ghChiTiet.setSoLuong(gioHangChiTiet.getSoLuong());
        ghChiTiet.setDonGia(gioHangChiTiet.getDonGia());
        ghChiTiet.setTrangThai(1);

        gioHangChiTietSer.update(gioHangChiTiet.getId(), ghChiTiet);

        return "redirect:/nguoi-dung/view-gio-hang/" +ma;
    }
}
