package com.example.demo.ser;

import com.example.demo.entity.khachhang.KhachHang;

import java.util.List;
import java.util.UUID;

public interface KhachHangSer {

    List<KhachHang> getAll();

    KhachHang findById(UUID id);

    KhachHang findByEmailAndMatKhau(String email, String matKhau);

    KhachHang findByMa(String ma);

    void add(KhachHang khachHang);

    void update(UUID id, KhachHang update);

    KhachHang findByEmail(String email);
}
