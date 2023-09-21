package com.example.demo.ser.impl;

import com.example.demo.entity.giamgia.HoaDonChiTiet;
import com.example.demo.repo.giamgia.HoaDonChiTietRepo;
import com.example.demo.ser.HoaDonChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class HoaDonChiTietSerImpl implements HoaDonChiTietSer {

    @Autowired
    HoaDonChiTietRepo hoaDonChiTietRepo;

    @Override
    public void add(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietRepo.save(hoaDonChiTiet);
    }

    @Override
    public List<HoaDonChiTiet> findByHoaDon(UUID id) {
        return hoaDonChiTietRepo.findByHoaDon(id);
    }
}
