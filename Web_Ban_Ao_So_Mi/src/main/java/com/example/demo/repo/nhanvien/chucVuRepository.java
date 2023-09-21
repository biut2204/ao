package com.example.demo.repo.nhanvien;

import com.example.demo.entity.nhanvien.chucVu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface chucVuRepository extends JpaRepository<chucVu, UUID> {
}
