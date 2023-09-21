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

import java.util.Date;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chuong_tring_giam_gia_san_pham")
public class GiamGiaSanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    UUID id;

    @Column(name = "ma")
    String ma;

    @Column(name = "ten")
    String ten;

    @Column(name = "phan_tram_giam")
    int phanTramGiam;

    @Column(name = "ngay_bat_dau")
    Date ngayBatDau;

    @Column(name = "ngay_ket_thuc")
    Date ngayKetThuc;

    @Column(name = "trangthai")
    int trangThai;
}
