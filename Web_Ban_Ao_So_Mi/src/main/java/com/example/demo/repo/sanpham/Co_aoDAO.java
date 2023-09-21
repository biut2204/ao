package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Ao_chi_tiet;
import com.example.demo.entity.sanpham.Chat_vai;
import com.example.demo.entity.sanpham.Co_ao;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.List;
import java.util.UUID;

public interface Co_aoDAO extends JpaRepository<Co_ao, UUID> {
    @Query("select p from Co_ao p where p.ma=?1")
    Co_ao getCo_aoByMa(String ma);
}
