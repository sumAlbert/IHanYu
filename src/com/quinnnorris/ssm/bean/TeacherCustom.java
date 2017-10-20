package com.quinnnorris.ssm.bean;

/**
 * Title: TeacherCustom
 * Description:
 * Company: www.QuinnNorris.com
 *
 * @date: 2017/9/19 上午11:12 星期二
 * @author: quinn_norris
 * @version: 1.0
 */
public class TeacherCustom extends Teacher {

    private int startPos;
    private int pageSize;

    public int getStartPos() {
        return startPos;
    }

    public void setStartPos(int startPos) {
        this.startPos = startPos;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
}
