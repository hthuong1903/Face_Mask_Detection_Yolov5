
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link href="css/slideShow.css" rel="stylesheet" type="text/css"/>
        <link href="./css/header.css" rel="stylesheet" type="text/css">
    </head>
    <body>
            <div class="nav">
                <div class= "nav-inner">
                    <ul>
                        <li> <a class="${id=="-1"?"hd":""}"  href="home">My front page</a></li>
                            <c:forEach items="${top3}" var="o" >
                            <li><a class="${id==o.id?"hd":""}" href="detail?id=${o.id}">${o.name}</a></li>
                            </c:forEach>
                        <li> <a  class="${id=="-2"?"hd":""}" href="contact">Contact</a> </li>
                    </ul>
                </div>

            </div>
        <div class="header">
            <div class="header-inner">
                <div class="img"> </div>

                <div class="title ">
                    PHOTOGRAPHER
                </div>
                <div class="subtitle">
                    Welcome to this website
                </div>
            </div>
        </div>
    </body>
</html>