package com.example.demo.entity.sanpham;

import jakarta.persistence.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.UUID;

@Table
@Entity
@Data
public class Ao_chi_tiet implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    @ManyToOne
    @JoinColumn(name = "id_size")
    private Size size;
    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private Mau_sac mau_sac;
    @ManyToOne
    @JoinColumn(name = "id_ao")
    private Ao ao;
    private Integer slton;
    private Integer slban;
    private Integer trangthai;
}
