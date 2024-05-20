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
		<h1>Cadastrar Menu</h1>

		<form action="gerenciar_menu.do" method="post">
			<input type="hidden" name="idMenu" value="${menu.idMenu}" />
			<div class="row">
				<div class="form-group col-sm-6">
				   <label for="nome" class="control-label">Nome Menu</label>
				   <input type="text" class="form-control" name="nome" id="nome" required value="${menu.nome}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="link" class="control-label">Link</label>
				   <input type="text" class="form-control" name="link" id="link" required value="${menu.link}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="icone" class="control-label">Icone</label>
				   <input type="text" class="form-control" name="icone" id="icone" value="${menu.icone}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="exibir" class="control-label">Exibir</label>
	               <select class="form-control" name="exibir">
	                 <option value="1"
	                  <c:if test="${menu.exibir==1}">
	                    selected=""
	                  </c:if>
	                  >Sim</option>
	                  <option value="2"
	                  <c:if test="${menu.exibir==2}">
	                    selected=""
	                  </c:if>
	                  >Nao</option>
	                 
	               </select>
				</div>
			</div>
            <div class="row">
              <button class="btn btn-success">Gravar</button>
              <a href="listar_menu.jsp" class="btn btn-warning">Voltar</a>
            </div>
		</form>

	</div>
</body>
</html>