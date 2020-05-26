package com.pdsu.controller;

import com.github.pagehelper.PageInfo;
import com.pdsu.impl.StudentServiceImpl;
import com.pdsu.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author xxy
 * @Description: 学生的controller
 * @Version 1.0
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    public StudentServiceImpl studentService;
    /**
     *分页显示
     */
    @RequestMapping(value = "/showAllStudents")
    public ModelAndView showAllStudents(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        ModelAndView modelAndView){

        //默认每页记录
        PageInfo<Student> pageInfo = studentService.findStudentList(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("listStudentPage");
        return  modelAndView;
    }
    /**
     * 跳转到学生详情页面
     */
    @RequestMapping("/goViewStudent/{suId}")
    public ModelAndView goViewStudent(@PathVariable("suId") String suId,
                              ModelAndView modelAndView) throws Exception {
        Student student = studentService.findStudentByNo(suId);
        modelAndView.addObject("student", student);
        modelAndView.setViewName("viewStudent");
        return modelAndView;
    }
    /**
     * 跳转到编辑学生页面
     */
    @RequestMapping("/goEditStudent/{suId}")
    public ModelAndView goEditStudent(@PathVariable("suId") String suId,ModelAndView modelAndView) throws Exception {
        Student student = studentService.findStudentByNo(suId);
        modelAndView.addObject("student", student);
        modelAndView.setViewName("editStudent");
        return modelAndView;
    }
    /**
     * 更新学生信息
     */
    @RequestMapping(value = "/updateStudent" , method = RequestMethod.PUT)
    public String updateStudent(Student student,String suId) throws Exception {
        studentService.updateStudent(suId,student);
        return "redirect:showAllStudents.action";
    }
    /**
     * 跳转到添加学生页面
     */
    @RequestMapping(value = "/goAddStudent")
    public ModelAndView goAddStudent(ModelAndView modelAndView){
        modelAndView.setViewName("addStudent");
        return modelAndView;
    }
    /**
     * 添加学生信息
     */
    @RequestMapping(value = "/addStudent")
    public String addStudent(Student student)throws Exception{
        studentService.addStudent(student);
        return "redirect:showAllStudents.action";
    }
    /**
     * 判断账号是否存在
     */
    @RequestMapping(value = "/exitStudentId")
    @ResponseBody
    public String exitStudentId(String suId) throws Exception {
        Student student = studentService.checkSuIdIsExist(suId);
        String msg = "";
        if (student.getSuId().equals(suId)){
            msg = "OK";
        }else{
            msg = "NO";
        }
        return msg;
    }
    /**
     * 删除学生信息
     */
    @RequestMapping(value = "/deleteStudentById/{suId}")
    public void deleteStudentById(@PathVariable("suId") String suId)throws Exception{
        studentService.deleteStudent(suId);
    }

}
