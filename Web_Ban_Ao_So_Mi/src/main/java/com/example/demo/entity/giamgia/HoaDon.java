package com.example.demo.entity.giamgia;

import com.example.demo.entity.khachhang.KhachHang;
import com.example.demo.entity.nhanvien.nhanVien;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "hoa_don")
public class HoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    UUID id;

    @Column(name = "ma")
    String ma;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_nhan_vien",referencedColumnName = "id")
    nhanVien nhanVien;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_khach_hang",referencedColumnName = "id")
    KhachHang khachHang;

    @Column(name = "ngay_tao")
    Date ngayTao;

    @Column(name = "ngay_thanh_toan")
    Date ngayThanhToan;

    @Column(name = "mo_ta")
    String moTa;

    @Column(name = "tong_tien")
    BigDecimal tongTien;

    @Column(name = "trangthai")
    int trangThai;
}
