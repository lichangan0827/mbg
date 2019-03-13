package com.baizhi.controller;

import com.baizhi.entity.Upfile;
import com.baizhi.service.UpfileService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/upfile")
public class UpfileController {
    @Autowired
    private UpfileService upfileService;
    @RequestMapping("/queryAll")
    @ResponseBody
    public List<Upfile> queryAll(){
        List<Upfile> upfiles = upfileService.queryAll();
        return  upfiles;
    }
    @RequestMapping("/insert")
    public void intsert(Upfile upfile, MultipartFile upFile, HttpSession session) throws IllegalStateException, IOException {
        String id = UUID.randomUUID().toString();
        //获得文件名 获得文件后缀
        String originalFilename = upFile.getOriginalFilename();
        String extension = FilenameUtils.getExtension(originalFilename);
        String realPath = session.getServletContext().getRealPath("album");
        File file = new File(realPath);
        if(!file.exists()){
            file.mkdir();
        }
        upFile.transferTo(new File(realPath+"\\"+id+"."+extension));
        upfile.setId(id);
        upfile.setUrl(id+"."+extension);
        upfileService.insert(upfile);
    }
    @RequestMapping("/download")
    public void download(String id, HttpSession session, HttpServletResponse response) throws IOException{
        String realPath = session.getServletContext().getRealPath("album");
        System.out.println("id="+id);
        byte[] bs= FileUtils.readFileToByteArray(new File(realPath+"/"+id));
        response.setHeader("content-disposition", "attachment;filename="+id);
        ServletOutputStream os = response.getOutputStream();
        os.write(bs);
        os.flush();
    }
}
