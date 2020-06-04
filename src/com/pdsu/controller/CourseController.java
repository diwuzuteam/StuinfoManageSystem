package com.pdsu.controller;

import com.github.pagehelper.PageInfo;
import com.pdsu.impl.CourseServiceImpl;
import com.pdsu.po.Course;
import com.pdsu.po.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author xxy
 * @Description: 课程的controller方法
 * @Version 1.0
 */
@Controller
@RequestMapping("course")
public class CourseController {
    @Autowired
    private CourseServiceImpl courseService;

    /**
     * 查询所有课程信息
     */
    @RequestMapping(value = {"/showAllCourses", "/", ""})
    public ModelAndView showAllCourses(@RequestParam(value = "page", defaultValue = "1") int page,
                                       @RequestParam(value = "size", defaultValue = "10") int size,
                                       ModelAndView modelAndView) throws Exception {

        //默认每页记录
        PageInfo<Course> pageInfo = courseService.findAllCourse(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("course/listCoursePage");
        return modelAndView;
    }
    /**
     * 跳转添加课程页面
     */
    @RequestMapping("/toAddCourse")
    public ModelAndView toAddCourse(ModelAndView modelAndView){
        modelAndView.setViewName("course/addCourse");
        return modelAndView;
    }
    /**
     *判断课程是否存在
     */
    @RequestMapping(value = "/exitCourseNo",method = RequestMethod.POST)
    @ResponseBody
    public String exitCourseNo(String csNo) throws Exception {
        Course course = courseService.findCourseByNo(csNo);
        String msg = "";
        if (course.getCsNo().equals(csNo)){
            msg = "NO";
        }else{
            msg = "OK";
        }
        return msg;
    }
    /**
     * 添加课程信息
     */
    @RequestMapping(value = "/addCourse",method = RequestMethod.POST)
    public String addCourse(Course course)throws Exception{
        courseService.addCourse(course);
        return "redirect:showAllCourses.action";
    }
    /**
     * 删除课程信息
     */
    @RequestMapping(value = "/deleteCourse",method = RequestMethod.POST)
    @ResponseBody
    public void deleteCourse(String csNo)throws Exception{
        courseService.deleteCourse(csNo);
    }
    /**
     * 批量删除
     */
    @RequestMapping(value = "/deleteCourses",method = RequestMethod.POST)
    @ResponseBody
    public void deleteCourses(@RequestParam(value = "ids[]",required = false) String[] ids)throws Exception{
        for (String id:ids) {
            courseService.deleteCourse(id);
        }
    }
    /**
     * 跳转课程详细信息页面
     */
    @RequestMapping(value = "/toViewCourse/{csNo}")
    public ModelAndView toViewTeacher(@PathVariable("csNo") String csNo, ModelAndView modelAndView) throws Exception {
        Course course = courseService.findCourseByNo(csNo);
        modelAndView.addObject("course",course);
        modelAndView.setViewName("course/viewCourse");
        return modelAndView;
    }
    /**
     * 跳转到编辑页面
     */
    @RequestMapping(value = "/toEditCourse/{csNo}")
    public ModelAndView toEditCourse(@PathVariable("csNo") String csNo, ModelAndView modelAndView) throws Exception {
        Course course = courseService.findCourseByNo(csNo);
        modelAndView.addObject("course",course);
        modelAndView.setViewName("course/editCourse");
        return modelAndView;
    }
    /**
     * 更新课程信息
     */
    @RequestMapping(value = "/updateCourse",method = RequestMethod.POST)
    public String updateCourse(Course course) throws Exception {
        courseService.updateCourse(course);
        return "redirect:showAllCourses.action";
    }
    /**
     * 跳转到查询页面
     */
    @RequestMapping("/toQueryCourse")
    public ModelAndView toQueryCourse(ModelAndView modelAndView){
        modelAndView.setViewName("course/queryCourse");
        return modelAndView;
    }
    /**
     * 动态查询
     */
    @RequestMapping(value = "/dynamicQuery",method = RequestMethod.POST)
    public ModelAndView dynamicQuery(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "size", defaultValue = "10") int size,
                                     Course course, ModelAndView modelAndView) throws Exception {

        //默认每页记录
        PageInfo<Course> pageInfo = courseService.dynamicQuery(page, size, course);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("course/queryCourse");
        return  modelAndView;
    }

}
