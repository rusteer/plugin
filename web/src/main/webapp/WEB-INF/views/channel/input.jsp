<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<style type="text/css">
.bodytext {
	FONT-SIZE: 10pt;
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.macnotes {
	FONT-SIZE: 8pt;
	FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
}
.buttontext {
	FONT-SIZE: 9pt;
	FONT-FAMILY: Verdana, Arial, Helvetica, San-serif
}
.loginboxtext {
	FONT-SIZE: 10pt;
	FONT-FAMILY: Verdana, Arial, Helvetica, San-serif
}
.pluslink {
	FONT-SIZE: 10pt;
	FONT-FAMILY: Verdana, Arial, Helvetica, San-serif
}
</style>
<form action="${login}" method="post">
	<table width="180" align="center" border="0" cellpadding="3" cellspacing="0">
		<tr>
			<td bgcolor="#004f4f"><font size="2" color="#ffffff" face="Verdana, Arial, Helvetica, sans-serif"><b>&nbsp;&nbsp;&nbsp;Login</b> </font></td>
		</tr>
		<tr>
			<td bgcolor="#eeeeee">
				<table width="80%" align="center">
					<tbody>
						<tr height="30"><td class="loginboxtext" colspan="2" valign="bottom">用户名:</td></tr>
						<tr><td colspan="2"><input name="name"  maxsize="64" value="${param.name}"></td></tr>
						<tr height="10"><td class="loginboxtext" colspan="2" valign="bottom">密码:<br></td></tr>
						<tr><td colspan="2"><input name="password"  type="password" value="${param.value}"><br></td></tr>
						<tr height="10"><td class="loginboxtext" colspan="1" valign="bottom">验证码:<br></td><td><a href="#"><img onclick="this.src='${randomchar}'" id="vCmp" src="${randomchar}"/></a></td></tr>
						<tr><td colspan="2"><input name="randomChar"  type="password"><br></td></tr>						
						<tr height="40"> <td></td> <td align="right"><input class="buttontext" value="Login" name="login" type="submit"></td></tr>
					</tbody>
				</table>
			</td>
		</tr>
	</table>
	<div style="color:red;" align=center>${errorMsg}</div>
</form>
