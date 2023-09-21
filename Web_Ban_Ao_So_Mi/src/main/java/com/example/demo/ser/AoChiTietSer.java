package com.example.demo.ser;

import com.example.demo.entity.sanpham.Ao_chi_tiet;

import java.util.List;
import java.util.UUID;

public interface AoChiTietSer {

    List<Ao_chi_tiet> getAll();

    Ao_chi_tiet findIdByIdAo(UUID id, UUID idMauSac, UUID idSize);

    Ao_chi_tiet findId(UUID id);
}
