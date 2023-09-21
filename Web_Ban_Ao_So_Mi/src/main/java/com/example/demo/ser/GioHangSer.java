package com.example.demo.ser;

import com.example.demo.entity.giohang.GioHang;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.entity.sanpham.Size;

import java.util.List;
import java.util.UUID;

public interface GioHangSer {
    List<Ao_chi_tiet> findByIdAo(UUID id);

    GioHang findByIdKH(UUID id);

    void add(GioHang gioHang);
}
