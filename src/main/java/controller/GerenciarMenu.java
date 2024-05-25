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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		String mensagem ="";
		
		String acao = request.getParameter("acao");
		String idMenu = request.getParameter("idMenu");
		
		Menu m = new Menu();
		
		try {
			MenuDAO mDAO = new MenuDAO();
			if (acao.equals("alterar")) {
		  	 if (GerenciarLogin.verificarPermissao(request,response)) {
				m = mDAO.getCarregaPorId(Integer.parseInt(idMenu));
				if (m.getIdMenu()>0) {
					RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu.jsp");
					request.setAttribute("menu", m);
                    disp.forward(request, response);					
				} else  {
					mensagem = "Menu não encontrado";
					
				}
			 } else {
				 mensagem = "Acesso negado!";
			 }
			}
			if (acao.equals("deletar")) {
			 if (GerenciarLogin.verificarPermissao(request,response)) {
				m.setIdMenu(Integer.parseInt(idMenu));
				if (mDAO.deletar(m)) {
					mensagem = "Deletado com sucesso";
				} else {
					mensagem = "Erro ao excluir o menu";
				}
			 } else {
				mensagem = "Acesso negado!"; 
			 }
			}
			
		} catch (Exception e) {
			out.print(e);
			mensagem = "Erro ao executar";
		}
		out.println("<html>");
		out.println("<body>");
		out.println("<script type='text/javascript'>");
	    out.println("alert('"+mensagem+"');");
	    out.println("location.href='listar_menu.jsp';");
	    out.println("</script>");
	    out.println("</body>");
	    out.println("</html>");
	    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		   PrintWriter out = response.getWriter();
	       String idMenu = request.getParameter("idMenu");
	       String nome = request.getParameter("nome");
	       String link = request.getParameter("link");
	       String icone = request.getParameter("icone");
	       String exibir = request.getParameter("exibir");
	       
	       String mensagem="";
	       
	       Menu m = new Menu();
	       try {
	    	   MenuDAO mDAO = new MenuDAO();
	    	   if (!idMenu.isEmpty()) {
	    		   m.setIdMenu(Integer.parseInt(idMenu));
	    	   }
	    	   if (nome.equals("") || nome.isEmpty() || link.equals("")| exibir.equals("")) {
	    		   mensagem = "Campos obrigatórios deverão ser preenchidos";
	    	   } else {
	    		   m.setNome(nome);
	    		   m.setLink(link);
	    		   m.setIcone(icone);
	    		   m.setExibir(Integer.parseInt(exibir));
	    		   if (mDAO.gravar(m)) {
	    			   mensagem = "Gravado com sucesso";
	    		   } else {
	    			   mensagem = "Erro ao gravar no banco de dados";
	    		   }
	    	   }
		} catch (Exception e) {
			out.print(e);
			mensagem="Erro ao executoar";
		}
	    out.println("<script type='text/javascript'>");
	    out.println("alert('"+mensagem+"');");
	    out.println("location.href='listar_menu.jsp';");
	    out.println("</script>");
	       
	}

}
