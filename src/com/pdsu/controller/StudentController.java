package com.pdsu.controller;

import com.github.pagehelper.PageInfo;
import com.pdsu.impl.StudentServiceImpl;
import com.pdsu.po.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;


/**
 * @author xxy
 * @Description: 学生的controller
 * @Version 1.0
 */
@Controller
@RequestMapping("student")
public class StudentController {
    @Autowired
    public StudentServiceImpl studentService;
    /**
     *分页显示(升序)
     */
    @RequestMapping(value = {"/showAllStudents","/",""})
    public ModelAndView showAllStudents(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        ModelAndView modelAndView){

        //默认每页记录
        PageInfo<Student> pageInfo = studentService.findStudentList(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("student/listStudentPage");
        return  modelAndView;
    }

    /**
     *分页显示(降序)
     */
    @RequestMapping(value = {"/showAllStudentsDesc","/",""})
    public ModelAndView showAllStudentsDesc(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        ModelAndView modelAndView){

        //默认每页记录
        PageInfo<Student> pageInfo = studentService.findStudentListDesc(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("student/listStudentPage");
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
        modelAndView.setViewName("student/viewStudent");
        return modelAndView;
    }

    /**
     * 跳转到编辑学生页面
     */
    @RequestMapping("/goEditStudent/{suId}")
    public ModelAndView goEditStudent(@PathVariable("suId") String suId,ModelAndView modelAndView) throws Exception {
        Student student = studentService.findStudentByNo(suId);
        modelAndView.addObject("student", student);
        modelAndView.setViewName("student/editStudent");
        return modelAndView;
    }

    /**
     * 更新学生信息
     */
    @RequestMapping(value = "/updateStudent",method = RequestMethod.POST)
   public String updateStudent(String suId,Student student,MultipartFile photo) throws Exception {
        if (photo!=null){
            //存储图片的物理路径
            String pic_path="C:\\picture\\studentPic\\";
            //原始图片名称
            String originalFilename = photo.getOriginalFilename();
            //新的图片名称
            String newFileName = UUID.randomUUID() + "_" + student.getSuId() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(pic_path+newFileName);
            //将内存中的数据写道磁盘
            photo.transferTo(newFile);
            //将图片写到student中
            student.setSuPic(newFileName);
        }
        studentService.updateStudent(suId,student);
        return "redirect:showAllStudents.action";
    }

    /**
     * 跳转到添加学生页面
     */
    @RequestMapping(value = "/goAddStudent")
    public ModelAndView goAddStudent(ModelAndView modelAndView){
        modelAndView.setViewName("student/addStudent");
        return modelAndView;
    }

    /**
     * 添加学生信息
     */
    @RequestMapping(value = "/addStudent",method = RequestMethod.POST)
    public String addStudent(Student student,MultipartFile photo)throws Exception{
        if (photo!=null){
            //存储图片的物理路径
            String pic_path="C:\\picture\\studentPic\\";
            //原始图片名称
            String originalFilename = photo.getOriginalFilename();
            //新的图片名称
            String newFileName = UUID.randomUUID() + "_" + student.getSuId() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新图片
            File newFile = new File(pic_path+newFileName);
            //将内存中的数据写道磁盘
            photo.transferTo(newFile);
            //将图片写到student中
            student.setSuPic(newFileName);
        }
        studentService.addStudent(student);
        return "redirect:showAllStudents.action";
    }

    /**
     * 判断账号是否存在
     */
    @RequestMapping(value = "/exitStudentId",method = RequestMethod.POST)
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
    @RequestMapping(value = "/deleteStudentById",method = RequestMethod.POST)
    @ResponseBody
    public void deleteStudentById(String suId)throws Exception{
        Student student = studentService.findStudentByNo(suId);
        String pic_path="C:\\picture\\studentPic\\";
        File file = new File(pic_path + student.getSuPic());
        if (file.exists()){
            file.delete();
        }
        studentService.deleteStudent(suId);
    }

    /**
     * 跳转到学生查询页面
     */
    @RequestMapping("/goQueryStudent")
    public ModelAndView goQueryStudent(ModelAndView modelAndView){
        modelAndView.setViewName("student/queryStudent");
        return modelAndView;
    }

    /**
     * 批量删除学生信息
     */
    @RequestMapping(value = "/deleteStudents",method = RequestMethod.POST)
    @ResponseBody
    public void deleteStudents(@RequestParam(value = "ids[]",required = false) String[] ids)throws Exception{
        String pic_path="C:\\picture\\studentPic\\";
        for (String id:ids) {
            Student student = studentService.findStudentByNo(id);
            File file = new File(pic_path + student.getSuPic());
            if (file.exists()){
                file.delete();
            }
            studentService.deleteStudent(id);
        }
    }

    /**
     * 动态查询学生信息，并分页
     */
    @RequestMapping(value = "/dynamicQuery",method = RequestMethod.POST)
    public ModelAndView dynamicQuery(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        Student student,ModelAndView modelAndView) throws Exception {

        //默认每页记录
        PageInfo<Student> pageInfo = studentService.dynamicQuery(page, size, student);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("student/queryStudent");
        return  modelAndView;
    }
    /**
     * 上传照片并预览
     */
    @RequestMapping(value = "/uploadPhoto", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadPhoto(MultipartFile photo, HttpServletRequest request) {
        Map<String, String> ret = new HashMap<String, String>();
        //定义存储路径
        String savePath="C:\\picture\\";
        if (photo == null) {
            ret.put("type", "error");
            ret.put("msg", "选择要上传的文件！");
            return ret;
        }
        if (photo.getSize() > 1024 * 1024 * 5) {
            ret.put("type", "error");
            ret.put("msg", "文件大小不能超过5M！");
            return ret;
        }
        //获取文件后缀
        String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf(".") + 1, photo.getOriginalFilename().length());
        if (!"jpg,jpeg,gif,png".toUpperCase().contains(suffix.toUpperCase())) {
            ret.put("type", "error");
            ret.put("msg", "请选择jpg,jpeg,gif,png格式的图片！");
            return ret;
        }
        File savePathFile = new File(savePath);
        if (!savePathFile.exists()) {
            //若不存在该目录，则创建目录
            savePathFile.mkdir();
        }
        String filename = new Date().getTime() + "." + suffix;
        try {
            //将文件保存指定目录
            photo.transferTo(new File(savePath + filename));
        } catch (Exception e) {
            ret.put("type", "error");
            ret.put("msg", "保存文件异常！");
            e.printStackTrace();
            return ret;
        }
        // /pic/为创建的tomcat虚拟路径
        ret.put("type", "success");
        ret.put("msg", "上传图片成功！");
        ret.put("filepath", "/pic/");
        ret.put("filename", filename);
        return ret;
    }


}
