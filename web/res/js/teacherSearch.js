$(document).ready(function () {
    var tags=[];

    //移动到标签选择按钮上
    $(".guidance-item").hover(function () {
        $(this).find(".guidance-item-hidden").show();
        $(this).find(".guidance-item-shows").css({"border":"1px solid #ccc","border-bottom":"none","z-index":"10"});
        $(this).find(".guidance-item-show-flag").css({"background": "url('../res/img/upper-tri.png') center center no-repeat","background-size": "100% 100%","transform":"rotate(180deg)"});
    },function () {
        $(this).find(".guidance-item-hidden").hide();
        $(this).find(".guidance-item-shows").css({"border":"1px solid transparent","z-index":"0"});
        $(this).find(".guidance-item-show-flag").css({"background": "url('../res/img/bottom-tri.png') center center no-repeat","background-size": "100% 100%","transform":"rotate(0deg)"});
    });

    //点击标签项
    $(".guidance-item-hidden-item").click(function () {
        var value=$(this).find(".guidance-item-hidden-item-flag").attr("value");
        if(value=="false"){
            console.log(true);
            $(this).find(".guidance-item-hidden-item-flag").attr("value","true");
            $(this).find(".guidance-item-hidden-item-flag").css({"background": "url('../res/img/check_on.png') center center no-repeat","background-size": "100% 100%"});
        }
        else{
            console.log(false);
            $(this).find(".guidance-item-hidden-item-flag").attr("value","false");
            $(this).find(".guidance-item-hidden-item-flag").css({"background": "url('../res/img/check_off.png') center center no-repeat","background-size": "100% 100%"});
        }
    });

    //点击标签项目的确定按钮
    $(".verify-button").click(function () {
        $(this).find(".guidance-item-hidden").hide();
        $(this).find(".guidance-item-shows").css({"border":"1px solid transparent","z-index":"0"});
        $(this).find(".guidance-item-show-flag").css({"background": "url('../res/img/bottom-tri.png') center center no-repeat","background-size": "100% 100%","transform":"rotate(0deg)"});
        $(".guidance-item-hidden-item").each(function () {
            console.log($(this).attr("id"));
            console.log($(this).find(".guidance-item-hidden-item-flag").attr("value"));
        });
    });
});