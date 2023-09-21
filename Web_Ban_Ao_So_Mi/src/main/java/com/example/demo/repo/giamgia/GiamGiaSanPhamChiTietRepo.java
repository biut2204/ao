package com.example.demo.repo.giamgia;

import com.example.demo.entity.giamgia.GiamGiaSanPhamChiTiet;
import com.example.demo.entity.giohang.GioHangChiTiet;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface GiamGiaSanPhamChiTietRepo extends JpaRepository<GiamGiaSanPhamChiTiet, UUID> {

    @Query("select p from GiamGiaSanPhamChiTiet p where p.ao.id = ?1")
    GiamGiaSanPhamChiTiet findTrangThai(UUID id);

    @Query("select p from GiamGiaSanPhamChiTiet p where p.ao.id = ?1")
    List<GiamGiaSanPhamChiTiet> findByIdAo(UUID id);

    @Query("select gg from GiamGiaSanPhamChiTiet gg where gg.trangThai = ?1")
    Page<GiamGiaSanPhamChiTiet> findByTrangThai(int trangThai, Pageable pageable);
}
