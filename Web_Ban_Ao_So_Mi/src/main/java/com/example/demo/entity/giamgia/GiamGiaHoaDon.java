package com.example.demo.entity.giamgia;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
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
@Table(name = "chuong_tring_giam_gia_hoa_don")
public class GiamGiaHoaDon {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    UUID id;

    @Column(name = "ma")
    String ma;

    @Column(name = "ten")
    String ten;

    @Column(name = "so_luong_san_pham")
    int soLuongSanPham;

    @Column(name = "so_tien_hoa_don")
    BigDecimal soTienHoaDon;

    @Column(name = "phan_tram_giam")
    int phanTramGiam;

    @Column(name = "ngay_bat_dau")
    Date ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    Date ngayKetThuc;

    @Column(name = "trangthai")
    int trangThai;
}
