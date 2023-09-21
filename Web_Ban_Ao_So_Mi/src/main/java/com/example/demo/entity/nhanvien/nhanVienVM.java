package com.example.demo.entity.nhanvien;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.util.UUID;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
public class nhanVienVM {

    private UUID id;
    @NotBlank(message = "Không Để trống")
    private String ma;
    @NotBlank(message = "Không Để trống")
    private String ten;
    @NotNull(message = "Trường không được trống")
    private String ngay_sinh;
    @NotBlank(message = "Không Để trống")
    private String dia_chi;
    @NotBlank(message = "Không Để trống")
    private String thanh_pho;
    @NotBlank(message = "Không Để trống")
    private String quoc_gia;
    @NotBlank(message = "Không Để trống")
    private String sdt;
    @NotBlank(message = "Không Để trống")
    private String email;
    @NotNull(message = "Không Để trống")
    private chucVu cv;
    @NotBlank(message = "Không Để trống")
    private String mat_khau;
    @NotNull(message = "Không Để trống")
    private Integer trang_thai;
    public void loadView(nhanVien nv){
        this.setMa(nv.getMa());
        this.setTen(nv.getTen());
        this.setNgay_sinh(String.valueOf(nv.getNgay_sinh()));
        this.setDia_chi(nv.getDia_chi());
        this.setThanh_pho(nv.getThanh_pho());
        this.setQuoc_gia(nv.getQuoc_gia());
        this.setSdt(nv.getSdt());
        this.setEmail(nv.getEmail());
        this.setCv(nv.getCv());
        this.setMat_khau(nv.getMat_khau());
        this.setTrang_thai(Integer.valueOf(nv.getTrang_thai()));
    }
}
