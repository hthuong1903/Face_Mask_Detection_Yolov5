<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/menu.css" rel="stylesheet" type="text/css"/>
        <link href="css/narbar.css" rel="stylesheet" type="text/css"/>
        <title>Take Quiz</title>
    </head>
    <body >
        <div class="container">
            <div class="header"></div>
            <div class="menu">
                <div class="menuItems">
                    <c:if test="${sessionScope.user.role == 2}">
                        <a href="#">Home</a>
                        <a class="menuTakeQuiz" href="#">Take Quiz</a>
                        <a class="menuLogout" href="#">Log out</a>

                    </c:if>
                    <c:if test="${sessionScope.user.role == 1}">
                        <a href="#">Home</a>
                        <a class="menuTakeQuiz" href="#">Take Quiz</a>
                        <a class="menuMakeQuiz" href="#">Make Quiz</a>
                        <a class="menuManageQuiz" href="#">Manage Quiz</a>
                        <a class="menuLogout" href="#">Log out</a>
                    </c:if>

                </div>
            </div>
            <div class="content">
                <div class="titleLabel">
                    Welcome
                    <span class="username">${sessionScope.user.user_name}</span>
                </div>
                <div class="startQuestion">
                    <div class="timeRemaining">
                        Time Remaining: 
                        <span class="time" id="t"></span>
                    </div>
                    <c:forEach items="${list}" var="item">
                        <div class="perQuestion">
                            <form name="startQuizForm"  action="start-quiz" method="post">
                                <div class="questionName">${item.question}</div>
                                <table>
                                    <tr>
                                        <td><input type="checkbox" name="choice" value="1"></td>
                                        <td>${item.option1}</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="choice" value="2"></td>
                                        <td>${item.option2}</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="choice" value="3"></td>
                                        <td>${item.option3}</td>
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="choice" value="4"></td>
                                        <td>${item.option4}</td>
                                    </tr>
                                </table>
                                <button style="margin: 40px 300px;" id="btn" onclick="nextQuestion(${item.id})" type="button">Next</button>
                            </form>
                        </div>  

                    </c:forEach>

                </div>
            </div>
        </div>
        <script>

            var index = ${tag};// cho cai vtri ban dau là 0
            var txt = '${txt}';//luu lai cau hoi va dap an
            var questions = document.getElementsByClassName('perQuestion');
            function display() {
                for (var i = 0; i < questions.length; i++) {
                    questions[i].style.display = 'none';
                }
                questions[index].style.display = 'block';
            }
            display();

            //10-2 4
            function addQuestion(qid) {
                txt += qid + '-';
                var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
                if (checkboxes.length !== 0) {
                    for (var i = 0; i < checkboxes.length; i++) {
                        if (i !== checkboxes.length - 1) {
                            txt += checkboxes[i].value + ' '; // 1 2
                        } else {
                            txt += checkboxes[i].value;
                        }
                    }	
                    for (var i = 0; i < checkboxes.length; i++) {
                        checkboxes[i].checked = false;
                    }
                }
                //10-2 4|11-2 1
                if (index !== questions.length - 1) {
                    txt += '|';
                }
            }
            function nextQuestion(qid) {
                addQuestion(qid);
                submitToServer();
                index++;
                document.cookie = "myindex=" + index;
                document.cookie = "answers=" + txt;
                console.log(txt);
                // hieen thi cau tiep theo
                display();
            }


            function submitToServer() {
                if (index === questions.length - 1) {
                    var myForm = document.createElement("form");
                    myForm.method = "POST";
                    myForm.action = "result";
                    myForm.style.display = "none";
                    var myInput = document.createElement("input");
                    myInput.type = "text";
                    myInput.name = "data";
                    myInput.value = txt;
                    myForm.appendChild(myInput);//add input ve form 
                    document.body.appendChild(myForm);// add form vao trang web
                    myForm.submit();// submit ve server
                }
            }



            var total = ${total};
            function timer() {
                total--;
                if (total <= 0) {
                    document.getElementById('btn').click();
                    submitToServer();
                    return;
                }
                var minute = Math.floor(total / 60);
                var second = total - minute * 60;

                var timeBox = document.getElementById('t');
                if (second < 10) {
                    timeBox.innerHTML = minute + ":0" + second;
                } else {
                    timeBox.innerHTML = minute + ":" + second;
                }
            }
            timer();
            setInterval(function () {
                timer();
            }, 1000);
        </script>
    </body>
</html>
