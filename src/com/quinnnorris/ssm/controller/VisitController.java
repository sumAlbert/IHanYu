package com.quinnnorris.ssm.controller;

import com.quinnnorris.ssm.bean.*;
import com.quinnnorris.ssm.service.impl.HomeServiceImpl;
import com.quinnnorris.ssm.service.impl.LoginServiceImpl;
import com.quinnnorris.ssm.service.impl.VisitServiceImpl;
import com.quinnnorris.ssm.util.BaseJson;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * Title: VisitController
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/9/25 下午5:39 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Controller
public class VisitController {

    @Autowired
    VisitServiceImpl visitServiceImpl;

    @Autowired
    LoginServiceImpl loginServiceImpl;

    @Autowired
    HomeServiceImpl homeServiceImpl;

    @RequestMapping("/teacherVisit/{email:.+}")
    public String teacherVisitUser(@PathVariable String email, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("email") == null || httpSession.getAttribute("email").equals(""))
            return "signIn";
        UserCustom userCustom = new UserCustom();
        userCustom.setEmail(email);
        BaseJson baseJson = visitServiceImpl.serachUserByEmail(userCustom);
        if (baseJson.getErrorCode().equals("1001"))
            //找不到该用户，应该跳转到404页面
            //等前端做出404页面具体再编写
            return "404";

        TeacherCustom teacherCustom = new TeacherCustom();
        teacherCustom.setId((Integer) baseJson.getObject());
        Tea_goodCustom tea_goodCustom = new Tea_goodCustom();
        tea_goodCustom.setId((Integer) baseJson.getObject());
        Tea_timeCustom tea_timeCustom = new Tea_timeCustom();
        tea_timeCustom.setId((Integer) baseJson.getObject());

        BaseJson baseJson1 = visitServiceImpl.getTeachersMessage(teacherCustom);
        BaseJson baseJson2 = visitServiceImpl.getTeacherGoodAt(tea_goodCustom);
        BaseJson baseJson3 = visitServiceImpl.getTeacherTime(tea_timeCustom);
        BaseJson baseJson4 = visitServiceImpl.getUserMes(userCustom);

        Map<String, Object> map = new HashMap<>();
        TeacherCustom custom = (TeacherCustom) baseJson1.getObject();

        map.put("username", custom.getFirstname() + custom.getLastname());
        map.put("wechat", custom.getWechat());
        map.put("payment", custom.getPayment() + "");
        map.put("location", custom.getLocation());
        map.put("style", custom.getStyle());
        map.put("experience", custom.getExperience());
        map.put("good_cn", ((String[]) baseJson2.getObject())[0] + "");
        map.put("good_en", ((String[]) baseJson2.getObject())[1] + "");
        map.put("time_cn", ((String[]) baseJson3.getObject())[0] + "");
        map.put("time_en", ((String[]) baseJson3.getObject())[1] + "");
        map.put("headp", ((UserCustom) baseJson4.getObject()).getHeadp());
        model.addAllAttributes(map);

        return "teacherVisit";
    }

    @RequestMapping("/partnerVisit/{email:.+}")
    public String partnerVisitUser(@PathVariable String email, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("email") == null || httpSession.getAttribute("email").equals(""))
            return "signIn";
        UserCustom userCustom = new UserCustom();
        userCustom.setEmail(email);
        System.out.println(email);
        BaseJson baseJson = visitServiceImpl.serachUserByEmail(userCustom);
        if (baseJson.getErrorCode().equals("1001"))
            //找不到该用户，应该跳转到404页面
            //等前端做出404页面具体再编写
            return "404";
        PartnerCustom partnerCustom = new PartnerCustom();
        partnerCustom.setId((Integer) baseJson.getObject());

        BaseJson baseJson1 = visitServiceImpl.getPartnersMessage(partnerCustom);
        Map<String, Object> map = new HashMap<>();
        PartnerCustom custom = (PartnerCustom) baseJson1.getObject();

        userCustom.setId((Integer) baseJson.getObject());
        BaseJson baseJson2 = loginServiceImpl.getUserName(userCustom);
        BaseJson baseJson3 = visitServiceImpl.getUserMes(userCustom);

        map.put("university", custom.getUniversity());
        map.put("firL", custom.getFisL());
        map.put("firL_en", custom.getFisL_en());
        map.put("secL", custom.getSecL());
        map.put("secL_en", custom.getSecL_en());
        map.put("sex", custom.getSex());
        map.put("sex_en", custom.getSex_en());
        map.put("style", custom.getSelfIntro());
        map.put("self", custom.getSelfIntro());
        map.put("username", baseJson2.getObject());
        map.put("headp", ((UserCustom) baseJson3.getObject()).getHeadp());
        model.addAllAttributes(map);

        return "partnerVisit";
    }

    @RequestMapping("/studentVisit/{email:.+}")
    public String studentVisitUser(@PathVariable String email, Model model, HttpSession httpSession) {
        if (httpSession.getAttribute("email") == null || httpSession.getAttribute("email").equals(""))
            return "signIn";
        UserCustom userCustom = new UserCustom();
        userCustom.setEmail(email);
        BaseJson baseJson = visitServiceImpl.serachUserByEmail(userCustom);
        if (baseJson.getErrorCode().equals("1001"))
            //找不到该用户，应该跳转到404页面
            //等前端做出404页面具体再编写
            return "404";
        StudentCustom studentCustom = new StudentCustom();
        studentCustom.setId((Integer) baseJson.getObject());

        BaseJson baseJson1 = visitServiceImpl.getStudentMessage(studentCustom);
        model.addAllAttributes((Map<String, Object>) baseJson1.getObject());

        return "studentVisit";
    }

    @RequestMapping("/homepage")
    public String hompageReturn(Model model) {
        BaseJson baseJson1 = homeServiceImpl.getType216(model);
        BaseJson baseJson2 = homeServiceImpl.getUsernameHeadp(model, baseJson1);
        BaseJson baseJson3 = homeServiceImpl.getTeacher4(model);
        return "homePage";
    }


    @RequestMapping("/searchTeacher")
    public String searchingTeacher() {
        return "teacherSearch";
    }

    /**
     * 方法返回一个BaseJson数据，这个数据中的obejct中存放了一个list，
     * list中有至多6个map，每个map有如下可取的String键值：
     * name 名字
     * headp 头像
     * lati 经度
     * longi 纬度
     * id 用户id
     * payment 薪酬
     * location 地址
     *
     * @param tag_info
     * @param page
     * @return
     */
    @RequestMapping("/searchTea")
    @ResponseBody
    public BaseJson searchingTeacher(@RequestParam String tag_info, @RequestParam String page) {
        //BaseJson baseJson = visitServiceImpl.setTeacherCount(Integer.parseInt(page),);
        //System.out.println(tag_info);
        boolean[] tagb = new boolean[20];
        for (int i = 0; i < 20; i++) {
            char bool = tag_info.charAt(tag_info.indexOf((i + 1) + "") + 4);
            if (bool == 'f') tagb[i] = false;
            else tagb[i] = true;
        }
        BaseJson baseJson = visitServiceImpl.serachTeacherSer(tagb,page);
        return baseJson;
    }


}