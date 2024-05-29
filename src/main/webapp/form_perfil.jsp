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
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Cadastrar Perfil</h1>

		<form action="gerenciar_perfil.do" method="post">
			<input type="hidden" name="idPerfil" value="${perfil.idPerfil}" />
			<div class="row">
				<div class="form-group col-sm-6">
				   <label for="perfil" class="control-label">Nome Perfil</label>
				   <input type="text" class="form-control" name="nome" id="nome" required value="${perfil.nome}" maxlength="45"/>
				</div>
			</div>
            <div class="row">
              <button class="btn btn-success">Gravar</button>
              <a href="listar_perfil.jsp" class="btn btn-warning">Voltar</a>
            </div>
		</form>

	</div>
</body>
</html>

