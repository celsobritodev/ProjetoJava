package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Perfil;
import model.PerfilDAO;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GerenciarMenuPerfil
 */
@WebServlet(urlPatterns = { "/gerenciar_menu_perfil.do"})
public class GerenciarMenuPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GerenciarMenuPerfil() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
       PrintWriter out = response.getWriter();
       String mensagem = "";
       
       String idPerfil = request.getParameter("idPerfil");
       String acao = request.getParameter("acao");
       
       try {
		PerfilDAO pDAO = new PerfilDAO();
		Perfil p = new Perfil();
		if (acao.equals("gerenciar")) {
			p = pDAO.getCarregaPorId(Integer.parseInt(idPerfil));
			if (p.getIdPerfil()>0) {
				RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_menu_perfil.jsp");
				request.setAttribute("perfilv", p);
				disp.forward(request, response);
			} else {
				mensagem = "Perfil não encontrado";
			}
		}
		if (acao.equals("desvincular")) {
			String idMenu = request.getParameter("idMenu");
			if(idMenu.equals("")) {
				mensagem="O campo idMenu deverá ser selecionado";
			} else {
				if(pDAO.desvincular(Integer.parseInt(idMenu),Integer.parseInt(idPerfil))) {
					mensagem = "Desvinculado com sucesso!";
				} else {
					mensagem = "Erro ao desvincular";
				}
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
    out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil="+idPerfil+"';");
    out.println("</script>");
    out.println("</body>");
    out.println("</html>");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  PrintWriter out = response.getWriter();
	  String mensagem ="";
	  String idPerfil = request.getParameter("idPerfil");
	  String idMenu = request.getParameter("idMenu");
	  try {
		if (idPerfil.equals("")||idMenu.equals("")) {
			mensagem = "Campos obrigatorios deverão ser selecionados";
		} else {
			PerfilDAO pDAO = new PerfilDAO();
			if (pDAO.vincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))) {
				mensagem = "Vinculado com sucesso!";
			} else {
				mensagem = "Erro ao vincular o menu ao perfil";
			}
		}
	} catch (Exception e) {
		out.print(e);
		mensagem="Erro ao executar";
	  
	}
	    out.println("<html>");
		out.println("<body>");
		out.println("<script type='text/javascript'>");
	    out.println("alert('"+mensagem+"');");
	    out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil="+idPerfil+"';");
	    out.println("</script>");
	    out.println("</body>");
	    out.println("</html>");	
	}

}
