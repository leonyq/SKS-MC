<%@page language="java" errorPage="/plf/error.jsp" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
  <meta charset="utf-8" /> 
  <title>摩尔软件</title> 
  <meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no"/> 
  <meta name="apple-mobile-web-app-capable" content="yes" /> 
  <meta name="apple-mobile-web-app-status-bar-style" content="black" /> 
  <script src="${path}plf/page/mlabel/page/mobile/js/mui.js"></script> 
  <script src="${path}plf/page/mlabel/page/mobile/js/public/public.js"></script> 
  <link rel="stylesheet" href="${path}plf/page/mlabel/page/mobile/css/mui.min.css" />
  <link rel="stylesheet" type="text/css" href="${path}plf/page/mlabel/page/mobile/css/app.css"/> 
  <style>
  	
  	.head-div{
  		width: 100%;
  		height: 0.333rem;
  		background-color: #004098;
  		text-align: center;
  		margin: auto;
  	}
  	.head-div div{
  		color: #ffffff;
  		font-size: 0.141rem;
  		font-family: 黑体;
  		padding-top:0.096rem;
  		display: block;
  		font-weight:bold;
  	}
  	
  	.head-div-user{
  		width: 100%;
  		height: 0.304rem;
  		background-color: #EFEFEF;
  		margin: auto;
  		border-bottom: 1px solid #E1E1E1;
  	}
  	.head-div-user span{
  		color: #999999;
  		font-size: 0.108rem;
  		font-family: 黑体;
  		padding-top:0.0780rem;
  		padding-left:10%;
  		display: block;
  	}
  	.text-content-div{
  		width: 100%;
  		height: 0.45rem;
  		font-size: 0.108rem;
  	}
	input::-webkit-input-placeholder { /* WebKit browsers*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　　}
	input:-moz-placeholder {  /* Mozilla Firefox 4 to 18*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　　}
	input::-moz-placeholder {  /* Mozilla Firefox 19+*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	　　}
	input:-ms-input-placeholder { /* Internet Explorer 10+*/ 
	　　color:#AAAAAA;font-size: 0.108rem;
	}
	input{
		font-size: 0.108rem;
		height: 0.166rem;
	}
  </style>
 </head> 
 <body style="background-color: #efefef;width: 100%"> 
  <div class="head-div" id="yesDiv">
  		<div>
   		<img src="${path}plf/page/mlabel/page/mobile/img/logo.png" style="height: 0.11rem"><span>&ensp; 共享标签</span>
   		</div>
  </div> 
  
    <div class="head-div" style="display:none;text-align: center;" id="errorDiv">
  		<div  style="height:0.291rem;background-color: #e85a48;font-size:0.108rem;width:100%;text-align: left;">
  				<span id="errorContexnt" style="margin-left:10%;display:block;margin-top: -0.03rem;"></span>
   		</div>
  </div>
  <div class="head-div-user">
   		<span>注册新用户</span>
  </div> 
  <div style="background-color: #ffffff;">
   <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>手机号</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input  placeholder="请输入手机号" style="border: 0px;padding:0px;height: 0.166rem;" onblur="validatePhoneService()" id="phoneNumber" type="text"/>
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>密码</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input  placeholder="请输入密码" style="border: 0px;padding:0px;height: 0.166rem;" onblur="validatePassWord()" id="password" type="password"/>
  			</div>
  		</div>
  		
  </div>
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;border-bottom: 1px solid #E1E1E1;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>确认密码</span>
  			</div>
  			<div style=";width: 70%;float: left;">
  				<input  placeholder="请再次输入密码" style="border: 0px;padding:0px;height: 0.166rem;" id="nextPassword" onblur="validateNextPassword()" type="password"/>
  			</div>
  		</div>
  		
  </div>
  
  <div class="text-content-div">
  		<div style="width:90%;height: 100%;;margin-left:10%;padding-top:  0.165rem">
  			<div style="width: 20%;float: left;">
  				<span style="color:#ff0000 ">*</span><span>验证码</span>
  			</div>
  			<div style=";width: 80%;float: left;">
  				<div style="width: 50%;float: left;margin-right: 10%;">
  					 <input  placeholder="请输入短信验证码" style="border: 0px;padding:0px;height: 0.166rem;" id="noteMessage"  type="text"/>
  				</div>
  				<div style="width: 30%;float: left;border:  1px solid #004098;height:0.275rem;width:0.75rem;text-align: center;border-radius:0.036rem;margin-top: -0.0614rem;  ">
					  					<span style="display: block;margin-top: 0.05rem;color: #004098" onclick="sendMessageInfo(this)" id="textNote">获取验证码</span>  					
  				</div>
  			</div>
  		</div>
  		
  </div>
  
  </div>
  <div style="width: 100%;;background-color: #efefef;">
  	<div style="width: 90%;padding-top: 0.2rem;padding-left: 10%;color: #666666;font-size:0.108rem">
  		<div style="width: 10px;height: 10px;float: left;margin-right: 0.1rem;margin-top: 0.025rem">
  			<img src="${path}plf/page/mlabel/page/mobile/img/ico-disgree.png" style="width: 0.13rem" id="disgreeInfo" onclick="showAgreeInfo()">
  		</div>
  		<!-- <input type="checkbox" style="display: block;margin-top: 0.025rem;float: left">  --><span >我已阅读并同意</span> <span style="color: #004098" onclick="showAgreeInfo()">《摩尔云用户协议》</span>
  	</div>
  	<div style="width: 80%;font-size:0.141rem;color:#ffffff;margin-left: 10%;border:  0px solid #004098;height: 0.375rem;margin-top: 43%;border-radius:0.056rem;background-color: #cccccc;text-align: center" id="submitInfo">
  		<div style="margin-top: 0.117rem;padding-top: 0.100rem" onclick="openNextPage()">下一步</div>
  	</div>  
  </div>
  <div class="mui-popup mui-popup-in" style="display: none;width: 100%;height: 100%;background-color: #000000;opacity:0.5;border-radius: 0px;">
  		
  </div>
  <div class="mui-popup mui-popup-in" style="display: none;width: 80%;height: 80%;border-radius: 0px;">
  		
  		<div style="width: 100%;height: 100%;background-color: #ffffff;opacity:1;border-radius:0.056rem ">
  			<div style="text-align: cener;width: 100%">
  			  			<img src="${path}plf/page/mlabel/page/mobile/img/ico-delete.png" style="width: 0.13rem; margin-top: 5%;margin-right: -81%;" id="disgreeInfo" onclick="hideAgreeInfo()">
  			
  		</div>
  			<div style="font-size: 0.133rem;padding-top: 0.125rem;height: 9%; margin-top: -0.3rem;">摩尔共享标签用户协议</div>
  			<div style="width: 90%;height: 80%;overflow: auto;font-size: 0.125rem;text-align: left;margin-left: 5%;" >
  				欢迎使用摩尔共享标签云服务（以下简称“服务”）！
