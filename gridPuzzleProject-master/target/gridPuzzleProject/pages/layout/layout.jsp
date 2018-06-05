<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="actionBean" scope="request" type="com.example.gridPuzzleProject.web.action.BaseAction"/>

<%@ include file="/pages/layout/taglibs.jsp" %>

<s:layout-definition>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>gridGame</title>

        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                crossorigin="anonymous"></script>
    </head>

    <body>
        <%--<nav class="navbar navbar-default">--%>
        <%--<div class="container-fluid">--%>
        <%--<div class="navbar-header">--%>
        <%--<a class="navbar-brand" href="#">Porto Arte</a>--%>
        <%--</div>--%>
        <%--<c:if test="${actionBean.loggedIn}">--%>
        <%--<ul class="nav navbar-nav">--%>
        <%--<c:forEach var="menuOption" items="${actionBean.menuOptions}">--%>
        <%--<c:set var="optionClass" value=""/>--%>
        <%--<c:if test="${actionBean.section.id == menuOption.id}">--%>
        <%--<c:set var="optionClass" value="active"/>--%>
        <%--</c:if>--%>
        <%--<li class="${optionClass}">--%>
        <%--<a href="${menuOption.url}">${menuOption.name}</a>--%>
        <%--</li>--%>
        <%--</c:forEach>--%>
        <%--</ul>--%>
        <%--<ul class="nav navbar-nav navbar-right">--%>
        <%--<li class="dropdown">--%>
        <%--<a href="Login.action?logout">Logout</a>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--</c:if>--%>
        <%--</div>--%>
        <%--</nav>--%>
    <div class="container">
        <div class="row justify-content-center">
            <s:layout-component name="mainContent">
            </s:layout-component>
        </div>
    </div>

    </body>
    </html>
</s:layout-definition>

