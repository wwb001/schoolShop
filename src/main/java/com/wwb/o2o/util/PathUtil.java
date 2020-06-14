package com.wwb.o2o.util;

public class PathUtil {
    private static String seperator = System.getProperty("file.separator");
    public static String getImgBasePath() {
        String os = System.getProperty("os.name");
        String basePath = "";
        //TODO 需要替换成本地webapps地址 + /Users/baidu/work/image
        if(os.toLowerCase().startsWith("win")){
//           basePath = "D:/projectdev/image/";
            basePath = "D:/apache-tomcat-9.0.16-windows-x64/apache-tomcat-9.0.16/webapps"
                    +"/Users/baidu/work/image";
        }else {
            basePath="/home/xiangze/image/";
        }
        basePath = basePath.replace("/",seperator);
        return basePath;
    }
    public static String getShopImagePath(long shopId){
        String imagePath = "/upload/images/item/shop/" + shopId +"/";
        return imagePath;
    }
}
