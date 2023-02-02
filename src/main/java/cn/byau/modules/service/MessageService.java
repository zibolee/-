package cn.byau.modules.service;

import java.awt.Font;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.byau.modules.entity.Message;
import cn.byau.modules.mapper.MessageMapper;
import cn.byau.system.util.CommonUtils;

/**
 * Created by tjh on 2017/5/13.
 */
@Service("messageService")
public class MessageService {
	
	//以下注释的代码是获取上传的excel的另一种方法
	
	//private static final String EXCEL_XLS = "xls";
    //private static final String EXCEL_XLSX = "xlsx";
 
   
//    //判断版本获取Wordboook
//    private  Workbook getWorkbook(InputStream in, String fileName) throws IOException {
//        Workbook wbook = null;
//        if (fileName.endsWith(EXCEL_XLS)) {
//            wbook = new HSSFWorkbook(in);
//        } else if (fileName.endsWith(EXCEL_XLSX)) {
//            wbook = new XSSFWorkbook(in);
//        }
//        return wbook;
//    }
//    public String getExcelData(MultipartFile mfile, String fileName) throws IOException {{
//        
//            Workbook workbook = getWorkbook(mfile.getInputStream(), fileName);
//            		return "";
//    。。。。。
//    }



	@Autowired
	private MessageMapper messageDAO;



