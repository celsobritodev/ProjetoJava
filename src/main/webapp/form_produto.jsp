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
<link rel="stylesheet" href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<title>JSP Page</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Cadastrar Produto</h1>

		<form action="gerenciar_proiduto.do" method="post">
			<input type="hidden" name="idProduto" value="${produto.idProduto}" />
			<div class="row">
				<div class="form-group col-sm-6">
				   <label for="nome" class="control-label">Nome</label>
				   <input type="text" class="form-control" name="nome" id="nome" required value="${produto.nome}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="qtdk" class="control-label">QTD</label>
				   <input type="text" class="form-control" name="qtd" id="qtd" required value="${produto.qtd}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="valor" class="control-label">Valor</label>
				   <input type="text" class="form-control" name="valor" id="valor" value="<fmt:formatNumber pattern="#,##0.00" value="${produto.valor}"/>" maxlength="45"/>
				</div>
				
			</div>
            <div class="row">
              <button class="btn btn-success">Gravar</button>
              <a href="listar_produto.jsp" class="btn btn-warning">Voltar</a>
            </div>
		</form>

	</div>
</body>
</html>