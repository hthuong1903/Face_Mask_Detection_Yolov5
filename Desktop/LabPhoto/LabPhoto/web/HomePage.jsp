
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/home.css" rel="stylesheet" type="text/css">
        <link href="css/slideShow.css" rel="stylesheet" type="text/css"/>
        <title>My Front Page</title>
    </head>
    <body>
        <div class="container">
            <jsp:include page="Header.jsp"/>
            <div class="main">
                <div class="left">
                    <div class="main_image">
                        <div class="image">
                            <img src="${ct.image}" >
                        </div>
                    </div>
                    <div class="description">
                        ${ct.description}
                    </div>
                    <div class="content">
                        <ul> 
                            <c:forEach items="${listG}" var="o" >
                                <li class="span4">
                                    <div class="image">
                                        <img src="${o.listImage.get("0").url}">
                                    </div>
                                    <h4>
                                        <a href="detail?id=${o.id}">${o.name}</a>
                                    </h4>
                                    <p>
                                        ${o.description}
                                    </p>
                                </li>
                            </c:forEach>
                        </ul>
                        <div class="paging">

                            <c:forEach begin="1" end="${endPage}" var="i">
                                <a class="${index==i?"active":""}" href="home?index=${i}">${i}</a>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="about">
                        <h3>About me</h3>
                    </div>
                    <div class="about-detail">
                        ${ct.about}
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
