package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Cliente;
import model.ClienteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

/**
 * Servlet implementation class GerenciarCliente
 *
 * 
 */
@WebServlet(urlPatterns = { "/gerenciar_cliente.do" })
public class GerenciarCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GerenciarCliente() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String acao = request.getParameter("acao");

		String idCliente = request.getParameter("idCliente");
		String mensagem = "";
		try {
			ClienteDAO cDAO = new ClienteDAO();
			Cliente c = new Cliente();
			if (acao.equals("alterar")) {
				if (GerenciarLogin.verificarPermissao(request, response)) {
					c = cDAO.getCarregarPorId(Integer.parseInt(idCliente));
					if (c.getIdCliente() > 0) {
						RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_cliente.jsp");
						request.setAttribute("cliente", c);
						disp.forward(request, response);

					} else {
						mensagem = "Cliente não encontrado!";
					}
				} else {
					mensagem = "Acesso Negado!";
				}
			}
			if (acao.equals("deletar")) {
				if (GerenciarLogin.verificarPermissao(request, response)) {
					c.setIdCliente(Integer.parseInt(idCliente));
					if (cDAO.deletar(c)) {
						mensagem = "Cliente deletado com sucesso";
					} else {
						mensagem = "Erro ao deletar o cliente do banco de dados";
					}
				} else {
					mensagem = "Acesso Negado!";
				}
			}
		} catch (Exception e) {
			out.print(e);
			mensagem = "Erro ao executar";
		}
		out.println("<html>");
		out.println("<body>");
		out.println("<script type='text/javascript'>");
		out.println("alert('" + mensagem + "');");
		out.println("location.href='listar_cliente.jsp';");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");		
		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		String idCliente = request.getParameter("idCliente");
		String nomeRazao = request.getParameter("nomeRazao");
		String cpfCnpj = request.getParameter("cpfCnpj");
		String rgIe = request.getParameter("rgIe");
		String dataNascAbertura = request.getParameter("dataNascAbertura");
		String tipo = request.getParameter("tipo");
		String mensagem = "";

	
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			Cliente c = new Cliente();
			ClienteDAO cDAO = new ClienteDAO();
			if (!idCliente.isEmpty()) {
				c.setIdCliente(Integer.parseInt(idCliente));
			}
			if (nomeRazao.equals("") || cpfCnpj.equals("") || rgIe.equals("") | dataNascAbertura.equals("")|| tipo.equals("")) {
				mensagem = "Campos obrigatórios deverão ser preenchidos";
			} else {
				c.setNomeRazao(nomeRazao);
				c.setCpfCnpj(cpfCnpj);
				c.setRgIe(rgIe);
				if(!dataNascAbertura.isEmpty()) {
					c.setDataNascAbertura(df.parse(dataNascAbertura));
				}
				c.setTipo(Integer.parseInt(tipo));
				if (cDAO.gravar(c)) {
					mensagem = "Gravado com sucesso";
				} else {
					mensagem = "Erro ao gravar no banco de dados";
				}
			}
		} catch (Exception e) {
			out.print(e);
			mensagem = "Erro ao executoar";
		}
		out.println("<script type='text/javascript'>");
		out.println("alert('" + mensagem + "');");
		out.println("location.href='listar_cliente.jsp';");
		out.println("</script>");
	}

}
