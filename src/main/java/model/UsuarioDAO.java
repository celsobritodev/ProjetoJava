package model;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UsuarioDAO extends DataBaseDAO {
	
	public UsuarioDAO() throws Exception{}
	
	public ArrayList<Usuario> getLista() throws Exception {

		ArrayList<Usuario> lista = new ArrayList<Usuario>();
		String SQL = "SELECT u.*, p.nome FROM Usuario u "+
		             "INNER JOIN perfil p ON p.idPerfil=u.idPerfil ";
		this.conectar();
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(SQL);
		while (rs.next()) {
			Usuario u = new Usuario();
			u.setIdUsuario(rs.getInt("u.idUsuario"));
			u.setNome(rs.getString("u.nome"));
			u.setLogin(rs.getString("u.login"));
			u.setSenha(rs.getString("u.senha"));
			u.setStatus(rs.getInt("u.status"));
			Perfil p = new Perfil();
			p.setIdPerfil(rs.getInt("u.idPerfil"));
			p.setNome(rs.getString("p.nome"));
			u.setPerfil(p);
			
			lista.add(u);
		}
		this.desconectar();
		return lista;

	}

}
