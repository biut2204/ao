package com.example.demo.ser;

import com.example.demo.entity.giohang.GioHangChiTiet;
import org.springframework.data.domain.Page;

import java.util.List;
import java.util.UUID;

public interface GioHangChiTietSer {

    List<GioHangChiTiet> getAll();

    void add(GioHangChiTiet gioHangChiTiet);

    Page<GioHangChiTiet> view(UUID idGH,Integer pageNo, Integer size);

    void update(UUID id, GioHangChiTiet update);

    GioHangChiTiet findById(UUID id);
}
