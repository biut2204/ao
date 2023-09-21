package com.example.demo.repo.nhanvien;

import com.example.demo.entity.nhanvien.nhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;
@Repository
public interface nhanVienRepository extends JpaRepository<nhanVien, UUID> {
}
