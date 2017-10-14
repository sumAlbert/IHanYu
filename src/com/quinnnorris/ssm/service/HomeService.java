package com.quinnnorris.ssm.service;

import com.quinnnorris.ssm.util.BaseJson;
import org.springframework.ui.Model;

/**
 * Title: homeService
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/10/13 下午9:21 星期五
 * @author: quinn_norris
 * @version: 1.0
 */
public interface HomeService {

    public BaseJson getType216(Model model);

    public BaseJson getUsernameHeadp(Model model, BaseJson baseJson1);

    public BaseJson getTeacher4(Model model);
}
