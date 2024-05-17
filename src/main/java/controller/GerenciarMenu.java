package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Menu;
import model.MenuDAO;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GerenciarMenu
 */


@WebServlet(urlPatterns = { "/gerenciar_menu.do"})
public class GerenciarMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GerenciarMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String mensagem ="";
		
		String acao = request.getParameter("acao");
		String idMenu = request.getParameter("idMenu");
		
		Menu m = new Menu();
		
		try {
			MenuDAO mDAO = new MenuDAO();
			if (acao.equals("alterar")) {
				m = mDAO.getCarregaPorId(Integer.parseInt(idMenu));
				if (m.getIdMenu()>0) {
					RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu.jsp");
					request.setAttribute("menu", m);
                    disp.forward(request, response);					
				} else  {
					mensagem = "Menu não encontrado";
					
				}
			}
			if (acao.equals("deletar")) {
				m.setIdMenu(Integer.parseInt(idMenu));
				if (mDAO.deletar(m)) {
					mensagem = "Deletado com sucesso";
				} else {
					mensagem = "Erro ao excluir o menu";
				}
			}
			
		} catch (Exception e) {
			out.print(e);
			mensagem = "Erro ao executar";
		}
		
		out.println("<script type='text/javascript'>");
	    out.println("alert('"+mensagem+"');");
	    out.println("location.href='listar_menu.jsp';");
	    out.println("</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
