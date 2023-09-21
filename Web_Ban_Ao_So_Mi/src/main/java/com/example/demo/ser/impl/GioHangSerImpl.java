package com.example.demo.ser.impl;

import com.example.demo.entity.giohang.GioHang;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.entity.sanpham.Size;
import com.example.demo.repo.giohang.GioHangRepo;
import com.example.demo.ser.GioHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class GioHangSerImpl implements GioHangSer {
    @Autowired
    GioHangRepo gioHangRepo;

    @Override
    public List<Ao_chi_tiet> findByIdAo(UUID id) {
        return gioHangRepo.findByIdAo(id);
    }

    @Override
    public GioHang findByIdKH(UUID id) {
        return gioHangRepo.findByIdKH(id);
    }

    @Override
    public void add(GioHang gioHang) {
        gioHangRepo.save(gioHang);
    }
}
