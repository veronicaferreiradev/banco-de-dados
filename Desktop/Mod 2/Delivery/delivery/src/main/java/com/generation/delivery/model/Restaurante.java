package com.generation.delivery.model;

import java.time.LocalTime;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "tb_restaurantes")
public class Restaurante {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotBlank(message = "O atributo Razao Social é obrigatório!")
	@Size(min = 3, max = 1000, message = "O atributo Razao Social tem que ser maior que 3 e menor que 1000O!")
	private String razaoSocial;
	
	@NotBlank(message = "O atributo CPF é obrigatório!")
	@Size(min = 3, max = 20, message = "O atributo CPF tem que ser maior que 3 e menor que 20!")
	private String cpf;
	
	@NotBlank(message = "O atributo Endereço é obrigatório!")
	@Size(min = 3, max = 1000, message = "O atributo Endereço tem que ser maior que 3 e menor que 1000O!")
	private String endereco;
	
	@Transient
	private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRazaoSocial() {
		return razaoSocial;
	}

	public void setRazaoSocial(String razaoSocial) {
		this.razaoSocial = razaoSocial;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public LocalTime getHorarioAbertura() {
		return horarioAbertura;
	}

	public void setHorarioAbertura(LocalTime horarioAbertura) {
		this.horarioAbertura = horarioAbertura;
	}

	public LocalTime getHorarioFechamento() {
		return horarioFechamento;
	}

	public void setHorarioFechamento(LocalTime horarioFechamento) {
		this.horarioFechamento = horarioFechamento;
	}

	public List<Produto> getProduto() {
		return produto;
	}

	public void setProduto(List<Produto> produto) {
		this.produto = produto;
	}

	@JsonFormat(pattern = "HH:mm:ss")
	private LocalTime horarioAbertura;
	
	@JsonFormat(pattern = "HH:mm:ss")
	private LocalTime horarioFechamento;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "restaurante", cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties("restaurante")
	private List<Produto> produto;

	

	

}