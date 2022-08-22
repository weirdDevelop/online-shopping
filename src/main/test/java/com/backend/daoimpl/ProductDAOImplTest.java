package com.backend.daoimpl;

import com.backend.dao.ProductDAO;
import com.backend.dto.Product;
import com.backend.dto.Species;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import java.util.List;

import static org.junit.Assert.*;

public class ProductDAOImplTest {

    private static AnnotationConfigApplicationContext context;
    private static ProductDAO productDao;
    private Product product;

    @BeforeClass
    public static void init() throws Exception {
        context=new AnnotationConfigApplicationContext();
        context.scan("com.backend");
        context.refresh();
        productDao=(ProductDAO) context.getBean("productDAO");
    }
    @Test
    public void getSpeciesBySub() throws Exception {
        List<Species> sp=productDao.getSpeciesBySub(1);
    }

}