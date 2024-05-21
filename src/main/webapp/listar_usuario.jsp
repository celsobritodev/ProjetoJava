
<%@page import="model.UsuarioDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="jakarta.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  function confirmarExclusao(id,nome) {
	  if(confirm('Deseja realmente desativar o usuario '+nome+' ?')) {
		  location.href='gerenciar_usuario.do?acao=deletar&idUsuario='+id;
	  }
  }
</script>

</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Lista de Usuarios</h1>

		<a href="form_usuario.jsp" class="btn btn-primary">Novo Usuario</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarUsuario">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Login</th>
				<th>Status</th>
				<th>Perfil</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
		<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Login</th>
				<th>Status</th>
				<th>Perfil</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			
			<jsp:useBean class="model.UsuarioDAO" id="uDAO"></jsp:useBean>
			
			
			<tbody>
			<c:forEach var="u" items="${uDAO.lista}">

				<tr>
					<td>${u.idUsuario}</td>
					<td>${u.nome}</td>
					<td>${u.login}</td>
				
					<td>
					 <c:if test="${u.status==1 }" >
					  Ativo
					 </c:if>
					  <c:if test="${u.status==2 }" >
					  Inativo
					 </c:if> 
					</td>
					
					<td>${u.perfil.nome}</td>
					
					<td><a class="btn btn-primary" href="gerenciar_usuario.do?acao=alterar&idUsuario=${u.idUsuario}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					</a>
						<button class="btn-danger" onclick="confirmarExclusao(${u.idUsuario},'${u.nome}')">
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