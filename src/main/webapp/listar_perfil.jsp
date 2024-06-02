<%@page import="model.PerfilDAO"%>
<%@page import="model.Perfil"%>
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

<title>Listar Perfil</title>
<script type="text/javascript">
  function confirmarExclusao(id,nome) {
	  if(confirm('Deseja realmente excluir o perfil "'+nome+'" ?')) {
		  location.href='gerenciar_perfil.do?acao=deletar&idPerfil='+id;
	  }
  }

</script>
</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Listar os Perfis</h1>

		<a href="form_perfil.jsp" class="btn btn-primary">Novo Perfil</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarPerfil">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome Perfil</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nome Perfil</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			<jsp:useBean class="model.PerfilDAO" id="pDAO"></jsp:useBean>
			<tbody>
			<c:forEach var="p" items="${pDAO.lista}">

				<tr>
					<td>${p.idPerfil}</td>
					<td>${p.nome}</td>
					<td><a class="btn btn-primary" href="gerenciar_perfil.do?acao=alterar&idPerfil=${p.idPerfil}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					</a>
						<button class="btn-danger" onclick="confirmarExclusao(${p.idPerfil},'${p.nome}')">
							<i class="glyphicon glyphicon-trash"></i>
						</button>
						<a class="btn btn-default" href="gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=${p.idPerfil }">
						 <i class="glyphicon">Acessos</i>
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