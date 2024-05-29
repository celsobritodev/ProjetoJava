package model;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class ClienteDAO extends DataBaseDAO {

	public ClienteDAO() throws Exception {
		super();
		// TODO Auto-generated constructor stub
	}

	public ArrayList<Cliente> getLista() throws Exception {

		ArrayList<Cliente> lista = new ArrayList<Cliente>();
		String sql = "SELECT * FROM cliente";
		this.conectar();
		Statement stm = conn.createStatement();
		ResultSet rs = stm.executeQuery(sql);
		while (rs.next()) {
			Cliente c = new Cliente();
			c.setIdCliente(rs.getInt("idCliente"));
			c.setNomeRazao(rs.getString("nome"));
			c.setCpfCnpj(rs.getString("cpfCnpj"));
			c.setRgIe(rs.getString("rgIe"));
			c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
			c.setTipo(rs.getInt("tipo"));
			lista.add(c);
		}
		this.desconectar();
		return lista;

	}

	public boolean gravar(Cliente c) {

		try {
			this.conectar();
			String sql;
			if (c.getIdCliente() == 0) {
				sql = "INSERT INTO cliente (nomeRazao,cpfCnpj,rgIe,dataNascAbertura,tipo) " + "VALUES (?.?.?.?.?)";
			} else {
				sql = "UPDATE cliente SET nomeRazao=?,cpfCnpj=?, rgIe=?, dataNascAbertura=?, tipo=? "
						+ "WHERE idCliente=?";
			}
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, c.getNomeRazao());
			pstm.setString(2, c.getCpfCnpj());
			pstm.setString(3, c.getRgIe());
			pstm.setDate(4, new Date(c.getDataNascAbertura().getTime()));
			pstm.setInt(5, c.getTipo());
			if (c.getIdCliente() > 0) {
				pstm.setInt(6, c.getIdCliente());
			}
			pstm.execute();
			this.desconectar();
			return true;

		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

	}

	public boolean deletar(Cliente c) {

		try {
			this.conectar();
			String sql = "DELETE FROM cliente WHERE idCliente=?";
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, c.getIdCliente());
			pstm.execute();
			this.desconectar();
			return true;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
	
	
	public Cliente getCarregarPorId(int idCliente) throws Exception {
		Cliente c = new Cliente();
		String sql = "SELECT * FROM cliente WHERE idCliente=?";
		this.conectar();
		PreparedStatement pstm = conn.prepareStatement(sql);
		pstm.setInt(1, idCliente);
		ResultSet rs = pstm.executeQuery();
		if(rs.next()) {
			c.setIdCliente(rs.getInt("idCliente"));
			c.setNomeRazao(rs.getString("nomeRazao"));
			c.setCpfCnpj(rs.getString("cpfCnpj"));
			c.setRgIe(rs.getNString("rgIe"));
			c.setDataNascAbertura(rs.getDate("dataNascAbertura"));
			c.setTipo(rs.getInt("tipo"));
		}
		this.desconectar();
		return c;
	}
	
	

}
