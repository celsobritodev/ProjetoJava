package model;

import java.util.ArrayList;

public class Perfil {
  private int idPerfil;
  private String nome;
  private ArrayList<Menu> menus;
  private ArrayList<Menu> naoMenus;
  
  
public ArrayList<Menu> getNaoMenus() {
	return naoMenus;
}


public void setNaoMenus(ArrayList<Menu> naoMenus) {
	this.naoMenus = naoMenus;
}


public ArrayList<Menu> getMenus() {
	return menus;
}


public void setMenus(ArrayList<Menu> menus) {
	this.menus = menus;
}


public Perfil() {
	
}


public Perfil(int idPerfil, String nome) {
	this.idPerfil = idPerfil;
	this.nome = nome;
}


public int getIdPerfil() {
	return idPerfil;
}


public void setIdPerfil(int idPerfil) {
	this.idPerfil = idPerfil;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}


@Override
public String toString() {
	return "Perfil [idPerfil=" + idPerfil + ", nome=" + nome + "]";
}
  
  
  
}
