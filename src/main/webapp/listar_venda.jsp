
<%@page import="model.UsuarioDAO"%>
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

<title>JSP PAGE</title>

<script type="text/javascript">
  function confirmarDesativacao(id) {
	  if(confirm('Deseja realmente desativar a venda "'+id+'" ?')) {
		  location.href='gerenciar_venda.do?acao=deletar&idVenda='+id;
	  }
  }
</script>

</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Lista de Vendas</h1>

		<a href="form_venda.jsp" class="btn btn-primary">Novo Usuario</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarVenda">
			<thead>
			<tr>
				<th>ID</th>
				<th>Data</th>
				<th>Cliente</th>
				<th>Usuario</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
		<tr>
			    <th>ID</th>
				<th>Data</th>
				<th>Cliente</th>
				<th>Usuario</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			
			<jsp:useBean class="model.VendaDAO" id="vDAO"></jsp:useBean>
			
			
			<tbody>
			<c:forEach var="v" items="${vDAO.lista}">

				<tr>
					<td>${v.idVenda}</td>
					<td><fmt:formatDate pattern="dd/MM/YYYY" value="${v.dataVenda}"/></td>
					<td>${v.cliente.nomeRazao}</td>
					<td>${v.vendedor.nome}</td>
					
					<td><a class="btn btn-primary" href="gerenciar_venda.do?acao=alterar&idVenda=${v.idVenda}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					</a>
						<button class="btn-danger" onclick="confirmarDesativacao(${v.idVenda})">
							<i class="glyphicon glyphicon-trash"></i>
						</button></td>
				</tr>

			</c:forEach>
			</tbody>
		</table>
		<script type="text/javascript" src="DataTables/datatables.js"></script>
		<script type="text/javascript" src="DataTables/datatables.min.js"></script>

	</div>
</body>
</html>