package com.example.demo.entity.nhanvien;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.UUID;

@Entity
@Table(name = "chuc_vu")
@NoArgsConstructor @AllArgsConstructor
@Getter @Setter
public class chucVu {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    @Column(name = "ma")
    private String ma;

    @Column(name = "ten")
    private String ten;

    @Column(name = "luong_co_ban")
    private String luong_co_ban;
}