提示：在使用服务之前，您应当认真阅读并遵守《摩尔共享标签用户协议》（以下简称“本协议”）以及《隐私政策》，请您务必审慎阅读、充分理解各条款内容，特别是免除或者限制责任的条款、争议解决和法律适用条款。免除或者限制责任的条款可能将以字体加粗显示，您应重点阅读。
<br/>
摩尔共享标签用户协议
<br/>
<br/>
一、特别提示
<br/>
1.1、福建摩尔软件有限公司（以下简称"摩尔软件"）同意按照本协议的规定及其不时发布的操作规则提供基于互联网以及移动网的摩尔共享标签云服务（以下称“服务“），为获得服务，服务使用人/企业（以下简称“用户”或“您”）应当基于了解本协议全部内容，在独立思考的基础上认可、同意本协议的全部条款并按照页面上的提示完成全部的注册程序。您在进行注册程序过程中点击"同意"按钮即表示您完全接受《摩尔共享标签用户协议》（以下简称“本协议”）及摩尔软件公示的各项规则、规范。您确认，您是具备完全民事权利能力和完全民事行为能力的自然人、法人或其他组织（以下简称“法律主体”），如您代表一家公司或其他法律主体进行注册或以其他允许的方式实际使用本服务，视为您已经获得该公司或该法律主体授权同意受本协议条款的约束。如果您不具备前述法律主体资格，请立即终止注册程序及在摩尔软件平台上的任何操作，且摩尔软件有权注销您的帐号。摩尔软件因此受到损失的，将向您和/或您的监护人索赔。
<br/>1.2、您注册成功后，摩尔软件将为您基于服务使用的客观需要而在申请、注册服务时，按照注册要求提供的帐号开通服务，您有权在摩尔软件为其开通、并同意向其提供服务的基础上使用服务。该帐号和密码由您负责保管，应当使用由字母、数字、特殊字符组合的密码（建议采用８位以上长度），并应定期更改密码；您使用服务过程中，须对其账号下使用服务的行为、对任何由您账号通过服务发布、公开的信息，及对由此产生的任何后果承担全部责任。
<br/>1.3、在注册帐号或使用本服务的过程中，您需要提供一些必要的信息，例如：为向您提供帐号注册服务或进行身份识别，需要您填写手机号码或其它身份信息；需要您提供电子邮箱来接收摩尔产品使用信息；您需要确保填写的文件和资料都是合法、真实、准确、完整和有效的，不存在虚假记载、重大遗漏或误导性陈述。若您提供的信息不完整或者存在虚假等问题，则可能影响您无法使用本服务或在使用本服务过程中受到限制。
<br/>1.4、为提高您的服务体验和满意度，您同意摩尔软件将基于您的操作行为对您的行为数据进行调查研究和分析，从而进一步优化产品及服务。
<br/>1.5、您在使用结束后，如需暂时或永久离开本服务，数据将会自动归档处理，待归档期限结束后会自动删除。
<br/>
二、服务内容
<br/>
<br/>2.1、摩尔共享标签云服务的具体内容由摩尔软件根据实际情况提供，包括但不限于授权您通过其帐号，使用登录功能、购买功能、咨询功能等，摩尔软件有权对其提供的服务或产品形态进行升级或其他调整，并将及时告知您。
<br/>2.2、摩尔软件仅提供与服务相关的技术服务等，除此之外与相关网络服务有关的设备（如个人电脑、手机、及其他与接入互联网或移动网有关的装置）及所需的费用（如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费）均应由您自行负担。
<br/><br/>三、服务变更、中断或终止
<br/>3.1、鉴于网络服务的特殊性（包括但不限于服务器的稳定性问题、恶意的网络攻击等行为的存在及其他摩尔软件无法控制的情形），您同意摩尔软件有权随时中断或终止部分或全部的服务，若发生该等中断或中止服务的情形，摩尔软件将尽可能及时通过网页公告、系统通知、私信、短信、微博或其他合理方式通知受到影响的您。
<br/>3.2、您理解，摩尔软件需要定期或不定期地对提供服务的平台（如互联网网站、移动网络等）或相关的设备进行检修或者维护，如因此类情况而造成服务在合理时间内的中断，摩尔软件无需为此承担任何责任，但摩尔软件应尽可能事先进行通告。
<br/>3.3、如发生下列任何一种情形，摩尔软件有权随时中断或终止向您提供本协议项下的服务而无需对您或任何第三方承担任何责任：
<br/>3.1.1、您提供的个人资料不真实
<br/>3.1.2、您违反法律法规国家政策或本协议中规定的使用规则
<br/>3.1.3、您在使用收费服务时未按规定付费
<br/>3.4、如您在申请开通服务后在任何连续365日内未实际使用，则摩尔软件有权选择采取以下任何一种方式进行处理，由此产生的一切法律责任将由您自行承担：
<br/>3.4.1、回收用户帐户
<br/>3.4.2、停止提供服务
<br/><br/>四、使用规则
<br/>4.1、您注册摩尔共享标签账号，应当使用真实身份信息，不得以虚假、冒用的居民身份信息、企业注册信息、组织机构代码信息进行注册。
<br/>4.2、如您违反前述4.1条之约定，依据相关法律、法规及国家政策要求，摩尔软件有权随时中止或终止您对服务的使用且不承担责任。
<br/>4.3、您在使用服务时，摩尔软件有权基于安全运营、社会公共安全的需要或国家政策的要求，要求您提供准确的个人资料，如您提供的个人资料有任何变动，导致您的实际情况与您提交给摩尔软件的信息不一致的，您应及时更新。
<br/>4.4、您不应将其帐号、密码转让或出借予他人使用。如您发现其帐号或服务遭他人非法使用，应立即通知摩尔软件协调处理。因无法对非法或未经您授权使用您账号及密码的行为作出甄别，因此摩尔软件不承担任何责任。
<br/>4.5、您同意摩尔软件在提供服务过程中以各种方式投放各种商业性广告或其他任何类型的商业信息，并且，您同意接受摩尔软件通过电子邮件或其他方式向您发送商品促销或其他相关商业信息。
<br/>4.6、对于您通过服务公开发布的任何内容，您同意摩尔软件在全世界范围内具有免费的、永久性的、不可撤销的、非独家的和完全再许可的权利和许可，以使用、复制、修改、改编、出版、翻译、据以创作衍生作品、传播、表演和展示此等内容（整体或部分），和/或将此等内容编入当前已知的或以后开发的其他任何形式的作品、媒体或技术中。
<br/>4.7、您在使用服务过程中，不得在网站上制作、复制、上传、发布、传播含有下列内容之一的信息：
<br/>4.7.1、违反宪法确定的基本原则的；
<br/>4.7.2、危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；
<br/>4.7.3、损害国家荣誉和利益的；
<br/>4.7.4、煽动民族仇恨、民族歧视，破坏民族团结的；
<br/>4.7.5、破坏国家宗教政策，宣扬邪教和封建迷信的；
<br/>4.7.6、散布谣言，扰乱社会秩序，破坏社会稳定的；
<br/>4.7.7、散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；
<br/>4.7.8、侮辱或者诽谤他人，侵害他人合法权益的；
<br/>4.7.9、煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；
<br/>4.7.10、以非法民间组织名义活动的；
<br/>4.7.11、不符合《即时通信工具公众信息服务发展管理暂行规定》及遵守法律法规、社会主义制度、国家利益、公民合法利益、公共秩序、社会道德风尚和信息真实性等“七条底线”要求的；
<br/>4.7.12、发布、传送、传播、储存侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的内容；
<br/>4.7.13、涉及他人隐私、个人信息或资料的；
<br/>4.7.14、发表、传送、传播骚扰、广告信息、过度营销信息及垃圾信息或含有任何性或性暗示的；
<br/>4.7.15、干扰摩尔软件正常运营和侵犯其他您或第三方合法权益内容的信息。
<br/>4.7.16、含有中国法律、法规以及任何具有法律效力之规范所限制或禁止的其它内容的。
<br/>4.8、摩尔软件针对某些特定的服务的使用通过各种方式（包括但不限于网页公告、系统通知、私信、短信提醒等）作出的任何声明、通知、警示等内容视为本协议的一部分，您如使用该等服务，视为您同意该等声明、通知、警示的内容。
<br/>4.9、您承诺自己在使用本网站服务的所有行为均遵守国家法律、法规和本网站的相关规定以及各种社会公共利益或公共道德。对于任何法律后果的发生，您将以自己的名义独立承担所有相应的法律责任，摩尔软件不承担任何责任。
<br/>4.10、您在使用服务时如发现服务系统或其他相关系统的信息安全漏洞需及时通知摩尔软件，禁止对摩尔软件服务系统进行漏洞扫描、渗透测试等可能造成摩尔软件损失的行为。
<br/><br/>4.11、除非法律允许或摩尔软件书面许可，您使用本产品或服务过程中不得从事下列行为：
<br/>4.11.1、删除本产品及其副本上关于著作权的信息；
<br/>4.11.2、对摩尔软件拥有知识产权的内容进行使用、出租、出借、复制、修改、链接、转载、发表、出版、建立镜像站点等；
<br/>4.11.3、不得使用非摩尔软件经授权的第三方工具/服务接入本产品和相关系统；
<br/>4.11.4、自行或者授权他人、第三方产品对本产品及其组件、模块、数据进行干扰；
<br/>4.11.5、其他未经摩尔软件明示授权的行为。
<br/>4.12、除非法律允许或摩尔软件书面许可，使用本产品或服务过程中不得从事下列行为：
<br/>4.12.1、提交、发布虚假信息，或冒充、利用他人名义的；
<br/>4.12.2、诱导其他人点击链接页面或分享信息的；
<br/>4.12.3、虚构事实、隐瞒真相以误导、欺骗他人的；
<br/>4.12.4、侵害他人名誉权、肖像权、知识产权、商业秘密等合法权利的；
<br/>4.12.5、其他违反法律法规规定、侵犯其他人合法权益、干扰产品正常运营或摩尔软件未明示授权的行为。
<br/><br/>五、知识产权
<br/>5.1、摩尔软件提供的网络服务中包含的任何文本、图片、图形、音频和/或视频资料均受著作权、商标和/或其它财产所有权法律的保护，未经相关权利人同意，上述资料均不得在任何媒体直接或间接发布、播放、出于播放或发布目的而改写或再发行，或者被用于其他任何商业目的。所有这些资料或资料的任何部分仅可作为私人和非商业用途而保存在某台计算机内。摩尔软件不就由上述资料产生或在传送或递交全部或部分上述资料过程中产生的延误、不准确、错误和遗漏或从中产生或由此产生的任何损害赔偿，以任何形式，向您或任何第三方负责。
<br/>5.2、服务中涉及的“摩尔软件”、“摩尔”、“摩尔软件”、“moresoft”、“morelean”、”共享标签”、“morelable”等文字或图形及其组成，均是摩尔软件的商标。未经摩尔软件事先书面同意，您不得擅自使用或展示这些商标，一经发现，摩尔软件将追究法律责任。
<br/>5.3、摩尔软件为提供服务而使用的，或者第三方针对服务开发的在平台上运行、供您使用的任何软件（包括但不限于软件中所含的任何图象、照片、动画、录像、录音、音乐、文字和附加程序、随附的帮助材料）的一切权利均属于该软件的著作权人，未经该软件的著作权人许可，您不得对该软件进行反向工程、反向编译或反汇编。
<br/><br/>六、免责声明
<br/>6.1、您在使用服务的过程中应遵守国家法律法规及政策规定，因其使用服务而产生的行为后果由您自行承担。
<br/>6.2、通过服务发布的任何信息，及通过服务传递的任何观点不代表摩尔软件之立场，摩尔软件亦不对其完整性、真实性、准确性或可靠性负责。您对于可能会接触到的非法的、非道德的、错误的或存在其他失宜之处的信息，及被错误归类或是带有欺骗性的发布内容，应自行做出判断。在任何情况下，对于任何信息，包括但不仅限于其发生的任何错误或遗漏；或是由于使用通过服务发布、私信、传达、其他方式所释出的或在别处传播的信息，而造成的任何损失或伤害，应由相关行为主体承担全部责任。
<br/>6.3、鉴于外部链接指向的网页内容非摩尔软件实际控制，因此摩尔软件无法保证为向您提供便利而设置的外部链接的准确性和完整性。
<br/>6.4、您完全理解并同意，本服务涉及到互联网等相关服务，可能会受到不可抗力（包括但不限于战争、台风、水灾、火灾、地震、罢工、暴动等）、计算机病毒或黑客攻击、互联网络等造成的服务中断或不能满足您要求的风险，使用本服务的您须承担以上风险，摩尔软件不承担任何责任。
<br/>6.5、对网站系统发生故障影响到本服务的正常运行，摩尔软件承诺将及时处理、修复。但您因此而产生的经济和精神损失，摩尔软件不承担任何责任。此外，摩尔软件保留不经事先通知进行维护、升级或其他目的暂停本服务的权利，由此产生的损失摩尔软件不承担任何责任。
<br/>6.6、您在使用过程中遭受的来自任何他人的威胁、诽谤或其他非法行为，您对此必须自己承担责任，摩尔软件对本服务不做任何类型的保证；对因此导致任何您产生直接或间接地损失，摩尔软件不承担任何责任。
<br/>6.7、您在注册账号后，如果出现违反法律或本协议的情形，摩尔软件有权回收该账号，由此给您带来的任何问题均由您自行承担。
<br/>6.8、如发生下列任何一种情形，摩尔软件有权随时中断或终止向您提供服务而无需通知该您：
<br/>6.8.1、提供的个人资料不真实或存在侵犯第三方知识产权或其他权利的情形；
<br/>6.8.2、违反本服务条款的规定；
<br/>6.8.3、按照政府部门和/或司法机关的要求；
<br/>6.8.4、注册后长期（持续365日或以上）闲置不用的账号；
<br/>6.8.5、恶意抢注企业名称，摩尔软件收到第三方投诉且该第三方出具相应证据的；
<br/>6.8.6、其他摩尔软件认为是符合整体服务需求的特殊情形。
<br/>6.9、您知悉并同意，摩尔软件可能会与第三方合作向您提供产品，并由第三方向您提供该产品的升级、维护、客服等后续工作，由该等第三方对该产品的质量问题或其本身的原因导致的一切纠纷或您的损失承担责任，您在此同意将向该第三方主张与此有关的一切权利和损失。
<br/>6.10、摩尔平台上提供的产品或服务，如未标明使用期限、或者其标明的使用期限为“永久”、“无限期”或“无限制”的，则其使用期限为自您获得该产品或服务之日起至该产品或服务在摩尔软件下线之日为止。
<br/><br/>七、赔偿
<br/>7.1、如因摩尔软件违反有关法律、法规或本协议项下的任何条款而给您造成损失，摩尔软件同意承担由此造成的损害赔偿责任，赔偿金额限于您为购买相应服务已支付的费用。在相关法律所允许的最大范围内，摩尔软件不就您因使用或不能使用服务所发生的间接损害（包括但不限于营业中断、利润损失、商业信息的丢失、费用增加等）承担赔偿责任；摩尔软件不对由于移动通信服务商、互联网接入服务商等第三方原因导致服务无法使用或出现故障所发生的损失承担责任。
<br/>7.2、您同意保障和维护摩尔软件及其他您的利益，如因您违反有关法律、法规或本协议项下的任何条款而给摩尔软件或任何其他第三人造成损失，您同意承担由此造成的损害赔偿责任并保证摩尔软件免遭损失。
<br/><br/>八、协议修改
<br/>8.1、摩尔软件保留不时修改本协议任何条款的权利，一旦本协议的内容发生变动，摩尔软件将会在网站上公布修改之后的协议内容，修改后的条款一经公布立即生效，摩尔软件无需另行通知您。若您不同意上述修改，则可以选择停止使用服务。摩尔软件也可选择通过其他适当方式（比如系统通知）向您通知修改内容。
<br/>8.2、如果不同意摩尔软件对本协议相关条款所做的修改，您有权停止使用服务。如果您继续使用服务，则视为您接受摩尔软件对本协议相关条款所做的修改。
<br/><br/>九、通知到达
<br/>9.1、本协议项下摩尔软件对于您所有的通知均可通过网页公告、电子邮件、系统通知主动联系、私信、手机短信或常规的信件传送等方式进行；该等通知于发送之日视为已送达收件人。
<br/>9.2、您对于摩尔软件的通知应当通过摩尔软件对外正式公布的通信地址、传真号码、电子邮件地址等联系信息进行送达。
<br/><br/>十、法律适用
<br/>10.1、本协议及其修订本的有效性、履行和解释均适用于中华人民共和国之法律，任何争议也仅适用中华人民共和国法律。如协议服务条款之任何一部分与中华人民共和国法律相抵触，则该部分条款应按法律规定重新解释，部分条款之无效或重新解释不影响其它条款之法律效力。
<br/>10.2、因本协议所引起的您与摩尔软件的任何纠纷或争议，首先应本着友好协商原则进行解决，如果协商不成的，您在此完全同意将纠纷或争议提交至摩尔软件所在地有管辖权的人民法院通过诉讼解决。
<br/><br/>十一、其他规定
<br/>11.1、本协议构成双方对本协议之约定事项及其他有关事宜的完整协议，除本协议规定的之外，未赋予本协议各方其他权利。
<br/>11.2、如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。
<br/>11.3、本协议中的标题仅为方便而设，在解释本协议时应被忽略。
<br/><br/>十二、隐私政策
<br/>12.1引言
<br/>摩尔重视用户的隐私。您在使用我们的服务时，我们可能会收集和使用您的相关信息。我们希望通过本《隐私政策》向您说明，在使用我们的服务时，我们如何收集、使用、储存和分享这些信息，以及我们为您提供的访问、更新、控制和保护这些信息的方式。本《隐私政策》与您所使用的摩尔共享标签云服务息息相关，希望您仔细阅读，在需要时，按照本《隐私政策》的指引，作出您认为适当的选择。本《隐私政策》中涉及的相关技术词汇，我们尽量以简明扼要的表述，并提供进一步说明的链接，以便您的理解。
您使用或继续使用我们的服务，即意味着同意我们按照本《隐私政策》收集、使用、储存和分享您的相关信息。如对本《隐私政策》或相关事宜有任何问题，请通过摩尔网站提供的联系方式与我们联系。
<br/>12.2我们可能收集的信息
我们提供服务时，可能会收集、储存和使用下列与您有关的信息。如果您不提供相关信息，可能无法注册成为我们的用户或无法享受我们提供的某些服务，或者无法达到相关服务拟达到的效果。
我们可能收集的信息
<br/>•您在注册账户或使用我们的服务时，向我们提供的相关个人信息或企业信息，例如姓名、身份证件号码、联系地址、个人生物识别信息、电话号码、电子邮箱、企业用户名称、企业银行账户、企业用户联系人、企业用户联系方式等；
<br/>•您通过我们的服务向其他方提供的共享信息，以及您使用我们的服务时所储存的信息。
其他方分享的您的信息
<br/>•其他方使用我们的服务时所提供有关您的共享信息。
<br/>12.3我们可能如何使用信息
我们可能将在向您提供服务的过程之中所收集的信息用作下列用途：
<br/>•向您提供服务；
<br/>•在我们提供服务时，用于身份验证、客户服务、安全防范、存档和备份用途，确保我们向您提供的产品和服务的安全性；
<br/>•帮助我们设计新服务，改善我们现有服务；
<br/>•使我们更加了解您如何接入和使用我们的服务，从而针对性地回应您的个性化需求，例如语言设定、位置设定、个性化的帮助服务和指示，或对您和其他用户作出其他方面的回应；
<br/>•向您提供与您更加相关的广告以替代普遍投放的广告；
<br/>•评估我们服务中的广告和其他促销及推广活动的效果，并加以改善；
<br/>•软件认证或管理软件升级；
<br/>•让您参与有关我们产品和服务的调查。开展摩尔共享标签云服务相关的市场活动，向您推送最新的市场活动信息及优惠方案；
<br/>•协助国家司法、行政、安全机关等权利机构开展调查，并遵守适用法律法规及其他向有权机构承诺之义务；
为了让您有更好的体验、改善我们的服务或您同意的其他用途，在符合相关法律法规的前提下，我们可能将通过某一项服务所收集的信息，以汇集信息或者个性化的方式，用于我们的其他服务。例如，在您使用我们的一项服务时所收集的信息，可能在另一服务中用于向您提供特定内容，或向您展示与您相关的、非普遍推送的信息。如果我们在相关服务中提供了相应选项，您也可以授权我们将该服务所提供和储存的信息用于我们的其他服务。
<br/>12.4您如何访问和控制自己的个人信息
我们将尽一切可能采取适当的技术手段，保证您可以访问、更新和更正自己的注册信息或使用我们的服务时提供的其他个人信息。在访问、更新、更正和删除前述信息时，我们可能会要求您进行身份验证，以保障账户安全。
<br/>12.5我们可能分享的信息
除以下情形外，未经您同意，我们以及我们的关联公司不会与任何第三方分享您的个人信息：
<br/>•我们以及我们的关联公司，可能将您的个人信息与我们的关联公司、合作伙伴及第三方服务供应商、承包商及代理（例如代表我们发出电子邮件或推送通知的通讯服务提供商、为我们提供位置数据的地图服务供应商）分享（他们可能并非位于您所在的法域），用作下列用途：
<br/>•向您提供我们的服务；
<br/>•实现“我们可能如何使用信息”部分所述目的；
<br/>•履行我们在《摩尔共享标签用户协议》或本《隐私政策》中的义务和行使我们的权利；
<br/>•理解、维护和改善我们的服务。
<br/>•根据法律法规的规定及商业惯例，接受第三方的审计或尽职调查时，可能向其提供您的相关信息。
<br/>•根据法律法规的规定或行政机关、司法机构等有权机关要求，向其提供您的相关信息。
<br/>如我们或我们的关联公司与任何上述第三方分享您的个人信息，我们将努力确保该等第三方在使用您的个人信息时遵守本《隐私政策》及我们要求其遵守的其他适当的保密和安全措施。
<br/>•随着我们业务的持续发展，我们以及我们的关联公司有可能进行合并、收购、资产转让或类似的交易，您的个人信息有可能作为此类交易的一部分而被转移。我们将在转移前通知您。
<br/>•我们或我们的关联公司还可能为以下需要而保留、保存或披露您的个人信息：
<br/>•遵守适用的法律法规；
<br/>•遵守法院命令或其他法律程序的规定；
<br/>•遵守相关政府机关的要求；
<br/>•为遵守适用的法律法规、维护社会公共利益，或保护我们的客户、我们或我们的集团公司、其他用户或雇员的人身和财产安全或合法权益所合理必需的用途。
<br/>12.6信息安全保护
<br/>我们仅在本《隐私政策》所述目的所必需的期间和法律法规要求的时限内保留您的个人信息。
我们使用各种安全技术和程序，以防信息的丢失、不当使用、未经授权阅览或披露。例如，在某些服务中，我们将利用数据传输加密（例如SSL）、数据存储加密来保护您提供的个人信息。摩尔的供应商、合作伙伴或其他摩尔第三方服务商将受到保密协议的约束，同时还将受到数据信息的权限控制和操作监控。但摩尔无法保证前述第三方一定会按照我们的要求采取保密措施，我们亦不对第三方的行为及后果承担任何责任，而且请您理解，由于技术的限制以及可能存在的各种恶意手段，在互联网行业，即便竭尽所能加强安全措施，也不可能始终保证信息百分之百的安全，任何安全系统都存在可能的及未知的风险。您需要了解，您接入我们的服务所用的系统和通讯网络，有可能因我们可控范围外的因素而出现问题。作为用户，您可根据您的意愿决定是否使用摩尔共享标签的服务，以及是否主动提供您的信息。
<br/>12.7您分享的敏感个人信息
某些个人信息因其特殊性可能被认为是敏感个人信息，例如您的种族、宗教、个人健康和医疗信息等。相比其他个人信息，敏感个人信息受到更加严格的保护。
请注意，您在使用我们的服务时所提供、上传或发布的内容和信息（例如有关您社交活动的照片等信息），可能会泄露您的敏感个人信息。您需要谨慎地考虑，是否在使用我们的服务时披露相关敏感个人信息。
您同意按本《隐私政策》所述的目的和方式来处理您的敏感个人信息。
<br/>12.8我们可能向您发送的邮件和信息
<br/>邮件和信息推送
您在使用我们的服务时，我们可能使用您的信息向您的设备发送电子邮件、新闻或推送通知。如您不希望收到这些信息，可以按照我们的相关提示，在设备上选择取消订阅。
<br/>与服务有关的公告
<br/>我们可能在必要时（例如因系统维护而暂停某一项服务时）向您发出与服务有关的公告。您可能无法取消这些与服务有关、性质不属于推广的公告。
<br/>12.9隐私政策的适用例外
<br/>我们的服务可能包括或链接至第三方提供的社交媒体或其他服务（包括网站）。例如：
<br/>•您利用“分享”键将某些内容分享到我们的服务，或您利用第三方连线服务登录我们的服务。这些功能可能会收集您的相关信息（包括您的日志信息），并可能在您的电脑装置cookies，从而正常运行上述功能；
<br/>•我们通过广告或我们服务的其他方式向您提供链接，使您可以接入第三方的服务或网站。
该等第三方社交媒体或其他服务可能由相关的第三方或我们运营。您使用该等第三方的社交媒体服务或其他服务（包括您向该等第三方提供的任何个人信息），须受该第三方的服务条款及隐私政策（而非《通用服务条款》或本《隐私政策》）约束，您需要仔细阅读其条款。本《隐私政策》仅适用于我们所收集的信息，并不适用于任何第三方提供的服务或第三方的信息使用规则，我们对任何第三方使用由您提供的信息不承担任何责任。
<br/>12.10隐私政策的适用范围
除某些特定服务外，我们所有的服务均适用本《隐私政策》。这些特定服务将适用特定的隐私政策。针对某些特定服务的特定隐私政策，将更具体地说明我们在该等服务中如何使用您的信息。该特定服务的隐私政策构成本《隐私政策》的一部分。如相关特定服务的隐私政策与本《隐私政策》有不一致之处，适用该特定服务的隐私政策。
除本《隐私政策》另有规定外，本《隐私条款》所用词语将与《用户使用协议》所定义的词语具有相同的涵义。
请您注意，本《隐私政策》不适用于以下情况：
<br/>•通过我们的服务而接入的第三方服务（包括任何第三方网站）收集的信息；
<br/>•通过在我们服务中进行广告服务的其他公司或机构所收集的信息。
<br/>12.11变更
<br/>我们可能适时修订本《隐私政策》的条款，该等修订构成本《隐私政策》的一部分。如该等修订造成您在本《隐私政策》下权利的实质减少，我们将在修订生效前通过在主页上显著位置提示或向您发送电子邮件或以其他方式通知您。在该种情况下，若您继续使用我们的服务，即表示同意受经修订的本《隐私政策》的约束。
  			</div>
  			<div style="width: 100%;height: 10%;margin-top: 0.2rem;font-size: 0.125rem;color: #004098">
  				<span onclick="closeAgreeInfo()">我知道了</span>
  			</div>
  		</div>
  </div>
  
  <script src="${path}plf/page/mlabel/page/mobile/js/jquery-1.8.0.min.js"></script> 
  <script>
  	$(function(){
  		
  	});
	function showAgreeInfo(){
		$(".mui-popup-in").show();
		$("#disgreeInfo").attr("src","${path}plf/page/mlabel/page/mobile/img/ico-agree.png");
		$("#submitInfo").css("background-color","#004098");
		
	}
	function closeAgreeInfo(){
		$(".mui-popup-in").hide();
	}
	//下一步验证
	function openNextPage(){
		var srcImg=$("#disgreeInfo").attr("src");
		if((srcImg.indexOf("ico-agree.png")>0)){
			submitInfo();
		}
		
	}
	//服务端验证密码
	function validatePhoneService(){
		var temp=false;
		if(validatePhone()){
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=valRegister&method=valRegCode&ytype=1",
				data : {
					phone:$("#phoneNumber").val()
				},
				dataType : "json",
				async: false,
				success : function(data) {
					if(data.checkPhoneRes=="NG"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("手机账号已注册");
					}else if(data.checkPhoneRes=="OK"){
						temp=true;
						$("#errorDiv").hide();
				 		$("#yesDiv").show();
						
					}else if(data.checkPhoneRes=="ZERO"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("手机号不能为空");
					}
					
					
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
		}
		return temp;
	}
	
	//验证手机号码 
		function validatePhone(){
		 var Reg = /^((1[3,5,8][0-9])|(14[5,7])|(17[0,6,7,8])|(19[7]))\d{8}$/;
		 	if($("#phoneNumber").val()==""){
		 		$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("手机号不为空");
		 		return false;
		 	}
		 	
		 	if(Reg.test($('#phoneNumber').val())){
		 		return true;
		 		
		 	}else{
		 		$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("手机号格式不正确");
		 		return false;	
		 	}
		 	
			
		}
		//验证密码
		function validatePassWord(){
			if($("#password").val()==""){
				$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("密码不为空");
		 		return false;
		 		
			}else if($("#password").val().length<6||$("#password").val().length>15){
				$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("密码应该为6-15位字符组成");
		 		return false;
			}else if(($("#nextPassword").val()!="")&&($("#nextPassword").val()!=$("#password").val())){
				$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("两次密码不一致");
			}
			else {
				$("#errorDiv").hide();
		 		$("#yesDiv").show();
				return true;
			}
		}
		//验证二次密码
		function validateNextPassword(){
			 if($("#nextPassword").val()==""){
				$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("确认密码不为空");
		 		return false;
				
			}else if($("#nextPassword").val()!=$("#password").val()){
				$("#errorDiv").show();
		 		$("#yesDiv").hide();
		 		$("#errorContexnt").html("两次密码不一致");
		 		return false;
			}else{
				$("#errorDiv").hide();
		 		$("#yesDiv").show();
				return true;
			}
		}
		var tempNote=1;
		var countdown=60; 
		//发送短信
		function sendMessageInfo(val){
			var phoneValidate=validatePhoneService();
			if(!phoneValidate){
				return false;
				
			}
			var passwordValidate=validatePassWord();
			if(!passwordValidate){
				return false;
			}
			
			var nextPasswordValidate=validateNextPassword();
			if(!nextPasswordValidate){
				return false;
			}
			if(tempNote!=1){
				return false;
			}
			if(phoneValidate){
				sendNoteMessage(val); 
				
			}
			
		}
		
		
		function settime(val) {
		if (countdown == 0) { 
		val.removeAttribute("disabled"); 
		$("#textNote").html("获取验证码");
		countdown = 60; 
		tempNote=1;
		} else { 
		val.setAttribute("disabled", true); 
		$("#textNote").html("重新获取(" + countdown + ")");
		tempNote=2;
		countdown--; 
		
		setTimeout(function() { 
		settime(val) 
		},1000) 
		} 
		} 
		
		
		
		//发送验证码
		function sendNoteMessage(val){
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=sendMsg&method=senMsgfunc",
				data : {
					phone:$("#phoneNumber").val()
				},
				dataType : "json",
				success : function(data) {
					if(data.checkoutRes=="NO"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("1分钟内只能发送一条短信");
					}else if(data.checkoutRes=="OVER"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("发送验证码最多支持5条/小时 ，累计10条/24小时");
					}else{
						settime(val);
					}
				},
				error : function(data) {
					alert("系统错误！");
				}
			});
		}
	
	//提交信息验证
	function submitInfo(){
		var phoneValidate=validatePhoneService();
		if(!phoneValidate){
			return false;
			
		}
		var passwordValidate=validatePassWord();
		if(!passwordValidate){
			return false;
		}
		
		var nextPasswordValidate=validateNextPassword();
		if(!nextPasswordValidate){
			return false;
		}
		if(phoneValidate&&passwordValidate&&nextPasswordValidate){
			$.ajax({
				type : "post",
				url : "${path}http/interface.ms?model=valRegister&method=valRegCode&ytype=2",
				data : {
					phone:$("#phoneNumber").val(),
					pwd:$("#password").val(),
					msgCode:$("#noteMessage").val()
				},
				dataType : "json",
				success : function(data) {
					var checkoutNextRes=data.checkoutNextRes;
					if(checkoutNextRes=="SNULL"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("请获取验证码");
					}else if(checkoutNextRes=="NULL"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("请输入验证码");
					}else if(checkoutNextRes=="OK"){
						localStorage.telePhone=$("#phoneNumber").val();
						window.open("${path}buss/bussModel.ms?exeid=da94f134fe4d49f996e1bbe5e4d5d862&FUNC_CODE=F7006","_self");
					}else if(checkoutNextRes=="UNEG"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("验证码不正确");
					}else if(checkoutNextRes=="OVERTIME"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("验证码已失效");
					}else if(checkoutNextRes=="UNEX"){
						$("#errorDiv").show();
		 				$("#yesDiv").hide();
		 				$("#errorContexnt").html("验证码不存在");
					}
					
				},
				error : function(data) {
					alert("系统错误！");
				}
			});	
		}
	}
	//聚焦鼠标的时候
	function onfouceInfo(){
		$("#errorDiv").hide();
		$("#yesDiv").show();
		
	}	
	//隐藏，xx
	function hideAgreeInfo(){
		$(".mui-popup-in").hide();
		$("#disgreeInfo").attr("src","${path}plf/page/mlabel/page/mobile/img/ico-disgree.png");
		$("#submitInfo").css("background-color","#cccccc");
	}
		
	</script>  
 </body>
</html>