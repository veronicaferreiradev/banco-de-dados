package com.egeneration.halloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/BSMs")
public class BSMsController { 
		
		@GetMapping 
		public String BSMs() {
			return "1-Mentalidade de Crescimento\r\n"
					+ "2- Orientação ao Futuro\r\n"
					+ "3- Responsabilidade Pessoal\r\n"
					+ "4- Persistência\r\n"
					+ "5- Trabalho em Equipe\r\n"
					+ "6- Comunicação\r\n"
					+ "7- Proatividade\r\n"
					+ "8- Orientação ao Detalhe";
		}

	}