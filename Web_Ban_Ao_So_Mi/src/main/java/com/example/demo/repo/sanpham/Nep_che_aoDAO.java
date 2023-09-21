package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Nep_che_ao;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Nep_che_aoDAO extends JpaRepository<Nep_che_ao, UUID> {
    @Query("select p from Nep_che_ao p where p.ma=?1")
    Nep_che_ao getNep_che_aoByMa(String ma);
}
