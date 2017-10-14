<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>爱汉语</title>
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0"/>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="../res/css/homePage2.css">
</head>
<body>
<div class="main">
    <div class="head" id="head1">
        <div class="image"></div>
        <div class="items">
            <div class="item">首页<br/>Home</div>
            <div class="item">汉语教师<br/>Chinese Teacher</div>
            <div class="item">语伴<br/>Language Partner</div>
        </div>
        <div class="login-regist">
            <div class="login-regist-item" id="login">登录<br/>Login</div>
            <div class="login-regist-item" id="regist">注册<br/>Regist</div>
            <div class="user">
                <img class="user_head" src='<%=session.getAttribute("headp")%>'>
                <div class="user_name"><%=session.getAttribute("username")%>
                </div>
            </div>
            <div class="user_item"
                 onclick="changePerson('<%=session.getAttribute("usertype")%>','<%=session.getAttribute("email")%>')">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心
            </div>
            <div class="user_item" onclick="loginOut()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</div>
        </div>
    </div>
    <div class="head-transparent" id="head2">
        <div class="image"></div>
        <div class="items">
            <div class="item-transparent">首页<br/>Home</div>
            <div class="item-transparent">汉语教师<br/>Chinese Teacher</div>
            <div class="item-transparent">语伴<br/>Language Partner</div>
        </div>
        <div class="login-regist">
            <div class="login-regist-item-transparent" id="login2">登录<br/>Login</div>
            <div class="login-regist-item-transparent" id="regist2">注册<br/>Regist</div>
            <div class="user">
                <img class="user_head" src='<%=session.getAttribute("headp")%>'>
                <div class="user_name"><%=session.getAttribute("username")%>
                </div>
            </div>
            <div class="user_item_transparent"
                 onclick="changePerson('<%=session.getAttribute("usertype")%>','<%=session.getAttribute("email")%>')">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心
            </div>
            <div class="user_item_transparent" onclick="loginOut()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</div>
        </div>
    </div>
    <div class="content">
        <div class="page1">
            <div class="page1-head1">这里，你能找到</div>
            <div class="page1-head2">Here , You can get</div>
            <div class="page1-buttons">
                <div class="page1-button ">中文教师<br/>Chinese tutor</div>
                <div class="page1-button">语言伙伴<br/>Language partner</div>
            </div>
        </div>
        <div class="page2" style="background: hsl(0,0%,95%);padding: .01em 0;">
            <div class="page2-head1">语伴推荐</div>
            <div class="page2-head2">Recomended Partner</div>
            <div class="page2-hidden-list">
                <c:forEach  var="test" items ="${list}">
                    <div class="page2-hidden-item" onclick="changePartner('')">
                        <div class="page2-hidden-item-image">
                            <img src="${test.headp}">
                        </div>
                        <div class="page2-hidden-name">&nbsp; ${test.username}</div>
                        <div class="page2-hidden-C">&nbsp;我说：${test.fisl}</div>
                        <div class="page2-hidden-E">&nbsp;I speak : ${test.fislen}</div>
                        <div class="page2-hidden-C">&nbsp;学习：${test.secl}</div>
                        <div class="page2-hidden-E">&nbsp;I learn : ${test.seclen}</div>
                    </div>
                </c:forEach>

                <c:forEach begin="8" end="15" var="test" items ="${list}">
                    <div class="page2-hidden-item" onclick="changePartner('')">
                        <div class="page2-hidden-item-image">
                            <img src='${test.headp}'>
                        </div>
                        <div class="page2-hidden-name">&nbsp; ${test.username}</div>
                        <div class="page2-hidden-C">&nbsp;我说：${test.fisl}</div>
                        <div class="page2-hidden-E">&nbsp;I speak : ${test.fislen}</div>
                        <div class="page2-hidden-C">&nbsp;学习：${test.secl}</div>
                        <div class="page2-hidden-E">&nbsp;I learn : ${test.seclen}</div>
                    </div>
                </c:forEach>
            </div>
            <div class="page2-foot2">More</div>
            <div class="page2-extra"><p>+</p></div>
        </div>
        <div class="page2-hidden" id="page2-hidden">
            <div class="page2-head1">语伴推荐</div>
            <div class="page2-head2">Recomended Partner</div>
            <div class="page2-hidden-list">

            </div>
        </div>
        <div class="page3">
            <div class="page3-head1">教师推荐</div>
            <div class="page3-head2">Recomend Teacher</div>
            <div class="teacher-list" id="teacher-list">
                <c:forEach var="tag" items="${listTea}">
                    <div class="teacher-list-item" onclick="changeTeacher('')">
                        <div class="teacher-item-img">
                            <div class="cloth-screen"></div>
                            <img src='${tag.headp}'/>
                        </div>
                        <div class="teacher-item-name">${tag.name}</div>
                        <div class="teacher-item-kill">
                                <div class="skill-item">${tag.good1}</div>
                                <div class="skill-item">${tag.good2}</div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="teacher-list teacher-list-extra">
            <c:forEach begin="4" end="12" var="tag" items="${listTea}">
                <div class="teacher-list-item" onclick="changeTeacher('')">
                    <div class="teacher-item-img">
                        <div class="cloth-screen"></div>
                        <img src='${tag.headp}'/>
                    </div>
                    <div class="teacher-item-name">${tag.name}</div>
                    <div class="teacher-item-kill">
                        <div class="skill-item">${tag.good1}</div>
                        <div class="skill-item">${tag.good2}</div>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div class="page3-foot1"></div>
        <div class="page3-foot2">More</div>
        <div class="page3-extra"><p>+</p></div>
    </div>
    <div class="other-info">
        <div class="other-info-left">
            <div class="other-info-items">
                <div class="other-info-item">爱汉语</div>
                <div class="other-info-item">爱汉语首页</div>
                <div class="other-info-item">爱汉语官微</div>
            </div>
            <div class="other-info-items">
                <div class="other-info-item">联系与合作</div>
                <div class="other-info-item">联系我们</div>
                <div class="other-info-item">用户反馈</div>
                <div class="other-info-item">加入我们</div>
            </div>
            <div class="other-info-items">
                <div class="other-info-item">移动客户端</div>
                <div class="other-info-item">Android版</div>
                <div class="other-info-item">IOS版</div>
                <div class="other-info-item">Web版</div>
            </div>
        </div>
        <div class="other-info-right">
            <div class="other-info-items">
                <div class="other-info-item">关注我们</div>
                <div class="other-info-item">新浪微博：@爱汉语</div>
                <div class="other-info-item">官方Q Q：982675088</div>
            </div>
        </div>
    </div>
    <div class="home-foot">@2017-2017 iHanyu&nbsp;&nbsp;沪ICP备17027692号&nbsp;&nbsp;沪ICP证件171131号&nbsp;&nbsp;沪公网安备
        11010802020064号
    </div>
</div>
</div>
</body>
<script type="text/javascript" src="../res/js/jquery-3.2.0.min.js"></script>
<script type="text/javascript" src="../res/js/homePage2.js"></script>

</html>