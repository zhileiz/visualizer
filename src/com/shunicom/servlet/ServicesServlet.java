package com.shunicom.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.shunicom.visualize.processCSV;

/**
 * Servlet implementation class ServicesServlet
 */
public class ServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static Properties props = new Properties();
	private static Logger log = Logger.getLogger(ServicesServlet.class);
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public ServicesServlet() {
        super();
		try {
			props.load(ServicesServlet.class.getClassLoader().getResourceAsStream("app.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processCSV pc = new processCSV();
		log.info("读取文件======"+props.getProperty("heatmap.path"));
		List<String> result = pc.reprocess(props.getProperty("heatmap.path"));
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		log.info("读取内容======");
		for (String s:result){
			sb.append(s);
		}
		log.info("读取完毕======");
		String toReturn = sb.toString();
		String trim = toReturn.substring(0,toReturn.length()-1).concat("]");
		response.getWriter().append(trim);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		doGet(request, response);
	}

}
