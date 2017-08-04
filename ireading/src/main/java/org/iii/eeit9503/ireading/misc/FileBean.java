package org.iii.eeit9503.ireading.misc;

public class FileBean {
	
	private String FileName;
	private String FileExtension;
	private long FileLengtn;
	private byte[] FileBinary;
	
	public String getFileName() {
		return FileName;
	}
	public void setFileName(String fileName) {
		FileName = fileName;
	}
	public String getFileExtension() {
		return FileExtension;
	}
	public void setFileExtension(String fileExtension) {
		FileExtension = fileExtension;
	}
	public long getFileLengtn() {
		return FileLengtn;
	}
	public void setFileLengtn(long fileLengtn) {
		FileLengtn = fileLengtn;
	}
	public byte[] getFileBinary() {
		return FileBinary;
	}
	public void setFileBinary(byte[] fileBinary) {
		FileBinary = fileBinary;
	}

}
