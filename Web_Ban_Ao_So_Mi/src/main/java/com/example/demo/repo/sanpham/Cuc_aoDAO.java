package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Cuc_aoDAO extends JpaRepository<Cuc_ao, UUID> {
    @Query("select p from Cuc_ao p where p.ma=?1")
    Cuc_ao getcuc_aoByMa(String ma);
}
