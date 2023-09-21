package com.example.demo.entity.sanpham;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Table
@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Ao implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String ma;
    private String ten;
    @ManyToOne
    @JoinColumn(name = "id_chat_vai")
    private Chat_vai chat_vai;
    @ManyToOne
    @JoinColumn(name = "id_co_ao")
    private Co_ao co_ao;
    @ManyToOne
    @JoinColumn(name = "id_hoa_tiet")
    private Hoa_tiet hoa_tiet;
    @ManyToOne
    @JoinColumn(name = "id_tui")
    private Tui_ao tui_ao;
    @ManyToOne
    @JoinColumn(name = "id_tay_ao")
    private Tay_ao tay_ao;
    @ManyToOne
    @JoinColumn(name = "id_nep_che_ao")
    private Nep_che_ao nep_che_ao;
    @ManyToOne
    @JoinColumn(name = "id_cuc")
    private Cuc_ao cuc_ao;
    @ManyToOne
    @JoinColumn(name = "id_form")
    private Form form;
    @ManyToOne
    @JoinColumn(name = "id_hang")
    private Hang hang;
    @JsonIgnore
    @OneToMany(mappedBy = "ao", fetch = FetchType.EAGER)
    List<Anh> anhs;
    private String mota;
    private BigDecimal gianhap;
    private BigDecimal giaban;
    private Integer trangthai;

    public String getAnhDau(List<Anh> anhs1) {
        return anhs1.get(0).getTen_url();
    }

    ;
}
