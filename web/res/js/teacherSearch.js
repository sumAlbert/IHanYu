$(document).ready(function () {
    var tag_info={}; //记录标签信息
    var now_page=0;



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
            var tag_id=$(this).attr("id");
            tag_info[tag_id]=$(this).find(".guidance-item-hidden-item-flag").attr("value");
        });
        searchTeacher();
    });

    //输入页码切换页面
    $("#page-num").keypress(function (event) {
        if(event.keyCode==13){
            var page_input=$("#page-num").val();
            var sum_page=$(".page-num").attr("value");
            if(!isNaN(page_input)){
                if(page_input>0&&page_input<=sum_page){
                    now_page=page_input;
                    searchTeacher();
                }
            }
        }
    });

    //上下翻页
    $(".last-page").click(function () {
        var page_input=$("#page-num").attr("value");
        var sum_page=$(".page-num").attr("value");
        console.log(page_input);
        if(page_input-0>1&&page_input-0<=sum_page-0){
            now_page=now_page-1;
            $("#page-num").attr("value",now_page);
            searchTeacher();
        }
    });
    $(".next-page").click(function () {
        var page_input=$("#page-num").attr("value");
        var sum_page=$(".page-num").attr("value");
        if(page_input-0>=1&&page_input-0<sum_page-0){
            now_page=now_page+1;
            $("#page-num").attr("value",now_page);
            searchTeacher();
        }
    });




    //TODO 传递页数和标签以后，返回成功后要执行的代码
    /**
     * url  （待定）
     * tag_info String 标签是否被选中的信息
     * page int 当前页码
     */
    function searchTeacher(){
        $.ajax({
            type: "post",
            url: "/test",
            timeout: 800000,
            data : {
                tag_info: JSON.stringify(tag_info),
                page: now_page
            },
            success : function (data) {
                console.log(data.errorCode);
            },
            error : function() {
                console.log("serror")
            }
        })
    }
    resizeInfo=function(data){
        console.log(JSON.stringify(data));
    }
});