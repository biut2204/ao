package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Tui_ao;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Tui_aoDAO extends JpaRepository<Tui_ao, UUID> {
    @Query("select p from Tui_ao p where p.ma=?1")
    Tui_ao getTui_aoByMa(String ma);
}
