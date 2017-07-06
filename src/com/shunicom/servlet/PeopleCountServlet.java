package com.shunicom.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.shunicom.visualize.processCount;
import com.shunicom.visualize.processMap;
import com.shunicom.visualize.rectangle;

public class PeopleCountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Properties props = new Properties();
	private static Logger log = Logger.getLogger(PeoplePicServlet.class);
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public PeopleCountServlet() {
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
		processCount pc = new processCount(props.getProperty("heatmap.path"));
		HashMap<String,Integer> countMap = pc.getMap();
		Iterator<Entry<String,Integer>> it = countMap.entrySet().iterator();
		StringBuilder sb = new StringBuilder();
		while (it.hasNext()){
			Entry<String,Integer> ent = it.next();
			sb.append("{\"gridId\":\"" + ent.getKey() + "\",\"count\":\"" + ent.getValue() + "\"},");
		}
		String sbstr = sb.toString();
		String toReturn = "[" + sbstr.substring(0,sbstr.length()-1) + "]";
		response.getWriter().append(toReturn);
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("countname:" + request.getParameter("name"));
		doGet(request, response);
	}
}

