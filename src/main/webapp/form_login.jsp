<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta content="width=device-width,initial-scale=1, maximum-scale=1, user=scalable=no"
	name="viewport" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="bootstrap-3.3.7/dist/bootstrap-theme.min.css">
<title>Login</title>
</head>

<body>

  <h1>Formulario de Login</h1>
  <%
    String mensagem = (String) request.getSession().getAttribute("mensagem");
    if(mensagem!=null) {
    	request.getSession().removeAttribute("mensagem");
    
  %>
  <div class="alert alert-info"><%=mensagem%></div>
  <%
    }
    
    %>
 <form action="gerenciar_login.do" method="post">
 
   <div class="row">
    <div class="form-group col-sm-8">
     <label for="login" class="control-label">Login</label>
     <input type="text" name="login" id="login" value="" required >
    </div>
   </div>
   <div class="row">
    <div class="form-group col-sm-8">
     <label for="senha" class="control-label">Senha</label>
     <input type="password" name="senha" id="senha" value="" required >
    </div>
   </div>
   <div class="row">
     <button class="btn btn-sucess">Entrar</button>
   
   </div>
 
 
 
 </form>
 
 
 
</body>
</html>