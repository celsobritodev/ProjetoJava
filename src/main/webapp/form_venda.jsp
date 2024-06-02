<%@page import="model.VendaProduto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="model.Cliente"%>
<%@page import="model.Venda"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width,initial-scale=1, maximum-scale=1, user=scalable=no"
	name="viewport" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<title>Form Venda</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Cadastrar Nova Venda</h1>

        <%
        
          Venda v = new Venda();
          Cliente c = new Cliente(); 
          try {
        	String acao = request.getParameter("acao"); 
        	ClienteDAO cDAO = new ClienteDAO();
        	if (acao.equals("novo")) {
        		int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        		c = cDAO.getCarregarPorId(idCliente);
        		v.setCliente(c);
        		v.setVendedor(ulogado); // ulogado é do tipo Usuario
        		v.setCarrinho(new ArrayList<VendaProduto>());
        		session.setAttribute("venda",v);
        		
        	} else {
        		
        		v = (Venda) session.getAttribute("venda");
        		
        	}
          } catch (Exception e) {
        	  out.print("Erro: "+e);
        	  
          }
        %>
		<br/><br/>
		Vendedor: <%=v.getVendedor().getNome() %>
		<br/>
		Cliente: <%=v.getCliente().getNomeRazao()%> <br/>
		<h4>Catálogo: (<%=v.getCarrinho().size()%> Itens do Carrinho)</h4>

        <jsp:useBean class="model.ProdutoDAO" id="produto"/>
        <c:forEach var="p" items="${produto.lista}">
           <div id="prod${p.idProduto}">
             <form action="gerenciar_carrinho.do" method="GET">
              <input type="hidden" name="acao" value="add">
              <input type="hidden" name="idProduto" value ="${p.idProduto}">
              ${p.nome}
              <input type="number" name="qtd" value="1" style="width: 40px">
              <button class="btn btn-default">
               <i class="glyphicon glyphicon">Comprar</i>
              </button>
             </form>
           </div>
                    
        </c:forEach>
        
        <a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a>
        <a href="form_finalizar_venda.jsp" class="btn btn-success">Finalizar Venda</a>
	</div>
</body>
</html>

