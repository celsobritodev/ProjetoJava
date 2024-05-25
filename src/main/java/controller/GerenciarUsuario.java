package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Perfil;
import model.Usuario;
import model.UsuarioDAO;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GerenciarUsuario
 */
@WebServlet(urlPatterns = { "/gerenciar_usuario.do" })
public class GerenciarUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GerenciarUsuario() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String mensagem = "";

		String acao = request.getParameter("acao");
		String idUsuario = request.getParameter("idUsuario");

		Usuario u = new Usuario();

		try {
			UsuarioDAO uDAO = new UsuarioDAO();
			if (acao.equals("alterar")) {
				if (GerenciarLogin.verificarPermissao(request, response)) {
					u = uDAO.getCarregaPorId(Integer.parseInt(idUsuario));
					if (u.getIdUsuario() > 0) {
						RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_usuario.jsp");
						request.setAttribute("usuario", u);
						disp.forward(request, response);
					} else {
						mensagem = "Usuario não encontrado";

					}
				} else {
					mensagem = "Acesso Negado!";
				}
			}
			if (acao.equals("deletar")) {
				 if (GerenciarLogin.verificarPermissao(request,response)) {
				u.setIdUsuario(Integer.parseInt(idUsuario));
				if (uDAO.desativar(u)) {
					mensagem = "Desativado com sucesso";
				} else {
					mensagem = "Erro ao excluir o usuario";
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
		out.println("location.href='listar_usuario.jsp';");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String idUsuario = request.getParameter("idUsuario");
		String nome = request.getParameter("nome");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String status = request.getParameter("status");
		String idPerfil = request.getParameter("idPerfil");

		String mensagem = "";

		Usuario u = new Usuario();

		try {
			UsuarioDAO uDAO = new UsuarioDAO();
			if (!idUsuario.isEmpty()) {
				u.setIdUsuario(Integer.parseInt(idUsuario));
			}
			if (nome.equals("") || login.equals("") || senha.equals("") || status.equals("") || idPerfil.equals("")) {
				mensagem = "Campos obrigatórios deverão ser preenchidos";
			} else {
				u.setNome(nome);
				u.setLogin(login);
				u.setSenha(senha);
				u.setStatus(Integer.parseInt(status));
				Perfil p = new Perfil();
				p.setIdPerfil(Integer.parseInt(idPerfil));
				u.setPerfil(p);
				if (uDAO.gravar(u)) {
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
		out.println("location.href='listar_usuario.jsp';");
		out.println("</script>");

	}

}
