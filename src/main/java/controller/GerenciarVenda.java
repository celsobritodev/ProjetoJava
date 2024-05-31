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
 * Servlet implementation class GerenciarVenda
 */
public class GerenciarVenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GerenciarVenda() {
        super();
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
		    String mensagem = "";
		    try {
				Venda v = (Venda) session.getAttribute("venda");
				VendaDAO vDAO = new VendaDAO();
				if (vDAO.registrar(v)) {
					mensagem = "Venda realizada com sucesso";
				} else {
					mensagem = "Erro ao gravar a venda";
				}
		    	
			} catch (Exception e) {
				out.print(e);
			}
			
			
			out.println("<html>");
			out.println("<body>");
			out.println("<script type='text/javascript'>");
			out.println("alert('" + mensagem + "');");
			out.println("location.href='listar_venda.jsp';");
			out.println("</script>");
			out.println("</body>");
			out.println("</html>");
		    
			out.println("<h1>Servlet GerenciarCarrinho at "+request.getContextPath()+"</h1>");
			out.println("</body>");
			out.println("</html>");

		}

	}
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
