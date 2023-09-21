package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Huong_dan_bao_quan;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Huong_dan_bao_quanDAO extends JpaRepository<Huong_dan_bao_quan, UUID> {
    @Query("select p from Huong_dan_bao_quan p where p.ma=?1")
    Huong_dan_bao_quan getHuong_dan_bao_quanByMa(String ma);
}