	public List<Message> listByPage(String messageId) {
		return messageDAO.listByPage(messageId);
	}
	/**
     *   这个方法中用到了分页插件pagehelper
     *   很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * @param pageNum 开始页数
     * @param pageSize 每页显示的数据条数
     * @param courseId 查询的留言编号
     * @return
     */
	public PageInfo<Message> listByPage(Integer pageNum, Integer pageSize, String messageId) {
		 //将参数传给这个方法就可以实现物理分页了，非常简单。
		PageHelper.startPage(pageNum, pageSize);
		List<Message> list = messageDAO.listByPage(messageId);
		PageInfo<Message> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	public void save(Message message) {
		messageDAO.save(message);
	}

	public Message getById(String messageId) {
		return messageDAO.getById(messageId);
	}

	public void update(Message message) {
		messageDAO.update(message);
	}

	public void deleteBatch(List<String> idList) {
		messageDAO.deleteBatch(idList);
	}

	public String importFile(MultipartFile mFile, String rootPath) {
		List<Message> messageList = new ArrayList<Message>();

		String fileName = mFile.getOriginalFilename();
		String extFileName = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		String filePath = CommonUtils.uuid()+extFileName;
		//String filePath = ym + fileName;
	    System.out.println(rootPath+filePath);
		String flag="上传成功,从Excel读取数据成功,添加到数据库成功";
		File file = new File(rootPath + filePath);
		try {
			
			mFile.transferTo(file);
		} catch (Exception e) {
			e.printStackTrace();
			flag="上传失败";
		}
		
		try {
			messageList = importXls(file);
			
		} catch (Exception e) {
			e.printStackTrace();
			 flag="上传成功,从Excel读取数据失败";
		}
		try {
			messageDAO.insertBatch(messageList);
		} catch (Exception e) {
			e.printStackTrace();
			flag="上传成功,从Excel读取数据成功,添加到数据库失败";
			
		}
		return flag;
	}

	public List<Message> importXls(File file) {
		List<Message> messageList = new ArrayList<Message>();
		Workbook wb = null;
		InputStream is = null;
		// HSSFWorkbook hWorkbook = null;
		String fileName = file.getName();
		try {
			is = new FileInputStream(file);
			if (fileName.endsWith(".xls")) {// HSSFWorkbook，对应xls格式的Excel文档
				wb = new HSSFWorkbook(is);
			} else if (fileName.endsWith(".xlsx")) {// XSSFWorkbook，对应xlsx格式的Excel文档；

				wb = new XSSFWorkbook(is);
			}
			
			Sheet sheet = wb.getSheetAt(0);

			if (null != sheet) {
				for (Row row : sheet) {
					if (row.getRowNum() < 1) {
						continue;
					}

					Message message = new Message();
					for (int j = 0; j <= 5; j++) {
						Cell cell = row.getCell(j);
						String value = getCellValue(cell);
						switch (j) {
						case 0:
							message.setMessageId(value);
							break;
						case 1:
							message.setMessageTit(value);
							break;
						case 2:
							message.setMessagekindId(value);
							break;

						case 3:
							message.setMessageContent(value);
							break;
						case 4:
							message.setMessageDate(value);
							break;
						case 5:
							message.setMessageReply(value);
							break;

						default:
							break;
						}
//					course.setCourseId(row.getCell(0).toString());
//					course.setCourseName(row.getCell(1).toString());
//					course.setCourseKindId(row.getCell(2).toString());
//					course.setCourseScore(row.getCell(3).toString());
//					course.setCourseHour(row.getCell(4).toString());
//					course.setCourseRemark(row.getCell(5).toString());
					}
					messageList.add(message);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != is) {
				try {
					is.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (null != wb) {
				try {
					wb.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return messageList;
	}

	public void exportFile(HttpServletResponse response) {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMdd");
		OutputStream os = null;
		XSSFWorkbook xWorkbook = null;
		try {
			String fileName = "message" + df.format(new Date()) + ".xlsx";

			os = response.getOutputStream();
			response.reset();

			response.setHeader("Content-disposition", "attachment; filename = " + URLEncoder.encode(fileName, "UTF-8"));
			response.setContentType("application/octet-streem");

			xWorkbook = new XSSFWorkbook();
			XSSFSheet xSheet = xWorkbook.createSheet("messageList");

			// set Sheet页头部
			setSheetHeader(xWorkbook, xSheet);

			// set Sheet页内容
			setSheetContent(xWorkbook, xSheet);

			xWorkbook.write(os);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (null != os) {
				try {
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (null != xWorkbook) {
				try {
					xWorkbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * set Sheet页头部
	 * 
	 * @param xWorkbook
	 * @param xSheet
	 */
	private void setSheetHeader(XSSFWorkbook xWorkbook, XSSFSheet xSheet) {
		xSheet.setColumnWidth(0, 10 * 256);
		xSheet.setColumnWidth(1, 10 * 256);
		xSheet.setColumnWidth(2, 10 * 256);
		xSheet.setColumnWidth(3, 10 * 256);
		xSheet.setColumnWidth(4, 10 * 256);
		xSheet.setColumnWidth(5, 15 * 256);

		CellStyle cs = xWorkbook.createCellStyle();
//		// 设置水平垂直居中
//		cs.setAlignment(CellStyle.ALIGN_CENTER);
//		cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
//		// 设置字体
//		Font headerFont = xWorkbook.createFont();
//		headerFont.setFontHeightInPoints((short) 12);
//		headerFont.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
//		headerFont.setFontName("宋体");
//		cs.setFont(headerFont);
		cs.setWrapText(true);// 是否自动换行

		XSSFRow xRow0 = xSheet.createRow(0);

		XSSFCell xCell0 = xRow0.createCell(0);
		xCell0.setCellStyle(cs);
		xCell0.setCellValue("留言编号");

		XSSFCell xCell1 = xRow0.createCell(1);
		xCell1.setCellStyle(cs);
		xCell1.setCellValue("留言名称");

		XSSFCell xCell2 = xRow0.createCell(2);
		xCell2.setCellStyle(cs);
		xCell2.setCellValue("分类编号");

		XSSFCell xCell3 = xRow0.createCell(3);
		xCell3.setCellStyle(cs);
		xCell3.setCellValue("内容");

		XSSFCell xCell4 = xRow0.createCell(4);
		xCell4.setCellStyle(cs);
		xCell4.setCellValue("日期");

		XSSFCell xCell5 = xRow0.createCell(5);
		xCell5.setCellStyle(cs);
		xCell5.setCellValue("回复");

	}

	/**
	 * set Sheet页内容
	 * 
	 * @param xWorkbook
	 * @param xSheet
	 */
	private void setSheetContent(XSSFWorkbook xWorkbook, XSSFSheet xSheet) {
		List<Message> messageList = messageDAO.list();
		CellStyle cs = xWorkbook.createCellStyle();
		cs.setWrapText(true);

		if (null != messageList && messageList.size() > 0) {
			for (int i = 0; i < messageList.size(); i++) {
				XSSFRow xRow = xSheet.createRow(i + 1);
				Message message = messageList.get(i);
				for (int j = 0; j < 6; j++) {
					XSSFCell xCell = xRow.createCell(j);
					xCell.setCellStyle(cs);
					switch (j) {
					case 0:
						xCell.setCellValue(message.getMessageId());
						break;
					case 1:
						xCell.setCellValue(message.getMessageTit());
						break;
					case 2:
						xCell.setCellValue(message.getMessagekindId());
						break;

					case 3:
						xCell.setCellValue(message.getMessageContent());
						break;
					case 4:
						xCell.setCellValue(message.getMessageDate());
						break;
					case 5:
						xCell.setCellValue(message.getMessageReply());
						break;

					default:
						break;
					}
				}
			}
		}
	}

	private String getCellValue(Cell cell) {
		String cellValue = "";
		//DecimalFormat df = new DecimalFormat("#");
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_STRING:
			cellValue = cell.getRichStringCellValue().getString().trim();
			break;
		case Cell.CELL_TYPE_NUMERIC:
			if (DateUtil.isCellDateFormatted(cell)) {
				Date tempValue = cell.getDateCellValue();
				SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy-MM-dd");
				cellValue = simpleFormat.format(tempValue);
			} else {
				cellValue = String.valueOf(cell.getNumericCellValue());
			}
			//cellValue = df.format(cell.getNumericCellValue()).toString();
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			cellValue = String.valueOf(cell.getBooleanCellValue()).trim();
			break;
		case Cell.CELL_TYPE_FORMULA:
			cellValue = cell.getCellFormula();
			break;
		default:
			cellValue = "";
			break;
		}
		return cellValue;
	}
}
