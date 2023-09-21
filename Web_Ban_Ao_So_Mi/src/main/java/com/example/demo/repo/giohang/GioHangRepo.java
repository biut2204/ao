package com.example.demo.repo.giohang;

import com.example.demo.entity.giohang.GioHang;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.entity.sanpham.Mau_sac;
import com.example.demo.entity.sanpham.Size;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangRepo extends JpaRepository<GioHang, UUID> {
    @Query("select act from Ao_chi_tiet act where act.ao.id = ?1")
    List<Ao_chi_tiet> findByIdAo(UUID id);

    @Query("select gh from GioHang gh where gh.khachHang.id = ?1")
    GioHang findByIdKH(UUID id);
}
