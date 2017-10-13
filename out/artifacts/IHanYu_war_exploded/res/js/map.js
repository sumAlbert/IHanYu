$(document).ready(function () {
    var lng=121.1111;
    var lat=31.222;

    var map = new AMap.Map("map", {
        resizeEnable: true,
        zoom: 10,
        city: '上海市',
        lang: 'zh_en'
    });
    map.on('mouseup',function () {
        lng=map.getCenter().lng;
        lat=map.getCenter().lat;
        mapCenterChange();
    });

    /**
     *  当前地图的中心点改变，将其发送给后端
     */
    function mapCenterChange(){
        $.ajax({
            type: "post",
            url: "/test",
            timeout: 800000,
            data : {
                lng: lng,
                lat: lat
            },
            success : function (data) {
                console.log(data.errorCode);
                resizeInfo(data);
            },
            error : function() {
                console.log("error");

            }
        })
    }

});