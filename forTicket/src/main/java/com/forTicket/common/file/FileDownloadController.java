package com.forTicket.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.coobird.thumbnailator.Thumbnails;

@Controller("fileDownloadController")
public class FileDownloadController {
	private static String THEATER_IMAGE_REPO = "C:\\forTicket\\theater";
	private static String GOODS_IMAGE_REPO = "C:\\forTicket\\goods";
	private static String EVENT_IMAGE_REPO = "C:\\forTicket\\event";
	private static final String COMMUNITY_IMAGE_REPO = "C:\\forTicket\\community";
	
	@RequestMapping("/theater/download.do")
	protected void t_download(@RequestParam("theater_image") String theater_image, @RequestParam("theater_id") int theater_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = THEATER_IMAGE_REPO + "\\" + theater_id+"\\"+theater_image;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+theater_image);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/goods/download.do")
	protected void g_download(@RequestParam("goods_fileName") String goods_fileName, @RequestParam("goods_id") int goods_id, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = GOODS_IMAGE_REPO + "\\" + goods_id+"\\"+goods_fileName;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+goods_fileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/event/download.do")
	protected void e_download(@RequestParam("event_fileName") String event_fileName, @RequestParam("event_no") int event_no, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		OutputStream out = resp.getOutputStream();
		String downFile = EVENT_IMAGE_REPO + "\\" + event_no+"\\"+event_fileName;
		File file = new File(downFile);
		resp.setHeader("Cache-Control", "no-cache");
		resp.addHeader("Content-disposition", "attachment: fileName="+event_fileName);
		FileInputStream in = new FileInputStream(file);
		byte[] buffer = new byte[1024*8];
		while(true) {
			int count = in.read(buffer);
			if(count==-1) break;
			out.write(buffer, 0, count);
		}
		in.close();
		out.close();
	}
	
	@RequestMapping("/goods/thumbnails.do")
	protected void thumbnails(@RequestParam("goods_fileName") String goods_fileName, @RequestParam("goods_id") String goods_id, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=GOODS_IMAGE_REPO+"\\"+goods_id+"\\"+goods_fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(255,357).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
	
	@RequestMapping("/event/thumbnails.do")
	protected void thumbnails(@RequestParam("event_no") int event_no,@RequestParam("event_fileName") String event_fileName, HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		String filePath=GOODS_IMAGE_REPO+"\\"+event_no+"\\"+event_fileName;
		File image=new File(filePath);
		
		if (image.exists()) { 
			Thumbnails.of(image).size(121,154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}

	@RequestMapping("/community/download.do")
	protected void download(@RequestParam("imageFileName") String imageFileName, @RequestParam("c_No") String c_No,	HttpServletResponse response) throws Exception {
		
		OutputStream out = response.getOutputStream();//웹에서 보내준다
		
		String downFile = COMMUNITY_IMAGE_REPO + "\\" + c_No + "\\" + imageFileName;
		File file = new File(downFile);
		
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disponsition", "attachment: fileName="+imageFileName);
		
		FileInputStream in = new FileInputStream(file);
		
		byte[] buffer = new byte[1024*8];
		
		while(true) {
			int count = in.read(buffer);
			if(count == -1)
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();		
	
	}//download

}
