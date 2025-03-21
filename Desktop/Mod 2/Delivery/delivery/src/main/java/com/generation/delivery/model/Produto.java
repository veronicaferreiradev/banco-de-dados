package com.generation.delivery.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tb_produtos")
public class Produto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "O atributo nome do produto é obrigatório!")
	@Size(min = 3, max = 1000, message = "O atributo nome do produto tem que ser maior que 3 e menor que 1000O!")
	private String nomeProduto;
	
	@Size(max = 5000, message = "O Link da foto não pode ser maior que 5000 caracteres")
	private String foto;
	
	@NotNull
	@Positive
	private int porcao;
	
	@NotNull
	@Positive 
	private Double preco;

	@NotNull
	private int quantidadeVendida = 0;
	@ManyToOne 
	@JsonIgnoreProperties("produto")
	private Restaurante restaurante;
	
	@ManyToOne 
	@JsonIgnoreProperties("produto")
	private Usuario usuario;
	
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Produto() {}
	public Produto(Long id, String nomeProduto, String foto, int porcao, Double preco, Restaurante restaurante) {
		this.id = id;
		this.nomeProduto = nomeProduto;
		this.foto = foto;
		this.porcao = porcao;
		this.preco = preco;
		this.quantidadeVendida = 0;
		this.restaurante = restaurante;
	}

	
	public void incrementarVendas() {
		this.quantidadeVendida++;
	}
	

	public int getQuantidadeVendida() {
		return quantidadeVendida;
	}

	public void setQuantidadeVendida(int quantidadeVendida) {
		this.quantidadeVendida = quantidadeVendida;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public String getFoto() {
		return foto;
	}

	public void setFoto(String foto) {
		this.foto = foto;
	}

	public int getPorcao() {
		return porcao;
	}

	public void setPorcao(int porcao) {
		this.porcao = porcao;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Restaurante getRestaurante() {
		return restaurante;
	}

	public void setRestaurante(Restaurante restaurante) {
		this.restaurante = restaurante;
	}

}
