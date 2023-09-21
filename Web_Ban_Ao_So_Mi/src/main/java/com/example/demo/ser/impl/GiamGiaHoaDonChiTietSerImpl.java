package com.example.demo.ser.impl;

import com.example.demo.entity.giamgia.GiamGiaHoaDonChiTiet;
import com.example.demo.repo.giamgia.GiamGiaHoaDonChiTietRepo;
import com.example.demo.ser.GiamGiaHoaDonChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GiamGiaHoaDonChiTietSerImpl implements GiamGiaHoaDonChiTietSer {

    @Autowired
    GiamGiaHoaDonChiTietRepo giamGiaHoaDonChiTietRepo;

    @Override
    public void add(GiamGiaHoaDonChiTiet giamGiaHoaDonChiTiet) {
        giamGiaHoaDonChiTietRepo.save(giamGiaHoaDonChiTiet);
    }
}
