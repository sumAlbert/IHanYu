/**
 * Created by dell2 on 2017/5/14.
 */
$(document).ready(function(){
    $(".regist-box-button").eq(0).click(function(){
        window.location.href="/teacher_register";
    });
    $(".regist-box-button").eq(1).click(function(){
        window.location.href="/student_register";
    });
});