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
 * Servlet implementation class GerenciarPerfil
 */
@WebServlet(urlPatterns = { "/gerenciar_perfil.do"})
public class GerenciarPerfil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GerenciarPerfil() {
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
		String idPerfil = request.getParameter("idPerfil");
		
		Perfil p = new Perfil();
		
		try {
			PerfilDAO pDAO = new PerfilDAO();
			if (acao.equals("alterar")) {
				p = pDAO.getCarregaPorId(Integer.parseInt(idPerfil));
				if (p.getIdPerfil()>0) {
					RequestDispatcher disp = getServletContext().getRequestDispatcher("/form_perfil.jsp");
					request.setAttribute("perfil", p);
                    disp.forward(request, response);					
				} else  {
					mensagem = "Perfil não encontrado";
					
				}
			}
			if (acao.equals("deletar")) {
				p.setIdPerfil(Integer.parseInt(idPerfil));
				if (pDAO.deletar(p)) {
					mensagem = "Deletado com sucesso";
				} else {
					mensagem = "Erro ao excluir o perfil";
				}
			}
			
		} catch (Exception e) {
			out.print(e);
			mensagem = "Erro ao executar";
		}
		
		out.println("<script type='text/javascript'>");
	    out.println("alert('"+mensagem+"');");
	    out.println("location.href='listar_perfil.jsp';");
	    out.println("</script>");
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       PrintWriter out = response.getWriter();
	       String idPerfil = request.getParameter("idPerfil");
	       String nome = request.getParameter("nome");
	       
	       String mensagem="";
	       
	       Perfil p = new Perfil();
	       try {
	    	   PerfilDAO pDAO = new PerfilDAO();
	    	   if (!idPerfil.isEmpty()) {
	    		   p.setIdPerfil(Integer.parseInt(idPerfil));
	    	   }
	    	   if (nome.equals("") || nome.isEmpty()) {
	    		   mensagem = "Campos obrigatórios deverão ser preenchidos";
	    	   } else {
	    		   p.setNome(nome);
	    		   if (pDAO.gravar(p)) {
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
	    out.println("location.href='listar_perfil.jsp';");
	    out.println("</script>");
	       
	       
	}

}
