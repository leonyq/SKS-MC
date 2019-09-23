<%@ page contentType="image/jpeg"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*"
	pageEncoding="UTF-8"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.sun.image.codec.jpeg.JPEGImageEncoder"%>
<jsp:directive.page import="com.sun.image.codec.jpeg.JPEGImageDecoder" />
<jsp:directive.page import="com.sun.image.codec.jpeg.JPEGCodec" />
<%@page import="com.more.fw.core.common.method.ConstantsMc"%>
<%!Color getRandColor(int fc, int bc)//给定颜色的的随机取得范围
	{
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}%>
<%
	//设置页面不缓存
	response.setHeader("pragma", "no-cache");
	response.setHeader("cache-control", "no-cache");
	response.setDateHeader("expires", 0);
	//在内存中创建图像
	int width = 76, height = 26;//---如果修改随机码个数，则这个width显示图象宽度要放大不然显示不完整
	BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
	//获取图形上下文
	Graphics g = image.getGraphics();
	//生成随机类
	Random random = new Random();
	//设定背景色
	g.setColor(getRandColor(200, 250));
	g.fillRect(0, 0, width, height);
	//设定字体
	g.setFont(new Font("Times New Roman", Font.PLAIN, 22));
	//随机产生155条干扰线，使图像中的认证码不易被其他程序探测到
	g.setColor(getRandColor(160, 200));
	for (int i = 0; i < 155; i++) {
		int x = random.nextInt(width);
		int y = random.nextInt(height);
		int xl = random.nextInt(12);
		int yl = random.nextInt(12);
		g.drawLine(x, y, x + xl, y + yl);
	}
	//取随机产生的认证码（5位字符）
	String sRand = "";
	for (int i = 0; i < 5; i++) {
		int ch = random.nextInt(4);
		String rand = "";
		if (ch == 0) {
			int co1 = random.nextInt(26) + 65;
			if (co1 == 79) {//过滤：O
				co1 += 1;
			}

			rand = String.valueOf(((char) co1));
			sRand += rand;
		} else if (ch == 1) {
			int co = random.nextInt(26) + 97;
			if (co == 108 || co == 111) {//过滤：l,o
				co += 1;
			}

			rand = String.valueOf((char) co);
			sRand += rand;
		} else {
			int co = random.nextInt(10);
			if (co == 0 || co == 1) {//过滤：0,1
				co += 2;
			}

			rand = String.valueOf(co);
			sRand += rand;
		}
		//将认证码显示到图像中
		g.setColor(new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110)));
		//调用函数出来的颜色相同，可能是因为种子太接近，所以只能直接生成
		g.drawString(rand, 13 * i + 6, 20);
	}

	Thread.sleep(200);//防止爆力

	//将认证码存入SESSION
	session.setAttribute(ConstantsMc.SESSION_VALIDATE_CODE, sRand);
	session.setAttribute(ConstantsMc.SESSION_VALIDATE_CODE_TIME, new Date().getTime());
	
	//System.out.println("sRand:" + sRand);

	//图像生效
	g.dispose();
	//输出图像到页面
	OutputStream os = response.getOutputStream();
	try {
		response.reset();
		//ImageIO.write(image,"JPEG",os);
		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);
		encoder.encode(image);
		os.flush();
		os.close();
		os = null;
		response.flushBuffer();
		out.clear();
		out = pageContext.pushBody();

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
