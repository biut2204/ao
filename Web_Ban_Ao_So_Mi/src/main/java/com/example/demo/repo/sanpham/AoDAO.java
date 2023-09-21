package com.example.demo.repo.sanpham;

import com.example.demo.entity.sanpham.Ao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.UUID;


public interface AoDAO extends JpaRepository<Ao,UUID> {
    @Query("select p from Ao p where p.ma = ?1")
    Ao getAoByMa(String ma);

    @Query("select p from Ao p where p.ten = ?1")
    Ao getAoByTen(String ten);

    @Query("select p from Ao p where p.id = ?1")
    Ao findId(UUID id);

    List<Ao> findTop5ByOrderByMaAsc();

    List<Ao> findTop10ByOrderByMaAsc();

    @Query("SELECT a FROM Ao a WHERE a.ten LIKE %:ten%")
    List<Ao> findByTen(@Param("ten") String ten);

    @Query("SELECT p FROM Ao p WHERE (:idChatVai IS NULL OR p.chat_vai.id = :idChatVai) " +
            "AND (:idCoAO IS NULL OR p.co_ao.id = :idCoAO) " +
            "AND (:idHoaTiet IS NULL OR p.hoa_tiet.id = :idHoaTiet) " +
            "AND (:idTui IS NULL OR p.tui_ao.id = :idTui)" +
            "AND (:idTayAo IS NULL OR p.tay_ao.id = :idTayAo) " +
            "AND (:idCuc IS NULL OR p.cuc_ao.id = :idCuc) " +
            "AND (:idForm IS NULL OR p.form.id = :idForm) " +
            "AND (:idHang IS NULL OR p.hang.id = :idHang) " +
            "AND (:idNepCheAo IS NULL OR p.nep_che_ao.id = :idNepCheAo)")
    List<Ao> findByuKien(@Param("idChatVai") UUID idChatVai, @Param("idCoAO") UUID idCoAO,
            @Param("idHoaTiet") UUID idHoaTiet, @Param("idTui") UUID idTui,
            @Param("idTayAo") UUID idTayAo, @Param("idCuc") UUID idCuc,
            @Param("idForm") UUID idForm, @Param("idHang") UUID idHang,
            @Param ("idNepCheAo") UUID idNepCheAo);

}
