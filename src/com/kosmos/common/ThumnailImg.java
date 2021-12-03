package com.kosmos.common;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.awt.image.renderable.ParameterBlock;
import java.io.File;

import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;

public class ThumnailImg {

	public static void thumnailFun(String uploadPath, String filename) {
		System.out.println("ThumnailImg thumnailFun() 함수 진입 >>> : ");
		
		System.out.println("uploadPath >>> : " + uploadPath);
		System.out.println("filename >>> : " + filename);
		File file = null;
		
		try {
			ParameterBlock pb = new ParameterBlock();
			pb.add(uploadPath + "\\" + filename);
			
			RenderedOp rOp = JAI.create("fileload", pb);
			BufferedImage bi = rOp.getAsBufferedImage();
			
			// 썸네일 배경 크기와 썸네일 색상
			BufferedImage thumb = new BufferedImage(50, 50, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = thumb.createGraphics();
			
			// 썸네일 위치, 썸네일 크기
			g.setColor(Color.WHITE);
			g.fillRect(0, 0, 50, 50);
			g.drawImage(bi, 0, 0, 50, 50, null);
			
			//g.setComposite(AlphaComposite.Clear);
			//g.fillRect(0, 0, 500, 500);
			//g.setComposite(AlphaComposite.Src);
			
			file = new File(uploadPath + "\\sm_" + filename);
			ImageIO.write(thumb, "jpg", file);
			System.out.println("uploadPath/" + file.getName());
		}catch(Exception e) {
			System.out.println("ThumnailImg thumnailFun() >>> : " + e.getMessage());
		}
		
		System.out.println("ThumnailImg thumnailFun() 함수 끝 >>> : ");
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
