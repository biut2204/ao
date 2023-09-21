package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Tay_ao;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Tay_aoDAO extends JpaRepository<Tay_ao, UUID> {
    @Query("select p from Tay_ao p where p.ma=?1")
    Tay_ao getTay_aoByMa(String ma);
}
