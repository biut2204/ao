package com.example.demo.repo.giamgia;

import com.example.demo.entity.sanpham.Ao;
import com.example.demo.entity.sanpham.Ao_chi_tiet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface AoChiTietRepo extends JpaRepository<Ao_chi_tiet, UUID> {
    Ao_chi_tiet findByAo_Ten(String ten);

    @Query("select p from Ao_chi_tiet p where p.ao.id = ?1 and p.mau_sac.id = ?2 and p.size.id = ?3")
    Ao_chi_tiet findIdByIdAo(UUID id, UUID idMauSac, UUID idSize);
}
