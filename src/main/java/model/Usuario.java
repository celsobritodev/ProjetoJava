package model;

public class Usuario {
 private int idUsuario;
 private String nome;
 private String login;
 private String senha;
 private int status;
 private Perfil perfil;
 
 
public Usuario() {
	
}


public Usuario(int idUsuario, String nome, String login, String senha, int status, Perfil perfil) {
	super();
	this.idUsuario = idUsuario;
	this.nome = nome;
	this.login = login;
	this.senha = senha;
	this.status = status;
	this.perfil = perfil;
}


public int getIdUsuario() {
	return idUsuario;
}


public void setIdUsuario(int idUsuario) {
	this.idUsuario = idUsuario;
}


public String getNome() {
	return nome;
}


public void setNome(String nome) {
	this.nome = nome;
}


public String getLogin() {
	return login;
}


public void setLogin(String login) {
	this.login = login;
}


public String getSenha() {
	return senha;
}


public void setSenha(String senha) {
	this.senha = senha;
}


public int getStatus() {
	return status;
}


public void setStatus(int status) {
	this.status = status;
}


public Perfil getPerfil() {
	return perfil;
}


public void setPerfil(Perfil perfil) {
	this.perfil = perfil;
}


@Override
public String toString() {
	return "Usuario [nome=" + nome + "]";
}

 
 
}
