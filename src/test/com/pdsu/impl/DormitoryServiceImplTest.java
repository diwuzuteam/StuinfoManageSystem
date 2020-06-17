package com.pdsu.impl;

import com.pdsu.po.DormQueryVo;
import com.pdsu.po.Student;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

/**
 * @author xxy
 * @Date 2020/6/17 13:08
 * @Description:
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/applicationContext.xml")
public class DormitoryServiceImplTest {
    @Autowired
    DormitoryServiceImpl dormitoryService;

    /*@Test
    public void queryDormStu() {
        List<DormQueryVo> list = dormitoryService.queryDormStu();
        System.out.println(list.size());
    }*/
}