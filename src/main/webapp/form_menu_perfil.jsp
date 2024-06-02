<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content="width=device-width,initial-scale=1, maximum-scale=1, user=scalable=no"
	name="viewport" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<title>Form Menu Perfil</title>
<script type="text/javascript">
  function confirmarExclusao(idMenu,nome,idPerfil) {
	  if(confirm('Deseja realmente desvincular o menu "'+nome+'" ?')) {
		  location.href='gerenciar_menu_perfil.do?acao=desvincular&idMenu='+idMenu+'&idPerfil='+idPerfil;
	  }
  }
</script>

</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Gerenciar Perfil</h1>

		<form action="gerenciar_menu_perfil.do" method="post">
			<input type="hidden" name="idPerfil" value="${perfilv.idPerfil}" />
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="perfil" class="control-label">${perfilv.nome}</label>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-sm-6">
					<label for="menu" class="control-label">Menus não vinculados</label>
					 <select name="idMenu" required id="idMenu" class="form-control">
						<option value="">Selecione o Menu</option>
						<c:forEach var="m" items="${perfilv.naoMenus}">
							<option value="${m.idMenu}">${m.nome}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<button class="btn btn-success">Vincular</button>
				<a href="listar_perfil.jsp" class="btn btn-warning">Voltar</a>
			</div>
		</form>
	<table class="table table-hover table-striped table-bordered display" id="listarMenu">
			<thead>
			<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Link</th>
				<th>Icone</th>
				<th>Exibir</th>
				<th>Desvincular</th>
			</tr>
			</thead>
			<tfoot>
			<tr>
				<th>ID</th>
				<th>Nome Menu</th>
				<th>Link</th>
				<th>Icone</th>
				<th>Exibir</th>
				<th>Desvincular</th>
			</tr>
			</tfoot>
			
			<jsp:useBean class="model.MenuDAO" id="mDAO"></jsp:useBean>
			
			<tbody>
			<c:forEach var="m" items="${perfilv.menus}">

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
					<td>
						<button class="btn-danger" onclick="confirmarExclusao(${m.idMenu},'${m.nome}',${perfilv.idPerfil })">
							<i class="glyphicon glyphicon-trash"></i>
						</button></td>
				</tr>

			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>