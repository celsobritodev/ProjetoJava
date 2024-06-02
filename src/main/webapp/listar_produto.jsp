
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

<title>Listar Produto</title>

<script type="text/javascript">
  function confirmarExclusao(id,nome) {
	  if(confirm('Deseja realmente excluir o produto "'+nome+'" ?')) {
		  location.href='gerenciar_produto.do?acao=deletar&idProduto='+id;
	  }
  }
</script>

</head>
<body>
	<div class="container">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Lista de Produto</h1>

		<a href="form_produto.jsp" class="btn btn-primary">Novo Cadastro</a>

		<table class="table table-hover table-striped table-bordered display"
			id="listarProduto">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>QTD</th>
				<th>Valor</th>
				<th>Opções</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nome</th>
				<th>QTD</th>
				<th>Valor</th>
				<th>Opções</th>
			</tr>
			</tfoot>
			
			
			<jsp:useBean class="model.ProdutoDAO" id="pDAO"></jsp:useBean>
			
			
			<tbody>
			<c:forEach var="p" items="${pDAO.lista}">

				<tr>
					<td>${p.idProduto}</td>
					<td>${p.nome}</td>
					<td>${p.qtd}</td>
					<td><fmt:formatNumber pattern="#,##0.00" value="${p.valor}"/></td>
					
					<td><a class="btn btn-primary" href="gerenciar_produto.do?acao=alterar&idProduto=${p.idProduto}"> 
							<i class="glyphicon glyphicon-pencil"></i>
					</a>
						<button class="btn-danger" onclick="confirmarExclusao(${p.idProduto},'${p.nome}')">
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