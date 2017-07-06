package com.shunicom.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.shunicom.visualize.processMap;
import com.shunicom.visualize.rectangle;

public class MapGridServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Properties props = new Properties();
	private static Logger log = Logger.getLogger(PeoplePicServlet.class);
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public MapGridServlet() {
        super();
		try {
			props.load(MapGridServlet.class.getClassLoader().getResourceAsStream("app.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processMap pm = new processMap(props.getProperty("grids.path"));
		List<rectangle> grids = pm.getList();
		StringBuilder sb = new StringBuilder();
		for (rectangle rect : grids){
			sb.append(rect.getString());
		}
		String sbst = sb.toString();
		String resp = "[" + sbst.substring(0,sbst.length()-1) + "]";
		System.out.println("length: " + resp.length());
		response.getWriter().append(resp);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("name:" + request.getParameter("name"));
		doGet(request, response);
	}
}
