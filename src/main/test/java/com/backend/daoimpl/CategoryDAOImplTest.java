package com.backend.daoimpl;

import com.backend.dao.CategoryDAO;
import com.backend.dto.Category;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class CategoryDAOImplTest {
    private static AnnotationConfigApplicationContext context;
    private static CategoryDAO categoryDao;
    private Category category;

    @BeforeClass
    public static void init() throws Exception {
        context = new AnnotationConfigApplicationContext();
        context.scan(new String[]{"com.backend"});
        context.refresh();
        categoryDao = (CategoryDAO)context.getBean("categoryDAO");
    }
    @Test
    public void list() throws Exception {
        List<Category> list=categoryDao.list();
        for (Category category:list
             )
        {
            System.out.println(category);
        }

    }

}