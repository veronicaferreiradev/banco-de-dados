package com.generation.delivery.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.generation.delivery.model.Produto;

public interface ProdutoRepository extends JpaRepository<Produto, Long> {

    public List<Produto> findAllByNomeProdutoContainingIgnoreCase(@Param("nomeProduto") String nomeProduto);

    @Query("SELECT p FROM Produto p WHERE p.restaurante.id = :restauranteId ORDER BY p.quantidadeVendida DESC")
    List<Produto> buscarMaisVendidosPorRestaurante(@Param("restauranteId") Long restauranteId);
}

