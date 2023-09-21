package com.example.demo.ser.impl;

import com.example.demo.entity.giamgia.HoaDon;
import com.example.demo.repo.giamgia.HoaDonRepo;
import com.example.demo.ser.HoaDonSer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
public class HoaDonSerImpl implements HoaDonSer {

    @Autowired
    HoaDonRepo hoaDonRepo;

    @Override
    public List<HoaDon> getAll() {
        return hoaDonRepo.findAll();
    }

    @Override
    public HoaDon findId(UUID id) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        return optionalHoaDon.orElse(null);
    }

    @Override
    public void update(UUID id, HoaDon updateHoaDon) {
        Optional<HoaDon> optionalHoaDon = hoaDonRepo.findById(id);
        if (optionalHoaDon.isPresent()) {
            HoaDon hoaDon = optionalHoaDon.get();

            hoaDon.setMa(updateHoaDon.getMa());
            hoaDon.setNgayTao(updateHoaDon.getNgayTao());
            hoaDon.setNgayThanhToan(updateHoaDon.getNgayThanhToan());
            hoaDon.setNhanVien(updateHoaDon.getNhanVien());
            hoaDon.setKhachHang(updateHoaDon.getKhachHang());
            hoaDon.setMoTa(updateHoaDon.getMoTa());
            hoaDon.setTongTien(updateHoaDon.getTongTien());
            hoaDon.setTrangThai(updateHoaDon.getTrangThai());

            hoaDonRepo.save(hoaDon);
        }
    }

    @Override
    public void add(HoaDon hoaDon) {
        hoaDonRepo.save(hoaDon);
    }

    @Override
    public Long tongSl(UUID id) {
        return hoaDonRepo.tongSl(id);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size, UUID idKh, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByKhAndTrangThai(idKh, trangThai, pageable);
    }

    @Override
    public Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai) {
        Pageable pageable = PageRequest.of(pageNo, size);
        return hoaDonRepo.listHoaDonFindByTrangThai(trangThai, pageable);
    }
}
