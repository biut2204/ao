package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Chat_vai;
import com.example.demo.entity.sanpham.Co_ao;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Chat_vaiDAO extends JpaRepository<Chat_vai, UUID> {
    @Query("select p from Chat_vai p where p.ma=?1")
    Chat_vai getChat_vaiByMa(String ma);
}
