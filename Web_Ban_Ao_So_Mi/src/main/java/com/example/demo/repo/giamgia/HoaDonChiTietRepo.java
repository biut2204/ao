package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.HoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface HoaDonChiTietRepo extends JpaRepository<HoaDonChiTiet, UUID> {
    @Query("select hdct from HoaDonChiTiet hdct where hdct.hoaDon.id = ?1")
    List<HoaDonChiTiet> findByHoaDon(UUID id);
}
