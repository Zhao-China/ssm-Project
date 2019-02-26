package com.zwl.handler;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.zwl.entiy.FileCommon;
import com.zwl.entiy.Page;
import com.zwl.entiy.User;
import com.zwl.service.FileCommonService;
import com.zwl.utils.GlobalValues;

/**
 * 文件上传与下载
 * 
 * @author 37424
 *
 */

@Controller
public class DwonloadUploadhanler {

	@Autowired
	private FileCommonService fileCommonService;

	// 文件保存路径
	private static final String FILE = "D:/temp/";

	// 文件上传
	@RequestMapping(value = "/Upload", method = { RequestMethod.POST, RequestMethod.GET })
	public String testUpload(@RequestParam("picture") MultipartFile picture, Map<String, Object> map,
			HttpSession session, FileCommon fileCommon) throws IOException {
		if (!picture.isEmpty()) {
			String originalFilename = picture.getOriginalFilename();

			// 文件名后缀
			String fileSuffix = originalFilename.substring(originalFilename.lastIndexOf("."),
					originalFilename.length());

			// 生成随机文件名
			String name = UUID.randomUUID().toString().replace("-", "");

			// 最终文件名
			String fileName = name + fileSuffix;

			// 创建文件
			String file = FILE + fileName;
			File filePath = new File(file);
			if (!filePath.exists()) {
				filePath.mkdirs();
			}

			fileCommon.setFileName(originalFilename);
			User user = (User) session.getAttribute(GlobalValues.LOGIN_USER);
			fileCommon.setCreater(user.getUsername());
			fileCommon.setCreatedTime(new Date());
			fileCommon.setFilePath(file);

			// 保存文件
			picture.transferTo(filePath);
			// 保存到数据库
			fileCommonService.addFileCommon(fileCommon);
		}
		return "redirect:/toDwonload";
	}

	// 文件下载
	@RequestMapping(value = "/Dwonload", method = RequestMethod.GET)
	public ResponseEntity<byte[]> testDwonload(@RequestParam("id") Integer id, HttpServletRequest request)
			throws IOException {
		FileCommon fileCommon = fileCommonService.queryById(id);
		return dwonload(fileCommon.getFileName(), fileCommon.getFilePath(), request);
	}

	/**
	 * 
	 * @param fileName 显示的文件名
	 * @param filePath 下载文件的路径
	 * @param request
	 * @return
	 * @throws IOException
	 */
	private ResponseEntity<byte[]> dwonload(String fileName, String filePath, HttpServletRequest request)
			throws IOException {
		File file = new File(filePath);
		InputStream in = new FileInputStream(file);
		byte[] body = new byte[in.available()];
		in.read(body);
		String header = request.getHeader("User-Agent");
		if (header.contains("Firefox")) {
			fileName = new String(fileName.getBytes(), "IOS-8859-1");
		} else {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		}
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Disposition", "attachment;fileName=" + fileName);

		ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);
		in.close();
		return responseEntity;
	}

	// 去资料下载页面
	@RequestMapping(value = "/toDwonload", method = RequestMethod.GET)
	public String toDownload(@RequestParam(value = "curPage", required = false, defaultValue = "1") String curPage,
			Map<String, Object> map) {
		Page<FileCommon> page = fileCommonService.queryPages(map, curPage);
		map.put("page", page);
		return "download";
	}

	// 去资料上传页面
	@RequestMapping(value = "/toUpload", method = RequestMethod.GET)
	public String toUpload() {
		return "upload";
	}

	// 删除文件
	@RequestMapping(value = "/deleteFile", method = RequestMethod.GET)
	public String deleteFile(@RequestParam(value = "id") Integer id) {
		FileCommon fileCommon = fileCommonService.queryById(id);
		File file = new File(fileCommon.getFilePath());
		System.out.println(file);
		if (file.exists()) {
			file.delete();
		}
		fileCommonService.delete(id);
		return "redirect:/toDwonload";
	}
}
