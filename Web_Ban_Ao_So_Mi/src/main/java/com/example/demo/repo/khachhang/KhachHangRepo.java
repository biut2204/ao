package com.example.demo.repo.khachhang;

import com.example.demo.entity.khachhang.KhachHang;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface KhachHangRepo extends JpaRepository<KhachHang, UUID> {

    @Query("select p from KhachHang p where p.email= ?1 and  p.matKhau= ?2")
    KhachHang findByEmailAndMatKhau(String email, String matKhau);

    @Query("select p from KhachHang p where p.ma= ?1")
    KhachHang findByMa(String ma);

    @Query("select p from KhachHang p where p.email= ?1")
    KhachHang findByEmail(String email);
}
