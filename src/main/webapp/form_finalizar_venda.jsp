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
<link rel="stylesheet"
	href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<script type="text/javascript">
   function excluir(index,item) {
	   if(confirm("Tem certeza que deseja excluir o item "+item+" ?")) {
		   windows.open("gerenciar_carrinho.do?acao=del&index="+index,"_self");
	   }
   }


</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Finalizar Venda</h1>

		<%
		Venda v = new Venda();
		Cliente c = new Cliente();
		try {
			v = (Venda) session.getAttribute("venda");

		} catch (Exception e) {
			out.print("Erro: " + e);
		}
		%>

		<br />
		<br /> Vendedor:
		<%=v.getVendedor().getNome()%>
		<br /> Cliente:
		<%=v.getCliente().getNomeRazao()%>
		<br />

		<table class="table table-striped table-bordered table-hover display"
			id="listaVenda">

			<thead>
				<tr>
					<th>Item</th>
					<th>Produto</th>
					<th>QTD</th>
					<th>Valor</th>
					<th>Total</th>
					<th>Remover</th>
				</tr>
			</thead>

			<tbody>

				<%
				double total = 0;
				int cont = 0;
				for (VendaProduto vp : v.getCarrinho()) {
				%>

				<tr>
					<td align="center"><%=cont + 1%></td>
					<td><%=vp.getProduto().getNome()%></td>
					<td><%=vp.getQtd()%></td>
					<td>R$ <%=vp.getValorVendido()%></td>
					<td>R$ <%=vp.getQtd()*vp.getValorVendido()%></td>
					<td align="center">
					  <a href="#" onclick="excluir(<%=cont%>,<%=cont+1%>)" class="btn btn-danger"> 
						<i class="glyphicon glyphicon-trash"> </i>
					 </a>	
					</td>
				</tr>

				<%
				total = total + (vp.getQtd() * vp.getValorVendido());
				cont++;
				}
				%>

			</tbody>

		</table>



		<a href="listar_cliente.jsp" class="btn btn-warning">Cancelar</a> <a
			href="form_venda.jsp?acao=c" class="btn btn-success">Continuar
			Vendendo</a> <a href="gerenciar_venda.do?acao=incluir"
			class="btn btn-success">Confirmar Venda</a>
	</div>
</body>
</html>

