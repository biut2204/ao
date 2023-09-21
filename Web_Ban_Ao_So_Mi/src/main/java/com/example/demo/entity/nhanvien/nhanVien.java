package com.example.demo.entity.nhanvien;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;
import java.util.UUID;

@Entity
@Table(name = "nhan_vien")
@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class nhanVien {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "ngay_sinh")
    private Date ngay_sinh;

    @Column(name = "dia_chi")
    private String dia_chi;

    @Column(name = "thanh_pho")
    private String thanh_pho;

    @Column(name = "quoc_gia")
    private String quoc_gia;

    @Column(name = "sdt")
    private String sdt;

    @Column(name = "email")
    private String email;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(
            name = "id_chuc_vu",
            referencedColumnName = "id",
            nullable = false
    )
    private chucVu cv;
    @Column(name = "mat_khau")
    private String mat_khau;

    @Column(name = "trangthai")
    private Integer trang_thai;
    public void loadView(nhanVienVM nvVM){
        this.setMa(nvVM.getMa());
        this.setTen(nvVM.getTen());
        this.setNgay_sinh(Date.valueOf(nvVM.getNgay_sinh()));
        this.setDia_chi(nvVM.getDia_chi());
        this.setThanh_pho(nvVM.getThanh_pho());
        this.setQuoc_gia(nvVM.getQuoc_gia());
        this.setSdt(nvVM.getSdt());
        this.setEmail(nvVM.getEmail());
        this.setCv(nvVM.getCv());
        this.setMat_khau(nvVM.getMat_khau());
        this.setTrang_thai(Integer.valueOf(nvVM.getTrang_thai()));
    }
}
