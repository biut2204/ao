package com.example.demo.repo.giohang;

import com.example.demo.entity.giohang.GioHangChiTiet;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GioHangChiTietRepo extends JpaRepository<GioHangChiTiet, UUID> {
    @Query("select ghct from GioHangChiTiet ghct where ghct.gioHang.id = ?1 and ghct.trangThai = 0")
    Page<GioHangChiTiet> findByIdGH(UUID id, Pageable pageable);
}
