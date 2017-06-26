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
public class PeoplePicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Properties props = new Properties();
	private static Logger log = Logger.getLogger(PeoplePicServlet.class);
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public PeoplePicServlet() {
        super();
		try {
			props.load(PeoplePicServlet.class.getClassLoader().getResourceAsStream("app.properties"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String trim = "{\"data\":{\"uv\":[{\"uv\":135328}],\"age\":[{\"30岁-39岁\":26150},{\"40岁-49岁\":15271},{\"26岁-29岁\":12670},{\"50岁-59岁\":10545},{\"60岁以上\":9789},{\"23岁-25岁\":6820},{\"18岁-22岁\":5574},{\"17岁以下\":198}],\"ufrom\":[{\"上海\":106983},{\"江苏\":3929},{\"广东\":3231},{\"河南\":2980},{\"安徽\":2876},{\"北京\":1984},{\"浙江\":1907},{\"山东\":1596},{\"湖北\":1169},{\"湖南\":777},{\"辽宁\":599},{\"福建\":589},{\"四川\":578},{\"江西\":552},{\"黑龙\":512},{\"山西\":471},{\"陕西\":442},{\"重庆\":438},{\"河北\":416},{\"吉林\":353},{\"贵州\":318},{\"天津\":309},{\"广西\":282},{\"甘肃\":191},{\"新疆\":167},{\"云南\":139},{\"内蒙古\":138},{\"海南\":96},{\"青海\":49},{\"宁夏\":35},{\"西藏\":4}],\"gender\":[{\"男\":56243},{\"女\":30515}],\"uattr\":[{\"本地\":106983},{\"外来\":28345}],\"arpu\":[{\"0-49元\":38775},{\"50-99元\":19797},{\"100-199元\":16255},{\"200元以上\":8694}]},\"code\":\"1\",\"msg\":\"ok\",\"stime\":\"20170621202906\"}";
		response.getWriter().append(trim);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("x1:" + request.getParameter("x1"));
		System.out.println("x2:" + request.getParameter("x2"));
		System.out.println("x3:" + request.getParameter("x3"));
		System.out.println("x4:" + request.getParameter("x4") + "\n");
		doGet(request, response);
	}

}
