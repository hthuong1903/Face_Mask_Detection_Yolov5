
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/home.css" rel="stylesheet" type="text/css">
        <link href="css/slideShow.css" rel="stylesheet" type="text/css"/>
        <title>My Front Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="about">
                        <h3>${g.name}</h3>
                    </div>
                    <div class="big_frame">
                        <div class="direct">
                            <a class="pre" onclick="plusDivs(-1)" >&#10094;</a>
                            <a class ="next" onclick="plusDivs(1)">&#10095;</a>
                        </div>
                        <div class="frame">
                            <c:forEach var="o" items="${listI}">
                                <img class="show" src="${o.url}" alt=""/>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="contentGalery">
                        <ul >
                            <c:forEach items="${listI}" var="o" >
                                <li class="span4">
                                    <a href="detail?id=${o.gallery_id}"><img class="listImg" src="${o.url}"></a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                </div>
                <div class="right">
                    <jsp:include page="Right.jsp"/>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"/>
        <script src="Js/sliderJs.js" type="text/javascript"></script>
    </body>
</html>
