package model;

import java.sql.PreparedStatement;
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
	
	

	public boolean gravar (Usuario u) {
		
		try {
			String sql;
			this.conectar();
			
			if (u.getIdUsuario()==0) {
				sql = "INSERT INTO usuario(nome,login,senha,status,idPerfil) VALUES (?,?,?,?,?)";
			
			} else
				sql = "UPDATE usuario SET nome=?,login=?,senha=?,status=?, idPerfil=? WHERE idUsuario=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,u.getNome());
			pstm.setString(2,u.getLogin());
			pstm.setString(3,u.getSenha());
			pstm.setInt(4,u.getStatus());
			pstm.setInt(5,u.getPerfil().getIdPerfil());
			
			if (u.getIdUsuario()>0) {
				pstm.setInt(6,u.getIdUsuario());
			}
			
			pstm.execute();
	        this.desconectar();
	        return true;
			
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		
		
	}
	
	
	
public Usuario getCarregaPorId (int idUsuario) throws Exception{
		
		Usuario u = new Usuario();
		String sql = "SELECT u.*, p.nome FROM usuario u "+
		"INNER JOIN perfil p on p.idPerfil=u.idPerfil "+
	    "WHERE u.idUsuario=?";
		this.conectar();
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, idUsuario);
		ResultSet rs = pstm.executeQuery();
		if( rs.next()) {
			u.setIdUsuario(rs.getInt("idUsuario"));
			u.setNome(rs.getString("nome"));
			u.setLogin(rs.getString("login"));
			u.setSenha(rs.getString("senha"));
			u.setStatus(rs.getInt("status"));
			Perfil p = new Perfil();
			p.setIdPerfil(rs.getInt("u.idPerfil"));
			p.setNome(rs.getString("p.nome"));
			u.setPerfil(p);
		
		}
		this.desconectar();
		return u;
				
	}

	
public boolean deletar (Usuario u) {
	
	try {
	   this.conectar();
	   String sql = "UPDATE usuario SET status=2 WHERE idUsuario=?";
	   PreparedStatement pstm = conn.prepareStatement(sql);
	   pstm.setInt(1, u.getIdUsuario());
	   pstm.execute();
	   this.desconectar();
	   return true;
	} catch (Exception e) {
       System.out.println(e);
       return false;
	}
}
	
	
	

}
