package com.example.demo.entity.giamgia;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
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
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Entity
@Table(name = "chuong_trinh_giam_gia_chi_tiet_san_pham")
public class GiamGiaSanPhamChiTiet {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    UUID id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_pggsp",referencedColumnName = "id")
    GiamGiaSanPham giamGiaSanPham;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_sp",referencedColumnName = "id")
    Ao ao;

    @Column(name = "so_tien_da_giam")
    BigDecimal soTienDaGiam;

    @Column(name = "trangthai")
    int trangThai;
}
