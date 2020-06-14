//package com.wwb.o2o.service;
//
//import com.wwb.o2o.BaseTest;
//import com.wwb.o2o.dto.ShopExecution;
//import com.wwb.o2o.entity.Area;
//import com.wwb.o2o.entity.PersonInfo;
//import com.wwb.o2o.entity.Shop;
//import com.wwb.o2o.entity.ShopCategory;
//import com.wwb.o2o.enums.ShopStateEnum;
//import com.wwb.o2o.exceptions.ShopOperationException;
//import org.junit.Ignore;
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileNotFoundException;
//import java.io.InputStream;
//import java.util.Date;
//
//import static org.junit.Assert.assertEquals;
//
//public class ShopServiceTest extends BaseTest {
//    @Autowired
//    private ShopService shopService;
//
//    @Test
//    public void testGetShopList() {
//        Shop shopCondition = new Shop();
//        ShopCategory sc = new ShopCategory();
//        sc.setShopCategoryId(1L);
//        shopCondition.setShopCategory(sc);
//        ShopExecution se = shopService.getShopList(shopCondition, 2, 2);
//        System.out.println("店铺列表数为：" + se.getShopList().size());
//        System.out.println("店铺总数为：" + se.getCount());
//    }
//
//    @Test
//    @Ignore
//    public void testModifyShop() throws ShopOperationException, FileNotFoundException {
//        Shop shop = new Shop();
//        shop.setShopId(1L);
//        shop.setShopName("修改后的店铺名称");
//        File shopImg = new File("/Users/baidu/work/image/dabai.jpg");
//        InputStream is = new FileInputStream(shopImg);
//        ShopExecution shopExecution = shopService.modifyShop(shop, is, "dabai.jpg");
//        System.out.println("新的图片地址为：" + shopExecution.getShop().getShopImg());
//    }
//
//    @Test
//
//    public void testAddShop() throws ShopOperationException, FileNotFoundException {
//        Shop shop = new Shop();
//        PersonInfo owner = new PersonInfo();
//        Area area = new Area();
//        ShopCategory shopCategory = new ShopCategory();
//        owner.setUserId(11L);
//        area.setAreaId(2);
//        shopCategory.setShopCategoryId(36L);
//        shop.setOwner(owner);
//        shop.setArea(area);
//        shop.setShopCategory(shopCategory);
//        shop.setShopName("测试的店铺1");
//        shop.setShopDesc("test1");
//        shop.setShopAddr("test1");
//        shop.setPhone("test1");
//        shop.setCreateTime(new Date());
//        shop.setEnableStatus(0);
//        shop.setAdvice("审核中");
//        File shopImg = new File("/images/pig1.jpg");
//        InputStream is = new FileInputStream(shopImg);
//        ShopExecution se = shopService.addShop(shop, is, shopImg.getName());
//        assertEquals(ShopStateEnum.CHECK.getState(), se.getState());
//    }
//}
