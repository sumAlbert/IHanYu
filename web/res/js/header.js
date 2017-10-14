/**
 * Created by dell2 on 2017/5/1.
 */
$(document).ready(function () {
    /*控制用户名的信息以及注销等*/
    $(".login-regist").eq(0).hover(
        function () {
            if ($(".login-regist-item").css("display") == "none") {
                $(".user_item").show();
            }
        },
        function () {
            $(".user_item").hide();
        }
    );
    /*首页顶部的三个跳转，分别指向主页、教师、学生*/
    $(".item").eq(0).click(function () {
        window.location.href = "/homepage";
    });
    $(".item").eq(1).click(function () {
        window.location.href = "/searchTeacher";
    });
    $(".item").eq(2).click(function () {
        window.location.href = "partnerSearch.action";
    });
    /*隐藏主页、教师、语伴的跳转*/
    $(".user_item").eq(1).click(function () {
        window.location.href = "/homepage";
    });
    $(".user_item").eq(2).click(function () {
        window.location.href = "/searchTeacher";
    });
    $(".user_item").eq(3).click(function () {
        window.location.href = "partnerSearch.action";
    });
    /*登录与注册页面的跳转*/
    $("#login").click(function () {
        window.location.href = "/toSignIn";
    });
    $("#regist").click(function () {
        window.location.href = "/toSignUp";
    });
});
/**
 * 判断登录状态
 */
window.onload = function submitComment() {
    $.ajax({
        type: "post",//请求方式
        url: "/getLoginState",
        contentType: 'application/x-www-form-urlencoded',
        timeout: 800000,//超时时间：800秒
        dataType: "json",//设置返回数据的格式
        data: {},
        //请求成功后的回调函数 data为json格式
        success: function (data) {
            if (data.errorCode == "0000") {
                $(".user").show();
                $(".login-regist-item").hide();
            }
            else {
                $(".user").hide();
                $(".login-regist-item").show();
            }
        },
        error: function () {
            console.log("请求出错！");
        }
    });
}

/*
 * 注销和个人中心的跳转
 */
function LoginOut() {
    $.ajax({
        type: "post",//请求方式
        url: "/loginOut",
        timeout: 800000,//超时时间：800秒
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded',
        data: {},
        //请求成功后的回调函数 data为json格式
        success: function (data) {
            window.location.href = "/homepage";
        },
        error: function () {
            alert("请求出错！");
        }
    });
}

function changePerson(usertype, email) {
    if (usertype == 1)
        window.location.href = "/teacherVisit/" + email;
    else if (usertype == 2)
        window.location.href = "/partnerVisit/" + email;
    else
        window.location.href = "/studentVisit/" + email;
}
