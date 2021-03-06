package com.quinnnorris.ssm.service.impl;

import com.quinnnorris.ssm.bean.*;
import com.quinnnorris.ssm.mapper.LoginCustomMapper;
import com.quinnnorris.ssm.mapper.UserCustomMapper;
import com.quinnnorris.ssm.mapper.VisitCustomMapper;
import com.quinnnorris.ssm.service.HomeService;
import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Title: HomeServiceImpl
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/13 下午9:22 星期五
 * @author: quinn_norris
 * @version: 1.0
 */
@Service("homeServiceImpl")
public class HomeServiceImpl implements HomeService {

    @Autowired
    UserCustomMapper userCustomMapper;

    @Autowired
    VisitCustomMapper visitCustomMapper;

    @Autowired
    LoginCustomMapper loginCustomMapper;

    public BaseJson getType216(Model model) {
        List<PartnerCustom> list = userCustomMapper.selectPartnerin16(16);
        List<Map<String, String>> mapList = new ArrayList<>();
        for (PartnerCustom partnerCustom : list) {
            LanguageCustom languageCustom = visitCustomMapper.selectLangById(partnerCustom.getFirstL_id());
            partnerCustom.setFisL(languageCustom.getLanguage());
            partnerCustom.setFisL_en(languageCustom.getLanguage_en());
            LanguageCustom languageCustomEn = visitCustomMapper.selectLangById(partnerCustom.getSecondL_id());
            partnerCustom.setSecL(languageCustomEn.getLanguage());
            partnerCustom.setSecL_en(languageCustomEn.getLanguage_en());
            Map<String, String> map = new HashMap<>();
            map.put("fisl", partnerCustom.getFisL());
            map.put("fislen", partnerCustom.getFisL_en());
            map.put("secl", partnerCustom.getSecL());
            map.put("seclen", partnerCustom.getSecL_en());
            map.put("id", partnerCustom.getId() + "");
            mapList.add(map);
        }
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(mapList);
        return baseJson;
    }

    @Override
    public BaseJson getUsernameHeadp(Model model, BaseJson baseJson1) {
        List<Map<String, String>> mapList = (List<Map<String, String>>) baseJson1.getObject();
        for (Map<String, String> map : mapList) {
            StudentCustom studentCustom = new StudentCustom();
            studentCustom.setId(Integer.parseInt(map.get("id")));
            List<StudentCustom> stucustom1 = loginCustomMapper.selectStudentById(studentCustom);
            map.put("username", stucustom1.get(0).getUserName());
            UserCustom userCustom = new UserCustom();
            userCustom.setId(Integer.parseInt(map.get("id")));
            UserCustom user = loginCustomMapper.selectUserById(userCustom);
            map.put("headp", user.getHeadp());
        }
        model.addAttribute("list", mapList);
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(mapList);
        return baseJson;
    }

    @Override
    public BaseJson getTeacher4(Model model) {
        List<TeacherCustom> list = userCustomMapper.selectTeacherin4(12);
        List<Map<String, String>> mapList = new ArrayList<>();
        for (TeacherCustom teacherCustom : list) {
            Map<String, String> map = new HashMap<>();
            Tea_goodCustom tea_goodCustom = new Tea_goodCustom();
            tea_goodCustom.setId(teacherCustom.getId());
            tea_goodCustom.setSelectSum(2);
            List<Tea_typeCustom> tea2good = visitCustomMapper.select2good(tea_goodCustom);
            map.put("name", teacherCustom.getFirstname() + teacherCustom.getLastname());
            if (tea2good.get(1) != null) map.put("good1", tea2good.get(0).getType_cn());
            else map.put("good1", "");
            if (tea2good.get(1) != null) map.put("good2", tea2good.get(1).getType_cn());
            else map.put("good2", "");
            UserCustom userCustom = new UserCustom();
            userCustom.setId(teacherCustom.getId());
            UserCustom user = loginCustomMapper.selectUserById(userCustom);
            map.put("headp", user.getHeadp());
            mapList.add(map);
        }
        model.addAttribute("listTea", mapList);
        BaseJson baseJson = new BaseJson();
        baseJson.setObject(mapList);
        return baseJson;
    }

}
