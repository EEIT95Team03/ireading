package org.iii.eeit9503.ireading.misc;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
public class FileUploader {

	public FileBean toFileBean(CommonsMultipartFile multipartFile) {
		FileBean fileBean = new FileBean();

		String[] temp = multipartFile.getOriginalFilename().split("\\.");
		String fileName = temp[0];
		String fileExtension = temp[1];
		long fileLength = multipartFile.getSize();
		byte[] fileBytes = multipartFile.getBytes();

		fileBean.setFileName(fileName);
		fileBean.setFileBinary(fileBytes);
		fileBean.setFileLengtn(fileLength);
		fileBean.setFileExtension(fileExtension);

//		 try {
//		 File output = new File("C:/Intel/ooo.png");
//		 System.out.println("output="+output);
//		 FileOutputStream fos = new FileOutputStream(output);
//		 fos.write(fileBytes);
//		 fos.close();
//		 } catch (FileNotFoundException e) {
//		 e.printStackTrace();
//		 } catch (IOException e) {
//		 e.printStackTrace();
//		 }

		return fileBean;
	}

}
