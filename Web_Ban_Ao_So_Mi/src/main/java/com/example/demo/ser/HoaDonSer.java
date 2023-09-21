package com.example.demo.ser;

import com.example.demo.entity.giamgia.HoaDon;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface HoaDonSer {
    List<HoaDon> getAll();

    HoaDon findId(UUID id);

    void update(UUID id, HoaDon updateHoaDon);

    void add(HoaDon hoaDon);

    Long tongSl(UUID id);

    Page<HoaDon> listHoaDonFindByKhAndTrangThai(Integer pageNo, Integer size,UUID idKh, int trangThai);

    Page<HoaDon> listHoaDonFindByTrangThai(Integer pageNo, Integer size, int trangThai);
}
