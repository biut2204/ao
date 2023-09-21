package com.example.demo.ser;

import com.example.demo.entity.giamgia.HoaDonChiTiet;

import java.util.List;
import java.util.UUID;

public interface HoaDonChiTietSer {
    void add(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> findByHoaDon(UUID id);
}
