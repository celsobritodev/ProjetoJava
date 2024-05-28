package model;

public class Produto {
   private int idProduto;
   private String nome;
   private int qtd;
   private double valor;
   
   
@Override
public String toString() {
	return "Produto [idProduto=" + idProduto + ", nome=" + nome + ", qtd=" + qtd + ", valor=" + valor + "]";
}
public Produto(int idProduto, String nome, int qtd, double valor) {
	super();
	this.idProduto = idProduto;
	this.nome = nome;
	this.qtd = qtd;
	this.valor = valor;
}
public Produto() {
	super();
	// TODO Auto-generated constructor stub
}
public int getIdProduto() {
	return idProduto;
}
public void setIdProduto(int idProduto) {
	this.idProduto = idProduto;
}
public String getNome() {
	return nome;
}
public void setNome(String nome) {
	this.nome = nome;
}
public int getQtd() {
	return qtd;
}
public void setQtd(int qtd) {
	this.qtd = qtd;
}
public double getValor() {
	return valor;
}
public void setValor(double valor) {
	this.valor = valor;
}
   
   
   
}
