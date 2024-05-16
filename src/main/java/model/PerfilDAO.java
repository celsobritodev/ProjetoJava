package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class PerfilDAO extends DataBaseDAO {

	public PerfilDAO() throws Exception {

	}

	public ArrayList<Perfil> getLista() throws Exception {

		ArrayList<Perfil> lista = new ArrayList<Perfil>();
		String SQL = "SELECT * FROM PERFIL";
		this.conectar();
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(SQL);
		while (rs.next()) {
			Perfil p = new Perfil();
			p.setIdPerfil(rs.getInt("idPerfil"));
			p.setNome(rs.getString("nome"));
			lista.add(p);
		}
		this.desconectar();
		return lista;

	}

	public boolean gravar (Perfil p) {
		
		try {
			String sql;
			this.conectar();
			if (p.getIdPerfil()==0) {
				sql = "INSERT INTO perfil(nome) VALUES (?)";
			
			} else
				sql = "UPDATE perfil SET nome=? idPerfil=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1,p.getNome());
			if (p.getIdPerfil()>0) {
				pstm.setInt(2,p.getIdPerfil());
			}
			
			pstm.execute();
	        this.desconectar();
	        return true;
			
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		
		
	}
	
}
