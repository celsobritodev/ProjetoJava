package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Menu;
import model.Usuario;
import model.UsuarioDAO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 * Servlet implementation class GerenciarLogin
 */
@WebServlet(urlPatterns = { "/gerenciar_login.do"})
public class GerenciarLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	private static HttpServletResponse response;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GerenciarLogin() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("ulogado");
		response.sendRedirect("form_login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	   GerenciarLogin.response = response;
	   String login = request.getParameter("login");
	   String senha = request.getParameter("senha");
	   ArrayList<String> erros = new ArrayList<String>();
	   if (login==null || login.trim().isEmpty()) {
		   erros.add("Preencha o login");
	   }
	   if (senha==null || senha.trim().isEmpty()) {
		   erros.add("Preencha a senha");
	   }
	   
	   if(erros.size()>0) {
		   String campos = "";
		   for(String erro:erros) {
			   campos = campos + "\\n"+erro;
		   }
		   exibirMensagem("Preencha os campo(s): "+campos);
	   } else {
		   try {
			UsuarioDAO uDAO = new UsuarioDAO();
			Usuario u = new Usuario();
			u = uDAO.getRecuperarUsuario(login);
			if (u.getIdUsuario()>0 && u.getSenha().equals(senha)) {
				HttpSession sessao = request.getSession();
				sessao.setAttribute("ulogado", u);
				response.sendRedirect("index.jsp");
			} else {
				exibirMensagem("Login ou senha inválidos!");
			}
		} catch (Exception e) {
			exibirMensagem("Usuário ou Perfil não Encontrado!");
		}
	   }
	
	}
	
	private static void exibirMensagem(String mensagem) {
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('"+mensagem+"');");
			out.print("history.back();");
			out.print("</script>);");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static Usuario verificarAcesso(HttpServletRequest request, HttpServletResponse response) {
		
		Usuario u = null;
		GerenciarLogin.response = response;
		try {
			HttpSession sessao = request.getSession();
			if(sessao.getAttribute("ulogado")==null) {
				response.sendRedirect("form_login.jsp");
			} else {
				String uri = request.getRequestURI();
				String queryString = request.getQueryString();
				if (queryString!=null) {
					uri += "?"+queryString;
				}
				u = (Usuario) request.getSession().getAttribute("ulogado");
				if (u==null) {
					sessao.setAttribute("mensagem","Você não está autenticado!");
					response.sendRedirect("form_login.jsp");
				} else {
					boolean possuiAcesso = false;
					for(Menu m: u.getPerfil().getMenus()) {
						String sLinkMenuUser = m.getLink();
						if(uri.contains(sLinkMenuUser)) {
							possuiAcesso = true;
							break;
						}
					}
					if(!possuiAcesso) {
						exibirMensagem("Acesso Negado!");
					}
					
				}
						
			}
			
		} catch (Exception e) {
			exibirMensagem("Exceção: "+e.getMessage());
		}
		return u;
	}
	
	
public static boolean verificarPermissao(HttpServletRequest request, HttpServletResponse response) {
		
		Usuario u = null;
		GerenciarLogin.response = response;
		boolean possuiAcesso = false;
		try {
			HttpSession sessao = request.getSession();
			if(sessao.getAttribute("ulogado")==null) {
				response.sendRedirect("form_login.jsp");
			} else {
				String uri = request.getRequestURI();
				String queryString = request.getQueryString();
				if (queryString!=null) {
					uri += "?"+queryString;
				}
				u = (Usuario) request.getSession().getAttribute("ulogado");
				if (u==null) {
					sessao.setAttribute("mensagem","Você não está autenticado!");
					response.sendRedirect("form_login.jsp");
				} else {
				
					for(Menu m: u.getPerfil().getMenus()) {
						String sLinkMenuUser = m.getLink();
						if(uri.contains(sLinkMenuUser)) {
							possuiAcesso = true;
							break;
						}
					}
				
					
				}
						
			}
			
		} catch (Exception e) {
			exibirMensagem("Exceção: "+e.getMessage());
		}
		return possuiAcesso;
	}
	

}
