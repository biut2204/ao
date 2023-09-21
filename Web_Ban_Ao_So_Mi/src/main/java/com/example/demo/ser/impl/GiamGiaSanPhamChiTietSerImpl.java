package com.example.demo.ser.impl;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.repo.giamgia.GiamGiaSanPhamChiTietRepo;
import com.example.demo.ser.GiamGiaSanPhamChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class GiamGiaSanPhamChiTietSerImpl implements GiamGiaSanPhamChiTietSer {

    @Autowired
    GiamGiaSanPhamChiTietRepo giamGiaSanPhamChiTietRepo;

    @Override
    public List<GiamGiaSanPhamChiTiet> getAll() {
        return giamGiaSanPhamChiTietRepo.findAll();
    }

    @Override
    public Page<GiamGiaSanPhamChiTiet> view(Integer pgaeNo, Integer size) {
        Pageable pageable = PageRequest.of(pgaeNo, 5);
        return giamGiaSanPhamChiTietRepo.findAll(pageable);
    }

    @Override
    public Page<GiamGiaSanPhamChiTiet> view1(int trangThai, Integer pgaeNo, Integer size) {
        Pageable pageable = PageRequest.of(pgaeNo, 5);
        return giamGiaSanPhamChiTietRepo.findByTrangThai(trangThai, pageable);
    }

    @Override
    public void add(GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet) {
        giamGiaSanPhamChiTietRepo.save(giamGiaSanPhamChiTiet);
    }

    @Override
    public GiamGiaSanPhamChiTiet findTrangThai(UUID id) {
        Optional<GiamGiaSanPhamChiTiet> optionalGiamGiaSanPhamChiTiet = Optional.ofNullable(giamGiaSanPhamChiTietRepo.findTrangThai(id));
        return optionalGiamGiaSanPhamChiTiet.orElse(null);
    }

    @Override
    public List<GiamGiaSanPhamChiTiet> findByIdAo(UUID id) {
        return giamGiaSanPhamChiTietRepo.findByIdAo(id);
    }
}
