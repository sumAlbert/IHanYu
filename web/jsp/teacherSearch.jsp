<%--
  Created by IntelliJ IDEA.
  User: 98267
  Date: 2017/10/14
  Time: 10:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>爱汉语</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../res/css/header.css">
    <link rel="stylesheet" type="text/css" href="../res/css/teacherSearch.css">
</head>
<body>
<div class="head" id="head1">
    <div class="space-image space-row"></div>
    <div class="image"></div>
    <div class="image-space-items space-row"></div>
    <div class="items">
        <div class="item">首页<br/>Home</div>
        <div class="item">汉语教师<br/>Chinese Teacher</div>
        <div class="item">语伴<br/>Language Partner</div>
    </div>
    <div class="items-space-login-regist space-row"></div>
    <div class="login-regist">
        <div class="login-regist-item" id="login">登录<br/>Login</div>
        <div class="login-regist-item" id="regist">注册<br/>Regist</div>
        <div class="user">
            <img class="user_head" src='<%=session.getAttribute("headp")%>'>
            <div class="user_name"><%=session.getAttribute("username")%></div>
        </div>
        <div class="user_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个人中心</div>
        <div class="user_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页</div>
        <div class="user_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;教师</div>
        <div class="user_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;语伴</div>
        <div class="user_item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;退出</div>
    </div>
    <div class="login-regist-space space-row"></div>
</div>
<div class="content">
    <div class="content-panels">
        <div class="content-panels-line guidance-line">
            <div class="content-panel guidance-panel">
                <div class="guidance-item">
                    <div class="guidance-item-shows">
                        <div class="guidance-item-show-name">
                            <div class="guidance-item-name">汉语等级</div>
                            <div class="guidance-item-name guidance-item-name-en">Chinese Level</div>
                        </div><!--
                            --><div class="guidance-item-show-flag"></div>
                    </div>
                    <div class="guidance-item-hidden" id="chinese-level">
                        <div class="guidance-item-hidden-box">
                            <div class="guidance-item-hidden-item" id="item-1">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">初级汉语</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Intermediate</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-2">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">中级汉语</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Advanced</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-3">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">高级汉语</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">advance</div>
                            </div>
                        </div>
                        <div class="verify-button">OK</div>
                    </div>
                </div>
                <div class="guidance-item">
                    <div class="guidance-item-shows">
                        <div class="guidance-item-show-name">
                            <div class="guidance-item-name">教学内容</div>
                            <div class="guidance-item-name guidance-item-name-en">Chinese Skills</div>
                        </div><!--
                            --><div class="guidance-item-show-flag"></div>
                    </div>
                    <div class="guidance-item-hidden" id="chinese-skills">
                        <div class="guidance-item-hidden-box">
                            <div class="guidance-item-hidden-item" id="item-4">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">口语</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Speaking</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-5">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">听力</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Listening</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-6">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">阅读</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Reading</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-7">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">写作</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Character</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-8">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">汉字</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Character</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-9">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">文化</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Chinese Culture</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-10">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">商务汉语</div>
                            </div>
                            <div class="guidance-item-hidden-item-en">
                                <div class="guidance-item-hidden-item-flag-en"></div>
                                <div class="guidance-item-hidden-item-content-en">Business Chinese</div>
                            </div>
                        </div>
                        <div class="verify-button">OK</div>
                    </div>
                </div>
                <div class="guidance-item">
                    <div class="guidance-item-shows">
                        <div class="guidance-item-show-name">
                            <div class="guidance-item-name">价格</div>
                            <div class="guidance-item-name guidance-item-name-en">Price</div>
                        </div><!--
                            --><div class="guidance-item-show-flag"></div>
                    </div>
                    <div class="guidance-item-hidden" id="price">
                        <div class="guidance-item-hidden-box">
                            <div class="guidance-item-hidden-item" id="item-11">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">70-99RMB/h</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-12">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">100-149RMB/h</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-13">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">150-199RMB/h</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-14">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">200+RMB/h</div>
                            </div>
                        </div>
                        <div class="verify-button">OK</div>
                    </div>
                </div>
                <div class="guidance-item">
                    <div class="guidance-item-shows">
                        <div class="guidance-item-show-name">
                            <div class="guidance-item-name">HSK</div>
                        </div><!--
                            --><div class="guidance-item-show-flag"></div>
                    </div>
                    <div class="guidance-item-hidden" id="hsk">
                        <div class="guidance-item-hidden-box">
                            <div class="guidance-item-hidden-item" id="item-15">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK1</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-16">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK2</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-17">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK3</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-18">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK4</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-19">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK5</div>
                            </div>
                            <div class="guidance-item-hidden-item" id="item-20">
                                <div class="guidance-item-hidden-item-flag" value="false"></div>
                                <div class="guidance-item-hidden-item-content">HSK6</div>
                            </div>
                        </div>
                        <div class="verify-button">OK</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="content-panels-line other-line">
            <div class="content-panel map-panel">
                <div class="map-content" id="map" name="teacherSearch"></div>
            </div>
            <div class="content-panel-items">
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="content-panel-teacher-item">
                    <div class="content-panel-teacher-box">
                        <div class="teacher-item-avatar">
                            <img src="../res/img/avatar_test.png">
                        </div>
                        <div class="teacher-infos-1">
                            <div class="teacher-info">章老师</div>
                            <div class="teacher-info teacher-info-en">Zhang laoshi</div>
                        </div>
                        <div class="teacher-infos-2">
                            <div class="teacher-info teacher-info-en">￥90/h</div>
                            <div class="teacher-info teacher-info-en">2000m</div>
                        </div>
                    </div>
                </div>
                <div class="page-control-box">
                    <div class="last-page"></div>
                    <div class="input-box">
                        <input type="text" id="page-num" value="1">
                    </div>
                    <div class="page-num" value="51">/51</div>
                    <div class="next-page"></div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="../res/js/jquery-3.2.0.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.4.0&key=8f7d9a042274ce0f92b63b501c29dfee"></script>
<script type="text/javascript" src="../res/js/teacherSearch.js"></script>
<script type="text/javascript" src="../res/js/map.js"></script>
<script type="text/javascript" src="../res/js/header.js"></script>
</html>
