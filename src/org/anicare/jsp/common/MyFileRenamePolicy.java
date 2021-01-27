package org.anicare.jsp.common;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	@Override
	public File rename(File oldFile) {
		
		long currentTime = System.currentTimeMillis();
		int randomNumber = (int) (Math.random() * 100000);
		
		String name = oldFile.getName();
		String body = "";
		String ext ="";
		
		
		int dot = name.lastIndexOf(".");
		
		if( dot != -1 ) {
			body = name.substring(0,dot);
			ext = name.substring(dot);
		}else {
			body = name;
		}
		
		SimpleDateFormat ft = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName = ft.format(new Date(currentTime)) + randomNumber+ext;
		
		File newfile = new File(oldFile.getParent(), fileName);
		
		
		
		return newfile;
	}

}
