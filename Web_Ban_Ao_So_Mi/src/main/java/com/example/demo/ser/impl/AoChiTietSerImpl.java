package com.example.demo.ser.impl;

import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.repo.giamgia.AoChiTietRepo;
import com.example.demo.ser.AoChiTietSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class AoChiTietSerImpl implements AoChiTietSer {

    @Autowired
    AoChiTietRepo aoChiTietRepo;

    @Override
    public List<Ao_chi_tiet> getAll() {
        return aoChiTietRepo.findAll();
    }

    @Override
    public Ao_chi_tiet findIdByIdAo(UUID id, UUID idMauSac, UUID idSize) {
        return aoChiTietRepo.findIdByIdAo(id, idMauSac, idSize);
    }

    @Override
    public Ao_chi_tiet findId(UUID id) {
        Optional<Ao_chi_tiet> optionalAoChiTiet = aoChiTietRepo.findById(id);
        return optionalAoChiTiet.orElse(null);
    }
}

