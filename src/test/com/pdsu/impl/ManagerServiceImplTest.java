package com.pdsu.impl;

import com.pdsu.po.Manager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * @author xxy
 * @Date 2020/6/2 16:42
 * @Description:
 * @Version 1.0
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/applicationContext.xml")
public class ManagerServiceImplTest {
    @Autowired ManagerServiceImpl managerService;
    @Test
    public void updatePassword() throws Exception {
        Manager manager = new Manager();
        String adId = "171210238";
        String adPassword = "xxyxxy";
        manager.setAdId(adId);
        manager.setAdPassword(adPassword);
        managerService.updatePassword(manager);
        manager = managerService.selectManager(adId);
        System.out.println(manager.getAdPassword());

    }
}