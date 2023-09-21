package com.example.demo.ser.impl;

import com.example.demo.entity.giohang.GioHangChiTiet;
import com.example.demo.repo.giohang.GioHangChiTietRepo;
import com.example.demo.ser.GioHangChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GioHangChiTietSerImpl implements GioHangChiTietSer {

    @Autowired
    GioHangChiTietRepo gioHangChiTietRepo;

    @Override
    public List<GioHangChiTiet> getAll() {
        return gioHangChiTietRepo.findAll();
    }

    @Override
    public void add(GioHangChiTiet gioHangChiTiet) {
        gioHangChiTietRepo.save(gioHangChiTiet);
    }

    @Override
    public Page<GioHangChiTiet> view(UUID idGH, Integer pageNo, Integer size) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return gioHangChiTietRepo.findByIdGH(idGH, pageable);
    }

    @Override
    public void update(UUID id, GioHangChiTiet update) {
        Optional<GioHangChiTiet> optionalGioHangChiTiet = gioHangChiTietRepo.findById(id);
        if (!optionalGioHangChiTiet.isPresent()) {
            throw new RuntimeException("...,");
        }

        GioHangChiTiet gioHangChiTiet = optionalGioHangChiTiet.get();
        gioHangChiTiet.setGioHang(update.getGioHang());
        gioHangChiTiet.setAoChiTiet(update.getAoChiTiet());
        gioHangChiTiet.setSoLuong(update.getSoLuong());
        gioHangChiTiet.setDonGia(update.getDonGia());
        gioHangChiTiet.setTrangThai(update.getTrangThai());
        gioHangChiTietRepo.save(gioHangChiTiet);
    }

    @Override
    public GioHangChiTiet findById(UUID id) {
        Optional<GioHangChiTiet> optionalGioHangChiTiet = gioHangChiTietRepo.findById(id);
        return optionalGioHangChiTiet.orElse(null);
    }
}
