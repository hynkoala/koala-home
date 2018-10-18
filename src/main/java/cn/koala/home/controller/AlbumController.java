package cn.koala.home.controller;

import cn.koala.home.constant.ConstantCommon;
import cn.koala.home.mapper.PhotoMapper;
import cn.koala.home.model.Photo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

/**
 * Created by 12732
 * Email:hynkoala@163.com
 * Date: 2018.10.17
 * Time:23:28
 * Description:
 */
@Controller
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    PhotoMapper photoMapper;
    @ResponseBody
    @RequestMapping("/uploadPhoto")
    public String uploadPhoto(@RequestParam(required = false) MultipartFile photos){
        String path="E:/photos/";
        MultipartFile file=photos;
        Photo photo = new Photo();
        photo.setPhotoId(UUID.randomUUID().toString().replace("-","1"));
        photo.setPhotoName(file.getOriginalFilename());
        photo.setUploadTime(new Date());
        String nameStr[] = StringUtils.split(photo.getPhotoName(),".");
        String newName=photo.getPhotoId()+"."+nameStr[nameStr.length-1];
        photo.setPhotoNewName(newName);
        photo.setPhotoPath(path+newName);
        File newFile = new File(path+newName);
        if (!newFile.exists())
        {
            newFile.mkdirs();
        }
        try {
            /*byte[] bytes=file.getBytes();
            FileOutputStream fileOut = new FileOutputStream(path+newName);
            BufferedOutputStream bos = new BufferedOutputStream(fileOut);
            int bytesLength=bytes.length;
            while (bytesLength!=-1){
                bos.write(bytes,0,bytesLength);
                bytesLength=1;
            }*/
            file.transferTo(newFile);
            photoMapper.savePhoto(photo);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return ConstantCommon.STR_SUCCESS;
    }
}
