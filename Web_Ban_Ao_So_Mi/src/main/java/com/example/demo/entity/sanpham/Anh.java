package com.example.demo.entity.sanpham;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.util.UUID;

@Table
@Entity
@Data
public class Anh implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String ten_url;
    @ManyToOne
    @JoinColumn(name = "id_ao")
    private Ao ao;
   private Integer trangthai;
}
