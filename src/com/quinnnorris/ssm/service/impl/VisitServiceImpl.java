package com.quinnnorris.ssm.service.impl;

import com.quinnnorris.ssm.bean.*;
import com.quinnnorris.ssm.mapper.LoginCustomMapper;
import com.quinnnorris.ssm.mapper.UserCustomMapper;
import com.quinnnorris.ssm.mapper.VisitCustomMapper;
import com.quinnnorris.ssm.service.VisitService;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Title: VisitServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/9/25 下午7:18 星期一
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("visitServiceImpl")
public class VisitServiceImpl implements VisitService {

    @Autowired
    UserCustomMapper userCustomMapper;

    @Autowired
    LoginCustomMapper loginCustomMapper;

    @Autowired
    VisitCustomMapper visitCustomMapper;

    @Override
    public BaseJson serachUserByEmail(UserCustom userCustom) {
        BaseJson baseJson = new BaseJson();
        List<UserCustom> selectRes = userCustomMapper.selectUserByEmail(userCustom);
        baseJson.setObject(selectRes.get(0).getId());
        if (selectRes != null && selectRes.size() >= 1)
            baseJson.setErrorCode("0001");//存在用户
        else
            baseJson.setErrorCode("1001");//不存在用户
        return baseJson;
    }

    @Override
    public BaseJson getTeachersMessage(TeacherCustom teacherCustom) {
        BaseJson baseJson = new BaseJson();
        List<TeacherCustom> selectTea = loginCustomMapper.selectTeacherById(teacherCustom);
        baseJson.setObject(selectTea.get(0));
        return baseJson;
    }

    @Override
    public BaseJson getTeacherGoodAt(Tea_goodCustom tea_goodCustom) {
        BaseJson baseJson = new BaseJson();
        List<Tea_typeCustom> selectRes = visitCustomMapper.selectTeacherGood(tea_goodCustom);
        String[] goodAt = {"", ""};
        for (Tea_typeCustom tea_type : selectRes) {
            if (tea_type != null) {
                if (tea_type.getType_cn() != null)
                    goodAt[0] += tea_type.getType_cn() + " ";
                if (tea_type.getType_en() != null)
                    goodAt[1] += tea_type.getType_en() + " ";
            }
        }
        baseJson.setObject(goodAt);
        return baseJson;
    }

    @Override
    public BaseJson getTeacherTime(Tea_timeCustom tea_timeCustom) {
        BaseJson baseJson = new BaseJson();
        List<WeekCustom> selectRes = visitCustomMapper.selectTeacherTime(tea_timeCustom);
        String[] time = {"", ""};
        for (WeekCustom week : selectRes) {
            if (week != null) {
                if (week.getWeek() != null)
                    time[0] += week.getWeek() + " ";
                if (week.getWeek_en() != null)
                    time[1] += week.getWeek_en() + " ";
            }
        }
        baseJson.setObject(time);
        return baseJson;
    }

    @Override
    public BaseJson getPartnersMessage(PartnerCustom partnerCustom) {
        BaseJson baseJson = new BaseJson();
        List<PartnerCustom> selectRes = visitCustomMapper.selectPartnerById(partnerCustom);
        PartnerCustom custom = selectRes.get(0);
        if (custom.getSex().equals("1")) {
            custom.setSex("男");
            custom.setSex_en("Male");
        } else {
            custom.setSex("女");
            custom.setSex_en("Female");
        }
        LanguageCustom languageCustom = visitCustomMapper.selectLangById(custom.getFirstL_id());
        custom.setFisL(languageCustom.getLanguage());
        custom.setFisL_en(languageCustom.getLanguage_en());
        LanguageCustom languageCustom1 = visitCustomMapper.selectLangById(custom.getSecondL_id());
        custom.setSecL(languageCustom1.getLanguage());
        custom.setSecL_en(languageCustom1.getLanguage_en());
        baseJson.setObject(custom);
        return baseJson;
    }

