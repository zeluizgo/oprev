/*
 * Odontoprev Portal
 * Created on 08/10/2003 09:29:46
 * 
 * Developed by Modem Media do Brasil Ltda.
 */
package com.odontoprev.portal.taglib.xsl;

import java.io.IOException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import com.modemmedia.core.util.XSLTImpl;
import com.modemmedia.core.util.XSLTImplException;
import com.odontoprev.portal.exception.GeneralException;
import com.odontoprev.portal.security.AuthHandler;
import com.odontoprev.portal.security.UserSession;

/**
 * Classe que encapsula o acesso a Bean de XSLT o tratamento da saída dos dados.
 * 
 * @author jgoncalves
 * Created on 25/09/2003 11:57:57
 */
public class XSLTransform extends TagSupport {

	private String section;
	private String xml;
	private String part;
	final String CONTEXT_ENV = "java:comp/env";
	final String RESOURCE = "repository";

	/**
	 * Contrutor da classe.
	 * 
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 11:57:57
	 */
	public XSLTransform() {
		super();
	}
	
	/* (non-Javadoc)
	 * @see javax.servlet.jsp.tagext.Tag#doStartTag()
	 */
	public int doStartTag() throws JspException {
		// Logger logger = Logger.getLogger(this.getClass());
		JspWriter out = this.pageContext.getOut();
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		UserSession userSession = AuthHandler.getUserSession(request);
		boolean canAccess = false;
		if(request.getParameter("d") == null)
		{
			if(userSession.isLogged())
			{
				canAccess = true;
				setSection(userSession.getUserType().toLowerCase());			
			}
			else
			{
				setSection("ass");
			}
		}
		else
		{
			if(userSession.isLogged())
			{
				if(request.getParameter("d").equals(userSession.getUserType()))
				{
					canAccess = true;
					setSection(userSession.getUserType());				
				}
				else if(request.getParameter("d").equals("par"))
				{
					if(userSession.isCorretor() || userSession.isDistribuidor() || userSession.isOperador())
					{
						canAccess = true;
						setSection(userSession.getUserType());												
					}
				}
				else
				{
					setSection(request.getParameter("d"));					
				}
			}
			else
			{
				setSection(request.getParameter("d"));			
			}
		}
		
		if(userSession.isLogged()) {
			if(userSession.getDisplayName() == null)
			{
				String stNome = userSession.getUser() == null ? "usuário" : (userSession.getUser()).getNome().toLowerCase();
				int iAux = stNome.indexOf(" ");
				if(iAux > 0)
				{
					stNome = stNome.substring(0,1).toUpperCase() + stNome.substring(1,iAux);
				}
				else
				{
					stNome = stNome.substring(0,1).toUpperCase() + stNome.substring(1);
				}
				userSession.setDisplayName(stNome);
			}
		}
		
		if(getXml() == null)
		{
			if(request.getParameter("m") == null)
			{
				setXml("classes.home");
			}
			else
			{
				setXml("classes." + request.getParameter("m"));
			}
		}
		
		Context initCtx;
		Context envCtx;
		String repository_directory;
		try {
			initCtx = new InitialContext();
			envCtx = (Context) initCtx.lookup(CONTEXT_ENV);
			repository_directory = (String) envCtx.lookup(RESOURCE);
			StringBuffer sb = new StringBuffer();
			sb.append(repository_directory);
			sb.append(getSection());
			sb.append("-section/");
			sb.append(getXml().replace('.','/'));
			sb.append(".xml");
			String xmlpath = sb.toString();
			// logger.debug(sb.toString());
			sb = new StringBuffer();
			sb.append(repository_directory);
			sb.append("global/style/");
			sb.append(getPart());
			sb.append(".xsl");
			String xslpath = sb.toString();
			out.println(XSLTImpl.transform(xmlpath,xslpath,new Object[] {getSection(),new Boolean(userSession.isLogged()), getPart(), userSession.getDisplayName(), new Boolean(canAccess)} ));

			setXml(null);				
		} catch (XSLTImplException e1) {
			throw new JspException(e1);
		} catch (NamingException e) {
			Object[] obj = {CONTEXT_ENV , RESOURCE};
			throw new JspException(new GeneralException(e,"error.envnaming",obj, this.getClass()));
		} catch (IOException e) {
			Object[] obj = {CONTEXT_ENV , RESOURCE};
			throw new JspException(new GeneralException(e,"error.envnaming",obj, this.getClass()));
		}
		return Tag.SKIP_BODY;
	}

	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append("TagSupport is: ");
		sb.append("section=");
		sb.append(getSection());
		sb.append(";xml=");
		sb.append(getXml());
		sb.append(";part=");
		sb.append(getPart());
		return sb.toString();
	}

	/**
	 * Método acessor do atributo xml, retorna o seu valor.
	 * @return pseudonimo da xml do conteúdo.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public String getXml() {
		return xml;
	}

	/**
	 * Método acessor do atributo part, retorna o seu valor.
	 * @return identificador da parte do leiaute a que ele se refere.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public String getPart() {
		return part;
	}

	/**
	 * Método acessor do atributo section, retorna o seu valor.
	 * @return o identificador da seção que está sendo montada.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public String getSection() {
		return section;
	}

	/**
	 * Método acessor do atributo xml, seta o seu valor.
	 * @param string classe que referencia o conteudo que será montado.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public void setXml(String string) {
		xml = string;
	}

	/**
	 * Método acessor do atributo part, seta o seu valor.
	 * @param string identificador da parte do leiaute que será montada.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public void setPart(String string) {
		part = string;
	}

	/**
	 * Método acessor do atributo section, seta o seu valor.
	 * @param string identificador da section do site que está sendo montada.
	 * 
	 * @author jgoncalves
	 * Created on 25/09/2003 12:08:42
	 */
	public void setSection(String string) {
		section = string;
	}
}
