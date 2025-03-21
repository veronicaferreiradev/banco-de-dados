package com.generation.delivery.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import com.generation.delivery.model.Produto;
import com.generation.delivery.repository.ProdutoRepository;
import com.generation.delivery.repository.RestauranteRepository;
import com.generation.delivery.service.ProdutoService; 

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.responses.ApiResponses;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/produtos")
@CrossOrigin(allowedHeaders = "*", origins = "*")
public class ProdutoController {

    @Autowired
    private ProdutoRepository produtoRepository;

    
    @Autowired
    private RestauranteRepository restauranteRepository;

    @Autowired
    private ProdutoService produtoService; // Injete o ProdutoService

    @GetMapping
    public ResponseEntity<List<Produto>> getAll() {
        return ResponseEntity.ok(produtoRepository.findAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<Produto> getByid(@PathVariable Long id) {
        return produtoRepository.findById(id)
                .map(resposta -> ResponseEntity.ok(resposta))
                .orElse(ResponseEntity.status(HttpStatus.NOT_FOUND).build());
    }

    @GetMapping("/nomeProduto/{nomeProduto}")
    public ResponseEntity<List<Produto>> getByTitulo(@PathVariable String nomeProduto) {
        return ResponseEntity.ok(produtoRepository.
                findAllByNomeProdutoContainingIgnoreCase(nomeProduto));
    }

    @PostMapping
    public ResponseEntity<Produto> post(@Valid @RequestBody Produto produto) {
        if (restauranteRepository.existsById(produto.getRestaurante().getId()))
            return ResponseEntity.status(HttpStatus.CREATED)
                    .body(produtoRepository.save(produto));
        throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Restaurante não Existe!", null);
    }

    @PutMapping
    public ResponseEntity<Produto> put(@Valid @RequestBody Produto produto) {
        if (produtoRepository.existsById(produto.getId())) {

            if (restauranteRepository.existsById(produto.getRestaurante().getId()))
                return ResponseEntity.status(HttpStatus.OK)
                        .body(produtoRepository.save(produto));

            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Restaurante não existe!");

        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        Optional<Produto> produto = produtoRepository.findById(id);

        if (produto.isEmpty())
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);

        produtoRepository.deleteById(id);
    }

    @Operation(summary = "Define o prato do dia para um restaurante")
    @ApiResponses(value = {
            @ApiResponse(responseCode = "200", description = "Prato do dia definido com sucesso"),
            @ApiResponse(responseCode = "404", description = "Restaurante não encontrado ou nenhum produto vendido")
    })
    @GetMapping("/prato-do-dia/{restauranteId}")
    public ResponseEntity<Produto> definirPratoDoDia(@PathVariable Long restauranteId) {
        try {
            Produto pratoDoDia = produtoService.definirPratoDoDia(restauranteId);
            return ResponseEntity.ok(pratoDoDia);
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }
}
