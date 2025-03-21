package com.generation.delivery.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.generation.delivery.model.Restaurante;

public interface RestauranteRepository extends JpaRepository<Restaurante, Long>  {
	
	public List<Restaurante>findAllByRazaoSocialContainingIgnoreCase(@Param("razaoSocial") String razaoSocial);



}
