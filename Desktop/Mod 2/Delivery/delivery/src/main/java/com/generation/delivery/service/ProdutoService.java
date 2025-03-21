package com.generation.delivery.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.generation.delivery.model.Produto;
import com.generation.delivery.repository.ProdutoRepository;

@Service
public class ProdutoService {
	 private final ProdutoRepository produtoRepository;

	    public ProdutoService(ProdutoRepository produtoRepository) {
	        this.produtoRepository = produtoRepository;
	    }

	   
	    public Produto definirPratoDoDia(Long restauranteId) {
	        List<Produto> produtosMaisVendidos = produtoRepository.buscarMaisVendidosPorRestaurante(restauranteId);
	        
	        if (!produtosMaisVendidos.isEmpty()) {
	            Produto pratoDoDia = produtosMaisVendidos.get(0);
	            return pratoDoDia; 
	        }
	        throw new RuntimeException("Nenhum produto vendido para definir como prato do dia.");
	    }
	
}
