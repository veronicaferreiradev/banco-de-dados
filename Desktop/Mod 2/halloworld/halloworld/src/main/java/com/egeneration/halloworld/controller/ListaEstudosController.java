package com.egeneration.halloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/lista-estudos")

public class ListaEstudosController {
	@GetMapping 
	public String ListaEstudos() {
		return "1-MySql Banco de dados;"
				+ "\n2- O que são Apis;"
				+ "\n3- O que é SÓFÉIA;"
				+ "\n4- O que é JSON\r\n";
	}

}
