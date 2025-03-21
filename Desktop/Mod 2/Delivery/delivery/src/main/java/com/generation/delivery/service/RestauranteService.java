package com.generation.delivery.service;

	import java.time.LocalTime;

	import org.springframework.stereotype.Service;

	import com.generation.delivery.model.Restaurante;

	@Service
	public class RestauranteService {

	    public boolean isAberto(Restaurante restaurante) {
	        LocalTime agora = LocalTime.now();
	        return agora.isAfter(restaurante.getHorarioAbertura()) && agora.isBefore(restaurante.getHorarioFechamento());
	    }
	}

