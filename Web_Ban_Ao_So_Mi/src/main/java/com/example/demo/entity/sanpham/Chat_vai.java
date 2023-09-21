package com.example.demo.entity.sanpham;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Table
@Entity
@Data
public class Chat_vai implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String ma;
    private String ten;
    private String thongtin;
    @ManyToOne
    @JoinColumn(name = "id_hdbaoquan")
    private Huong_dan_bao_quan huong_dan_bao_quan;
    private Integer trangthai;
}
