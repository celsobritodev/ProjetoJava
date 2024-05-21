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
<link rel="stylesheet" href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<title>JSP Page</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Cadastrar Usuario</h1>

		<form action="gerenciar_usuario.do" method="post">
			<input type="hidden" name="idUsuario" value="${usuario.idUsuario}" />
			<div class="row">
				<div class="form-group col-sm-6">
				   <label for="nome" class="control-label">Nome Menu</label>
				   <input type="text" class="form-control" name="nome" id="nome" required value="${usuario.nome}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="login" class="control-label">Login</label>
				   <input type="text" class="form-control" name="login" id="login" required value="${usuario.login}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="senha" class="control-label">Senha</label>
				   <input type="password" class="form-control" name="senha" id="senha" value="${usuario.senha} required " maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="status" class="control-label">Status</label>
	               <select class="form-control" name="status">
	                 <option value="1"
	                  <c:if test="${usuario.status==1}">
	                    selected=""
	                  </c:if>
	                  >Ativo</option>
	                  <option value="2"
	                  <c:if test="${usuario.status==2}">
	                    selected=""
	                  </c:if>
	                  >Inativo</option>
	                 
	               </select>
				</div>
				<div class="form-group col-sm-6">
				   <label for="perfil" class="control-label">Perfil</label>
	               <select class="form-control" name="idPerfil" required >
	                 <option value="">Selecione o Perfil</option>
	                 <jsp:useBean class="model.PerfilDAO" id="perfil"></jsp:useBean>
	                 <c:forEach var="p" items="${perfil.lista}">
	                   <option value="${p.idPerfil}"
	                      <c:if test="${p.idPerfil==usuario.perfil.idPerfil}">selected="" </c:if>
	                   
	                   >${p.nome}</option>
	                 </c:forEach>
	                 
	               </select>
				</div>
			</div>
            <div class="row">
              <button class="btn btn-success">Gravar</button>
              <a href="listar_usuario.jsp" class="btn btn-warning">Voltar</a>
            </div>
		</form>

	</div>
</body>
</html>