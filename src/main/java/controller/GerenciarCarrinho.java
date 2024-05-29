package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Produto;
import model.ProdutoDAO;
import model.Venda;
import model.VendaProduto;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class GerenciarCarrinho
 */

@WebServlet(urlPatterns = { "/gerenciar_carrinho.do" })
public class GerenciarCarrinho extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GerenciarCarrinho() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet GerenciarCarrinho</title>");
			out.println("</head>");
			out.println("<body>");
			
			HttpSession session = request.getSession();
			try {
				Venda v = (Venda) session.getAttribute("venda");
				ArrayList<VendaProduto> carrinho = v.getCarrinho();
				String acao = request.getParameter("acao");
				ProdutoDAO pDAO = new ProdutoDAO();
				if(acao.equals("add")) {
					Produto p = new Produto();
					int idProduto = Integer.parseInt(request.getParameter("idProduto"));
					p = pDAO.getCarregarPorId(idProduto);
					int qtd = Integer.parseInt(request.getParameter("qtd"));
					VendaProduto vp = new VendaProduto();
					vp.setProduto(p);
					vp.setQtd(qtd);
					vp.setValorVendido(p.getValor());
					carrinho.add(vp);
					v.setCarrinho(carrinho);
					session.setAttribute("venda", v);
					response.sendRedirect("form_venda.jsp?acao=c");
					
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			
			
			
			
			out.println("<h1>Servlet GerenciarCarrinho at "+request.getContextPath()+"</h1>");
			out.println("</body>");
			out.println("</html>");

		}

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
