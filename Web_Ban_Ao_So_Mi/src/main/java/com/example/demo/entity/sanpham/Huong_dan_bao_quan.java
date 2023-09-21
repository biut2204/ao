package com.example.demo.entity.sanpham;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Table
@Entity
@Data
public class Huong_dan_bao_quan implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String ma;
    private String ten;
    private String chitiet;
    private Integer trangthai;
}
