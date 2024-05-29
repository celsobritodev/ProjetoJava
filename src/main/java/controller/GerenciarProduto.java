package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Produto;
import model.ProdutoDAO;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GerenciarProduto
 */
@WebServlet(urlPatterns = { "/gerenciar_produto.do" })
public class GerenciarProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GerenciarProduto() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String acao = request.getParameter("acao");

		String idProduto = request.getParameter("idProduto");
		String mensagem = "";
		try {
			ProdutoDAO pDAO = new ProdutoDAO();
			Produto p = new Produto();
			if (acao.equals("alterar")) {
				if (GerenciarLogin.verificarPermissao(request, response)) {
					p = pDAO.getCarregarPorId(Integer.parseInt(idProduto));
					if (p.getIdProduto() > 0) {
						RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_produto.jsp");
						request.setAttribute("produto", p);
						disp.forward(request, response);

					} else {
						mensagem = "Produto não encontrado!";
					}
				} else {
					mensagem = "Acesso Negado!";
				}
			}
			if (acao.equals("deletar")) {
				if (GerenciarLogin.verificarPermissao(request, response)) {
					p.setIdProduto(Integer.parseInt(idProduto));
					if (pDAO.deletar(p)) {
						mensagem = "Produto deletado com sucesso";
					} else {
						mensagem = "Erro ao deletar o produto do banco de dados";
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
		out.println("location.href='listar_produto.jsp';");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String idProduto = request.getParameter("idProduto");
		String nome = request.getParameter("nome");
		String qtd = request.getParameter("qtd");
		String valor = request.getParameter("valor");
		String mensagem = "";

		Produto p = new Produto();
		if (!idProduto.isEmpty()) {
			p.setIdProduto(Integer.parseInt(idProduto));
		}
		if (nome.equals("") || qtd.equals("") || valor.equals("")) {
			mensagem = "campos obrigatórios deverão ser preenchidos!";
		} else {
			p.setNome(nome);
			p.setQtd(Integer.parseInt(qtd));
			double novoValor = 0;
			if (!valor.isEmpty()) {
				novoValor = Double.parseDouble(valor.replace(".", "").replace(",", "."));

			}
			p.setValor(novoValor);
			try {
				ProdutoDAO pDAO = new ProdutoDAO();
				if (pDAO.gravar(p)) {
					mensagem = "Gravado com sucesso!";
				} else {
					mensagem = "Erro ao gravar o produto no banco de dados";
				}
			} catch (Exception e) {
				out.print(e);
				mensagem = "Erro ao executar!";
			}

		}
		out.println("<html>");
		out.println("<body>");
		out.println("<script type='text/javascript'>");
		out.println("alert('" + mensagem + "');");
		out.println("location.href='listar_produto.jsp';");
		out.println("</script>");
		out.println("</body>");
		out.println("</html>");

	}

}
