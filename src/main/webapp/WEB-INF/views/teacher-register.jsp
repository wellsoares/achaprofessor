<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>

        <title>Cadastro de professores</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    </head>

    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Panel title</h3>
            </div>
            <div class="panel-body">
                <form id="frm-register-teacher" action="${spring:mvcUrl("saveTeacher").build()}" method="post">
                    <div class="input-group input-group-lg">
                        <input id="name" name="name"
                               type="text" class="form-control" placeholder="Nome" aria-describedby="sizing-addon1">
                        <input id="age" name="age" 
                               type="text" class="form-control" placeholder="Idade" aria-describedby="sizing-addon1">
                        <input id="email" name="email" 
                               type="text" class="form-control" placeholder="Email" aria-describedby="sizing-addon1">
                        <input id="password" name="password" 
                               type="password" class="form-control" placeholder="Senha" aria-describedby="sizing-addon1">

                        <div class="dropdown">
                            <button id="genre" name="genre"
                                    class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                Sexo
                                <span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li><a href="#">M</a></li>
                                <li><a href="#">F</a></li>
                            </ul>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-default navbar-btn">Cadastrar</button>
                </form>
            </div>
        </div>
    </body>
</html>