    @Override
    public BaseJson getStudentMessage(StudentCustom studentCustom) {
        BaseJson baseJson = new BaseJson();
        List<StudentCustom> selectRes = loginCustomMapper.selectStudentById(studentCustom);
        StudentCustom custom = selectRes.get(0);
        CountryCustom countryCustom = visitCustomMapper.selectCountryById(custom.getCountry_id());
        custom.setCountry_en(countryCustom.getCountry_en());
        custom.setCountry_cn(countryCustom.getCountry());

        Map<String, Object> map = new HashMap<>();
        map.put("coun_en", custom.getCountry_en());
        map.put("coun_cn", custom.getCountry_cn());
        map.put("wechat", custom.getWechat());
        map.put("username", custom.getUserName());
        baseJson.setObject(map);
        return baseJson;
    }

    @Override
    public BaseJson getUserMes(UserCustom userCustom) {
        BaseJson baseJson = new BaseJson();
        List<UserCustom> selectRes = userCustomMapper.selectUserByEmail(userCustom);
        if (selectRes != null && selectRes.size() >= 1)
            baseJson.setObject(selectRes.get(0));
        else
            baseJson.setObject(null);
        return baseJson;
    }

    @Override
    public BaseJson setTeacherCount(Model model) {
        int count = visitCustomMapper.selectTeacherCount();
        if (count % 6 == 0) model.addAttribute("page", count / 6 + "");
        else model.addAttribute("page", (count / 6 + 1) + "");
        TeacherCustom teacherCustom = new TeacherCustom();
        teacherCustom.setStartPos(/*pageNow*/ -1);
        teacherCustom.setPageSize(6);
        List<TeacherCustom> list = userCustomMapper.selectTeacherRet(teacherCustom);
        for (int i = 0; i < list.size(); i++) {


        }
        return new BaseJson();
    }

    @Override
    public BaseJson serachTeacherSer(boolean[] tagb, String page) {
        int firstSer = 0;
        int pages = Integer.parseInt(page);
        List<Map<String, String>> list = new ArrayList<>();
        List<TeacherCustom> listTea = new ArrayList<>();
        for (firstSer = 0; firstSer < 20; firstSer++)
            if (tagb[firstSer] != false) {
                Tea_goodCustom tea_goodCustom = new Tea_goodCustom();
                tea_goodCustom.setGoodat(firstSer + 1);
                listTea = userCustomMapper.selectIdByTeaGood(tea_goodCustom);
                break;
            }
        for (; firstSer < 20; firstSer++)
            if (tagb[firstSer] != false)
                for (TeacherCustom teacherCustom : listTea)
                    if (teacherCustom != null) {
                        Tea_goodCustom tea_goodCustom = new Tea_goodCustom();
                        tea_goodCustom.setGoodat(firstSer + 1);
                        tea_goodCustom.setId(teacherCustom.getId());
                        TeacherCustom custom = userCustomMapper.selectTeacherByIdGood(tea_goodCustom);
                        if (custom == null) teacherCustom = null;
                    }
        for (int i = (pages - 1) * 6; i < pages * 6; i++) {
            if (listTea.get(i) == null) continue;
            UserCustom userCustom = new UserCustom();
            userCustom.setId(listTea.get(i).getId());
            loginCustomMapper.selectUserById(userCustom);
            Map<String, String> map = new HashMap<>();
            map.put("headp", userCustom.getHeadp());
            map.put("lati", userCustom.getLati() + "");
            map.put("longi", userCustom.getLongi() + "");
            map.put("id", userCustom.getId() + "");
            TeacherCustom teacherCustom = new TeacherCustom();
            teacherCustom.setId(listTea.get(i).getId());
            teacherCustom = loginCustomMapper.selectTeacherById(teacherCustom).get(0);
            map.put("name", teacherCustom.getFirstname() + teacherCustom.getLastname());
            map.put("payment", teacherCustom.getPayment() + "");
            map.put("location", teacherCustom.getLocation());
            list.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(list);
        return baseJson;
    }

}


