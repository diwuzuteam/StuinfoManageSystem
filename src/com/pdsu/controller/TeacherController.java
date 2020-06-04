package com.pdsu.controller;

import com.github.pagehelper.PageInfo;
import com.pdsu.impl.TeacherServiceImpl;
import com.pdsu.po.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author xxy
 * @Description: 教师的controller方法
 * @Version 1.0
 */
@Controller
@RequestMapping("teacher")
public class TeacherController {
    @Autowired
    private TeacherServiceImpl teacherService;
    /**
     * 分页显示所有教师信息
     */
    @RequestMapping(value = {"/showAllTeachers","/",""})
    public ModelAndView showAllStudents(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        ModelAndView modelAndView){

        //默认每页记录
        PageInfo<Teacher> pageInfo = teacherService.findAllTeacher(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("teacher/listTeacherPage");
        return  modelAndView;
    }
    /**
     * 删除教师信息
     */
    @RequestMapping(value = "/deleteTeacherById",method = RequestMethod.POST)
    @ResponseBody
    public void deleteStudentById(String thNo)throws Exception{
        teacherService.deleteTeacher(thNo);
    }
    /**
     * 批量删除教师信息
     */
    @RequestMapping(value = "/deleteTeachers",method = RequestMethod.POST)
    @ResponseBody
    public void deleteTeachers(@RequestParam(value = "ids[]",required = false) String[] ids)throws Exception{
        for (String id:ids) {
            teacherService.deleteTeacher(id);
        }
    }
    /**
     * 跳转到添加教师界面
     */
    @RequestMapping("/toAddTeacher")
    public ModelAndView toAddTeacher(ModelAndView modelAndView){
        modelAndView.setViewName("teacher/addTeacher");
        return modelAndView;
    }
    /**
     * 添加教师信息
     */
    @RequestMapping(value = "/addTeacher")
    public String addStudent(Teacher teacher)throws Exception{
        teacherService.addTeacher(teacher);
        return "redirect:showAllTeachers.action";
    }

    /**
     *判断教师是否存在
     */
    @RequestMapping(value = "/exitTeacherNo",method = RequestMethod.POST)
    @ResponseBody
    public String exitTeacherNo(String thNo) throws Exception {
        Teacher teacher = teacherService.selectTeacherByNo(thNo);
        String msg = "";
        if (teacher.getThNo().equals(thNo)){
            msg = "NO";
        }else{
            msg = "OK";
        }
        return msg;
    }
    /**
     * 跳转详细信息页面
     */
    @RequestMapping(value = "/toViewTeacher/{thNo}")
    public ModelAndView toViewTeacher(@PathVariable("thNo") String thNo,ModelAndView modelAndView) throws Exception {
        Teacher teacher = teacherService.selectTeacherByNo(thNo);
        modelAndView.addObject("teacher",teacher);
        modelAndView.setViewName("teacher/viewTeacher");
        return modelAndView;
    }
    /**
     * 跳转编辑信息页面
     */
    @RequestMapping(value = "/toEditTeacher/{thNo}")
    public ModelAndView toEditTeacher(@PathVariable("thNo") String thNo,ModelAndView modelAndView) throws Exception {
        Teacher teacher = teacherService.selectTeacherByNo(thNo);
        modelAndView.addObject("teacher",teacher);
        modelAndView.setViewName("teacher/editTeacher");
        return modelAndView;
    }
    /**
     * 更新教师信息
     */
    @RequestMapping(value = "/updateTeacher",method = RequestMethod.POST)
    public String updateTeacher(Teacher teacher,ModelAndView modelAndView)throws Exception{
        teacherService.updateTeacher(teacher);
        return "redirect:showAllTeachers.action";
    }
    /**
     * 跳转教师查询界面
     */
    @RequestMapping("/toQueryTeacher")
    public ModelAndView toQueryTeacher(ModelAndView modelAndView){
        modelAndView.setViewName("teacher/queryTeacher");
        return modelAndView;
    }
    /**
     * 动态查询教师信息，并分页
     */
    @RequestMapping(value = "/dynamicQuery",method = RequestMethod.POST)
    public ModelAndView dynamicQuery(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "size", defaultValue = "10") int size,
                                     Teacher teacher,ModelAndView modelAndView) throws Exception {

        //默认每页记录
        PageInfo<Teacher> pageInfo = teacherService.dynamicQuery(page, size, teacher);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("teacher/queryTeacher");
        return  modelAndView;
    }
}
