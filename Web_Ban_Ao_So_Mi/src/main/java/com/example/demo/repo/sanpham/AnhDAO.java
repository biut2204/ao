package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Anh;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface AnhDAO extends JpaRepository<Anh,UUID> {
    @Query("select p from Anh p where p.ao.ma=?1")
    List<Anh> getAnhByMaAo(String ma);
}
