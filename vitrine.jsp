<html>
<head>
<%@ include file="/inc/header_info.jsp" %>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
<table border="0" cellpadding="0" cellspacing="0" align="center" height="100%">
	<tr>
		<td valign="top">
			<jsp:include page="/inc/header.jsp"/>
			<table border="0" cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td height="2" bgcolor="#ffffff" colspan="5"><html:img page="/img/fals.gif" width="1" height="2" border="0"/></td>
				</tr>
				<tr>
					<td width="149" valign="top" background="../img/bg_menu.gif">
					<jsp:include page="/inc/menu.jsp"/>
				</td>
				<td width="2"><html:img page="/img/fals.gif" width="2" height="1" border="0"/></td>
				<td width="421" valign="top">
				<jsp:include page="/inc/welcome.jsp"/>
						<html:img page="/img/fals.gif" width="1" height="2" border="0"/><br>
			<%/**
			  * Inserção da área superior-central.
			  * Em especial esta área contém o menu superior o site .. ou quando logado, a saudação ao cliente.
			  */%>
			<mm:transform part="center-area" />					
						<html:img page="/img/fals.gif" width="1" height="2" border="0"/><br>
						<table border="0" cellpadding="0" cellspacing="0" width="100%">
							<tr>
								<td bgcolor="<bean:write name="colortheme" />"><html:img page="/img/fals.gif" width="1" height="6" border="0"/></td>
							</tr>				
						</table>
						
						<jsp:include page="/inc/rodape.jsp"/>
						<br>
					</td>
					<td width="2"><html:img page="/img/fals.gif" width="2" height="1" border="0"/></td>
					<td width="175" valign="top" bgcolor="#E6E6E6" align="center"><html:img page="/img/fals.gif" width="1" height="7"/><br>
			 		<jsp:include page="/inc/seuespaco.jsp" flush="true"/></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>