package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.GiamGiaHoaDonChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface GiamGiaHoaDonChiTietRepo extends JpaRepository<GiamGiaHoaDonChiTiet, UUID> {
}
