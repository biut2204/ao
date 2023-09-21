package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Co_ao;
import com.example.demo.entity.sanpham.Cuc_ao;
import com.example.demo.entity.sanpham.Hoa_tiet;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.io.Serializable;
import java.util.UUID;


public interface Hoa_tietDAO extends JpaRepository<Hoa_tiet, UUID> {
    @Query("select p from Hoa_tiet p where p.ma=?1")
    Hoa_tiet getHoa_tietByMa(String ma);
}
