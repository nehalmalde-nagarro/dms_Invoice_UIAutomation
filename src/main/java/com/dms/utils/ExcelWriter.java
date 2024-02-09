package com.dms.utils;

import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExcelWriter {
	private static HSSFWorkbook workbook;
    private static HSSFSheet sheet;
	public void setCellValue(int rowNum,int cellNum,String  cellValue,String excelFilePath) throws IOException {
        //creating a new cell in row and setting value to it      

          sheet.getRow(rowNum).createCell(cellNum).setCellValue(cellValue);
          
          FileOutputStream outputStream = new FileOutputStream(excelFilePath);
          workbook.write(outputStream);
  
	}
}
