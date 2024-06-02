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
<title>Form Cliente</title>
</head>
<body>
	<div class="container-fluid">
		<%@include file="banner.jsp"%>
		<%@include file="menu.jsp"%>
		<h1>Cadastrar Cliente</h1>

		<form action="gerenciar_cliente.do" method="post">
			<input type="hidden" name="idCliente" value="${cliente.idCliente}" />
			<div class="row">
				<div class="form-group col-sm-6">
				   <label for="nomeRazao" class="control-label">Nome / Razão Social</label>
				   <input type="text" class="form-control" name="nomeRazao" id="nomeRazao" required value="${cliente.nomeRazao}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="cpfCnpj" class="control-label">Cpf / Cnpj</label>
				   <input type="text" class="form-control" name="cpfCnpj" id="cpfCnpj" required value="${cliente.cpfCnpj}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="rgIe" class="control-label">RG / IE</label>
				   <input type="text" class="form-control" name="rgIe" id="rgIe" value="${cliente.rgIe}" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="dataNascAbertura" class="control-label">data de Nascimento / Abertura</label>
				   <input type="text" class="form-control" name="dataNascAbertura" id="dataNascAbertura" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.dataNascAbertura}"/>" maxlength="45"/>
				</div>
				<div class="form-group col-sm-6">
				   <label for="tipo" class="control-label">Tipo</label>
	               <select class="form-control" name="tipo">
	                 <option value="1"
	                  <c:if test="${cliente.tipo==1}">
	                    selected=""
	                  </c:if>
	                  >Pessoa Física</option>
	                  <option value="2"
	                  <c:if test="${cliente.tipo==2}">
	                    selected=""
	                  </c:if>
	                  >Pessoa Jurídica</option>
	                 
	               </select>
				</div>
			</div>
            <div class="row">
              <button class="btn btn-success">Gravar</button>
              <a href="listar_cliente.jsp" class="btn btn-warning">Voltar</a>
            </div>
		</form>

	</div>
</body>
</html>