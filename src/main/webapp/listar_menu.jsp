
<%@page import="model.MenuDAO"%>
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
	  if(confirm('Deseja realmente excluir o menu "'+nome+'" ?')) {
		  location.href='gerenciar_menu.do?acao=deletar&idMenu='+id;
	  }
  }
</script>

</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Lista de Menus</h1>

		<a href="form_menu.jsp" class="btn btn-primary">Novo Menu</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarMenu">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Link</th>
				<th>Icone</th>
				<th>Exibir</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Link</th>
				<th>Icone</th>
				<th>Exibir</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			
			<jsp:useBean class="model.MenuDAO" id="mDAO"></jsp:useBean>
			
			
			<tbody>
			<c:forEach var="m" items="${mDAO.lista}">

				<tr>
					<td>${m.idMenu}</td>
					<td>${m.nome}</td>
					<td>${m.link}</td>
					<td>${m.icone}</td>
					<td>
					 <c:if test="${m.exibir==1 }" >
					  Sim
					 </c:if>
					  <c:if test="${m.exibir==2 }" >
					  Nao
					 </c:if> 
					</td>
					<td><a class="btn btn-primary" href="gerenciar_menu.do?acao=alterar&idMenu=${m.idMenu}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					</a>
						<button class="btn-danger" onclick="confirmarExclusao(${m.idMenu},'${m.nome}')">
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