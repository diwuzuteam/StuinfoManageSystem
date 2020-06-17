package com.pdsu.controller;

import com.github.pagehelper.PageInfo;
import com.pdsu.impl.DormitoryServiceImpl;
import com.pdsu.impl.StudentServiceImpl;
import com.pdsu.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author xxy
 * @Description: 宿舍controller方法
 * @Version 1.0
 */
@Controller
@RequestMapping("dormitory")
public class DormitoryController {
    @Autowired
    private DormitoryServiceImpl dormitoryService;
    @Autowired
    private StudentServiceImpl studentService;
    /**
     * 查询所有的宿舍信息
     */
    @RequestMapping(value = {"/showAllDormitories","/",""})
    public ModelAndView showAllDormitories(@RequestParam(value = "page", defaultValue = "1") int page,
                                        @RequestParam(value = "size", defaultValue = "10") int size,
                                        ModelAndView modelAndView) throws Exception {

        //默认每页记录
        //PageInfo<Dormitory> pageInfo = dormitoryService.findAllDormitory(page, size);
        PageInfo<DormQueryVo> pageInfo = dormitoryService.queryDormStu(page, size);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("dormitory/listDormitory");
        return  modelAndView;
    }
    /**
     * 跳转添加宿舍信息
     */
    @RequestMapping("/toAddDormitory")
    public ModelAndView toAddDormitory(ModelAndView modelAndView){
        modelAndView.setViewName("dormitory/addDormitory");
        return modelAndView;
    }
    /**
     * 跳转查询页面
     */
    @RequestMapping("/toQueryDormitory")
    public ModelAndView toQueryDormitory(ModelAndView modelAndView){
        modelAndView.setViewName("dormitory/queryDormitory");
        return modelAndView;
    }
    /**
     * 跳转详细信息页面
     */
    @RequestMapping(value = "/toViewDormitory/{dormId}")
    public ModelAndView toViewDormitory(@PathVariable("dormId") String dormId,ModelAndView modelAndView)throws Exception{
        Dormitory dormitory = dormitoryService.findDormById(dormId);
        modelAndView.addObject("dormitory",dormitory);
        modelAndView.setViewName("dormitory/viewDormitory");
        return modelAndView;
    }
    /**
     * 跳转到编辑页面
     */
    @RequestMapping(value = "/toEditDormitory/{dormId}")
    public ModelAndView toEditDormitory(@PathVariable("dormId") String dormId,ModelAndView modelAndView) throws Exception {
        Dormitory dormitory = dormitoryService.findDormById(dormId);
        modelAndView.addObject("dormitory",dormitory);
        modelAndView.setViewName("dormitory/editDormitory");
        return modelAndView;
    }
    /**
     * 删除宿舍信息
     */
    @RequestMapping(value = "/delDormitory",method = RequestMethod.POST)
    @ResponseBody
    public void delDormitory(String dormId) throws Exception {
        dormitoryService.delDormitory(dormId);
    }
    @RequestMapping(value = "/deleteDorms",method = RequestMethod.POST)
    @ResponseBody
    public void deleteDorms(@RequestParam(value = "ids[]",required = false) String[] ids)throws Exception{
        for (String id:ids) {
            dormitoryService.delDormitory(id);
        }
    }
    /**
     * 更新宿舍信息
     */
    @RequestMapping(value = "/updateDorm",method = RequestMethod.POST)
    public String updateDorm(Dormitory dormitory)throws Exception{
        dormitoryService.updateDorm(dormitory);
        return "redirect:showAllDormitories.action";
    }
    /**
     * 添加宿舍信息
     */
    @RequestMapping(value = "/addDorm",method = RequestMethod.POST)
    public String addDorm(Dormitory dormitory)throws Exception{
        dormitoryService.addDorm(dormitory);
        return "redirect:showAllDormitories.action";
    }
    /**
     *判断宿舍是否存在
     */
    @RequestMapping(value = "/exitDorm",method = RequestMethod.POST)
    @ResponseBody
    public String exitDorm(String dormId) throws Exception {
        Dormitory dormitory = dormitoryService.findDormById(dormId);
        String msg = "";
        if (dormitory != null){
            msg = "NO";
        }else{
            msg = "OK";
        }
        return msg;
    }
    /**
     *判断宿舍长是否已经存在
     */
    @RequestMapping(value = "/exitDormMo",method = RequestMethod.POST)
    @ResponseBody
    public String exitDormMo(String dormMonitor) throws Exception {
        Student student = studentService.findStudentByNo(dormMonitor);
        String msg = "";
        if (student != null){
            Dormitory dormitory = dormitoryService.findDormByMo(dormMonitor);
            if (dormitory != null){
                msg = "NO";
            }else{
                msg = "OK";
            }
            }else{
                msg="NO";
        }
        return msg;
    }
    /**
     * 动态查询
     */
    @RequestMapping(value = "/dynamicQuery",method = RequestMethod.POST)
    public ModelAndView dynamicQuery(@RequestParam(value = "page", defaultValue = "1") int page,
                                     @RequestParam(value = "size", defaultValue = "10") int size,
                                     Dormitory dormitory, ModelAndView modelAndView) throws Exception {

        //默认每页记录
        PageInfo<Dormitory> pageInfo = dormitoryService.dynamicQuery(page, size, dormitory);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("dormitory/queryDormitory");
        return  modelAndView;
    }

}
