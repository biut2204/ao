package com.example.demo.ser.impl;

import com.example.demo.entity.khachhang.KhachHang;
import com.example.demo.repo.khachhang.KhachHangRepo;
import com.example.demo.ser.KhachHangSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class KhachHangSerImpl implements KhachHangSer {

    @Autowired
    KhachHangRepo khachHangRepo;

    @Override
    public List<KhachHang> getAll() {
        return khachHangRepo.findAll();
    }

    @Override
    public KhachHang findById(UUID id) {
        Optional<KhachHang> optionalKhachHang = khachHangRepo.findById(id);
        return optionalKhachHang.orElse(null);
    }

    @Override
    public KhachHang findByEmailAndMatKhau(String email, String matKhau) {
        return khachHangRepo.findByEmailAndMatKhau(email, matKhau);
    }

    @Override
    public KhachHang findByMa(String ma) {
        return khachHangRepo.findByMa(ma);
    }

    @Override
    public void add(KhachHang khachHang) {
        khachHangRepo.save(khachHang);
    }

    @Override
    public void update(UUID id, KhachHang update) {
        Optional<KhachHang> optionalKhachHang = khachHangRepo.findById(id);
        if (optionalKhachHang.isPresent()){
            KhachHang khachHang = optionalKhachHang.get();
            khachHang.setMa(update.getMa());
            khachHang.setTen(update.getTen());
            khachHang.setNgay_sinh(update.getNgay_sinh());
            khachHang.setDia_chi(update.getDia_chi());
            khachHang.setThanh_pho(update.getThanh_pho());
            khachHang.setQuoc_gia(update.getQuoc_gia());
            khachHang.setSdt(update.getSdt());
            khachHang.setEmail(update.getEmail());
            khachHang.setMatKhau(update.getMatKhau());
            khachHang.setTrangThai(update.getTrangThai());
            khachHangRepo.save(khachHang);
        }
    }

    @Override
    public KhachHang findByEmail(String email) {
        return khachHangRepo.findByEmail(email);
    }
}
