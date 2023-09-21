package com.example.demo.ser;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface GiamGiaSanPhamChiTietSer {

    List<GiamGiaSanPhamChiTiet> getAll();

    Page<GiamGiaSanPhamChiTiet> view(Integer pgaeNo, Integer size);

    Page<GiamGiaSanPhamChiTiet> view1(int trangThai, Integer pgaeNo, Integer size);

    void add(GiamGiaSanPhamChiTiet giamGiaSanPhamChiTiet);

    GiamGiaSanPhamChiTiet findTrangThai(UUID id);

    List<GiamGiaSanPhamChiTiet> findByIdAo(UUID id);
}
