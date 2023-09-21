package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Mau_sac;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Mau_sacDAO extends JpaRepository<Mau_sac, UUID> {
    @Query("select p from Mau_sac p where p.ma=?1")
    Mau_sac getMau_sacByMa(String ma);
}
