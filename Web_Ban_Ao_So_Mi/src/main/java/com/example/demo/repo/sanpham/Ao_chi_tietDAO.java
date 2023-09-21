package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Anh;
import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface Ao_chi_tietDAO extends JpaRepository<Ao_chi_tiet,UUID> {
    @Query("select p from Ao_chi_tiet p where p.ao.ma=?1")
    List<Ao_chi_tiet> getAllByMaAo(String ma);

}