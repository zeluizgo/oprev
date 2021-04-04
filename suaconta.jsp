<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<tr>
	<td bgcolor="#596FAC" height="22" class="textobranco">&nbsp;&nbsp;<html:img page="/img/bullet_lateral.gif" width="5" height="5" border="0" vspace="1" hspace="2"/>&nbsp;<b>SUA CONTA</b></td>
</tr>
<tr>
	<td bgcolor="#ffffff"><html:img page="/img/fals.gif" width="1" height="2"/></td>
</tr>
<tr>
	<td bgcolor="#B2CBE4">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td colspan="3" height="3"><html:img page="/img/fals.gif" width="1" height="3"/></td>
			</tr>
			<tr>
				<td nowrap width="7"><html:img page="/img/fals.gif" width="7" height="1"/></td>
				<td class="textopreto" width="100%">
				<b>
					<c:choose>
						<c:when test="${userSession.dentista}">
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link><br>
									<html:img page="/img/fals.gif" width="1" height="3" border="0"/><br>
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verRecadastramento.do" styleClass="linkpreto">Recadastramento</html:link><br><html:img page="/img/fals.gif" width="1" height="3" border="0"/><br>
									<span>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td class="textobranco"><html:img page="/img/setapreta.gif" imageName="sc11denimgp" styleId="sc11denimgp" width="7" height="7" border="0" align="middle" onclick="expandcontent('sc11den');" />&nbsp;&nbsp;<html:link href="#" styleClass="linkpreto" onclick="expandcontent('sc11den');" style="cursor:hand; cursor:pointer"><b>Pontos</b></html:link></td>
											</tr>
										</table>
									</span>
									<span id="sc11den" class="switchcontent">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/pontuacao/verPontuacao.do" styleClass="linkpreto">Extrato de Pontos</html:link></td>
											</tr>
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link href="#" onclick="window.open('/servico/pontuacao/verSaldoPontos.do','pontuacao','width=620,height=500,top=10,left=10,status=yes');" styleClass="linkpreto">Saldo de Pontos</html:link></td>
											</tr>
										</table>			
									</span>
									<span>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textobranco"><html:img page="/img/setapreta.gif" imageName="sc11denimgp" styleId="sc12denimgp" width="7" height="7" border="0" align="middle" onclick="expandcontent('sc12den');" />&nbsp;&nbsp;<html:link href="#" styleClass="linkpreto" onclick="expandcontent('sc12den');" style="cursor:hand; cursor:pointer"><b>Cadastro de Usuários</b></html:link></td>
											</tr>
										</table>
									</span>
									<span id="sc12den" class="switchcontent">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/usuarios/verCadastraUsuario.do" styleClass="linkpreto">Criação de Usuários</html:link></td>
											</tr>
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/usuarios/verRelacaoUsuario.do" styleClass="linkpreto">Relação de Usuários</html:link></td>
											</tr>
										</table>			
									</span>
					
						</c:when>
						<c:when test="${userSession.empresa}">
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link>
									<br><html:img page="/img/fals.gif" width="1" height="3"/><br>
									<span>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textobranco"><html:img page="/img/setapreta.gif" imageName="sc11empimgp" styleId="sc11empimgp" width="7" height="7" border="0" align="middle" onclick="expandcontent('sc11emp');" />&nbsp;&nbsp;<html:link href="#" styleClass="linkpreto" onclick="expandcontent('sc11emp');" style="cursor:hand; cursor:pointer"><b>Cadastro de Usuários</b></html:link></td>
											</tr>
										</table>
									</span>
									<span id="sc11emp" class="switchcontent">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/usuarios/verCadastraUsuario.do" styleClass="linkpreto">Criação de Usuários</html:link></td>
											</tr>
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/usuarios/verRelacaoUsuario.do" styleClass="linkpreto">Relação de Usuários</html:link></td>
											</tr>
										</table>			
									</span>
									
									
						</c:when>
						<c:when test="${userSession.distribuidor}">
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link>
									<br><html:img page="/img/fals.gif" width="1" height="3"/><br>
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/pontuacao/verBuscaDentista.do" styleClass="linkpreto">Pontos</html:link>
									<br><html:img page="/img/fals.gif" width="1" height="7"/><br>
						</c:when>
						<c:when test="${userSession.operador}">
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link>
									<br><html:img page="/img/fals.gif" width="1" height="7"/><br>
						</c:when>
						<c:when test="${userSession.corretor}">
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link>
									<br><html:img page="/img/fals.gif" width="1" height="7"/><br>
						</c:when>
						<c:otherwise>				
					
									<html:img page="/img/fals.gif" width="7" height="7" border="0"/>&nbsp;&nbsp;<html:link page="/servico/meusdados/verMeusDados.do" styleClass="linkpreto">Meus dados</html:link><br>
									<span>
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textobranco"><html:img page="/img/setapreta.gif" imageName="sc11assimgp" styleId="sc11assimgp" width="7" height="7" border="0" align="middle" onclick="expandcontent('sc11ass');" />&nbsp;&nbsp;<html:link href="#" styleClass="linkpreto" onclick="expandcontent('sc11ass');" style="cursor:hand; cursor:pointer"><b>Prontuário Virtual</b></html:link></td>
											</tr>
										</table>
									</span>
									<span id="sc11ass" class="switchcontent">
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/prontuario/verProntuario.do" styleClass="linkpreto">Extrato de verificação</html:link></td>
											</tr>
											<tr bgcolor="#B2CBE4">
												<td height="20" class="textopreto"><html:img page="/img/fals.gif" width="18" height="1" border="0"/>- <html:link page="/servico/tratamento/verTratamento.do" styleClass="linkpreto">Tratamentos</html:link></td>
											</tr>
										</table>			
									</span>
						</c:otherwise>
					</c:choose>
				</b>
				</td>
			</tr>
			<tr bgcolor="#ffffff">
				<td colspan="2" height="2"><html:img page="/img/fals.gif" width="1" height="2"/></td>
			</tr>
			<tr>
				<td bgcolor="#D1E0EF" colspan="2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td height="53" width="17"><html:img page="/img/fals.gif" width="1" height="1"/></td>
							<td class="textopreto">Espaço reservado para suas informações de acesso rápido.</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr>
	<td bgcolor="#ffffff"><html:img page="/img/fals.gif" width="1" height="2"/></td>
</tr>