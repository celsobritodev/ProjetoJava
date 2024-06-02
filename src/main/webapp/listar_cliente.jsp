
<%@page import="model.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width,initial-scale=1, maximum-scale=1, user=scalable=no"
	name="viewport" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="bootstrap-3.3.7/dist/bootstrap-theme.min.css" />
<link rel="stylesheet" href="DataTables/datatables.min.css" />

<title>Listar Cliente</title>

<script type="text/javascript">
  function confirmarExclusao(id,nome) {
	  if(confirm('Deseja realmente excluir o cliente "'+nome+'" ?')) {
		  location.href='gerenciar_cliente.do?acao=deletar&idCliente='+id;
	  }
  }
</script>

</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Lista de Clientes</h1>

		<a href="form_cliente.jsp" class="btn btn-primary">Novo Cadastro</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarCliente">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome / Razão Social</th>
				<th>CPF / CNPJ</th>
				<th>RG / IE</th>
				<th>Data Nasc / Abertura</th>
				<th>Tipo</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nome / Razão Social</th>
				<th>CPF / CNPJ</th>
				<th>RG / IE</th>
				<th>Data Nasc / Abertura</th>
				<th>Tipo</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			
			<jsp:useBean class="model.ClienteDAO" id="cDAO"></jsp:useBean>
			
			
			<tbody>
			<c:forEach var="c" items="${cDAO.lista}">

				<tr>
					<td>${c.idCliente}</td>
					<td>${c.nomeRazao}</td>
					<td>${c.cpfCnpj}</td>
					<td>${c.rgIe}</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${c.dataNascAbertura}"/> </td>
					<td>
					 <c:if test="${c.tipo==1 }" >
					  Pessoa Física
					 </c:if>
					  <c:if test="${c.tipo==2 }" >
					  Pessoa Jurídica
					 </c:if> 
					</td>
					<td><a class="btn btn-primary" href="gerenciar_cliente.do?acao=alterar&idCliente=${c.idCliente}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					    </a>
					    
						 <button class="btn-danger" onclick="confirmarExclusao(${c.idCliente},'${c.nomeRazao}')">
							<i class="glyphicon glyphicon-trash"></i>
						 </button>
						
						<a href="form_venda.jsp?acao=novo&idCliente=${c.idCliente}" class="btn btn-primary">
						    <i class="glyphicon glyphicon-shopping-cart"> Realizar Venda</i>
						</a>
						
					</td>
				</tr>

			</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript" src="DataTables/datatables.js"></script>
		<script type="text/javascript" src="DataTables/datatables.min.js"></script>

	</div>
</body>
</html>