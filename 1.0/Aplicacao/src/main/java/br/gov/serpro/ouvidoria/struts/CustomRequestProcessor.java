/*
 * Sistema de Ouvidoria: um canal através do qual os usuários
 * podem encaminhar suas reclamações, elogios e sugestões.
 * 
 * Copyright (C) 2011 SERPRO
 * 
 * Este programa é software livre; você pode redistribuí-lo e/ou
 * modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 * publicada pela Free Software Foundation; tanto a versão 2 da
 * Licença como (a seu critério) qualquer versão mais nova.
 * 
 * Este programa é distribuído na expectativa de ser útil, mas SEM
 * QUALQUER GARANTIA; sem mesmo a garantia implícita de
 * COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 * PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 * detalhes.
 * 
 * Você deve ter recebido uma cópia da Licença Pública Geral GNU,
 * sob o título "LICENCA.txt", junto com esse programa. Se não,
 * acesse o Portal do Software Público Brasileiro no endereço
 * http://www.softwarepublico.gov.br/ ou escreva para a Fundação do
 * Software Livre (FSF) Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02111-1301, USA.
 * 
 * Contatos através do seguinte endereço internet:
 * http://www.serpro.gov.br/sistemaouvidoria/
 */
package br.gov.serpro.ouvidoria.struts;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.RequestProcessor;
import org.quartz.SchedulerException;

import br.gov.serpro.ouvidoria.agendador.OuvidoriaScheduler;
import br.gov.serpro.ouvidoria.bean.LayoutBean;
import br.gov.serpro.ouvidoria.bean.OrgaoDto;
import br.gov.serpro.ouvidoria.controller.ControleAcessoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.util.Constants;

/**
  * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:34 $
 * @version 0.1, Date: 11/11/2004
 */
public class CustomRequestProcessor extends RequestProcessor {

	protected final DaoFactory daoFactory = new HibernateDaoFactory();
	protected Logger log = null;


	public void process(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		Orgao orgao = null;
		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		// Instancia a sessao
		HttpSession session = request.getSession(true);

		boolean flagPesquisa = false;

		// se houverem dados de pesquisa na sessao entao starta o flag
		if (session.getAttribute("possuiPesquisa") != null) {
			if (session.getAttribute("possuiPesquisa").equals("sim")) {
				flagPesquisa = true;
			}
		}

		if (flagPesquisa) {

			int caminho = 0;

			// qq um desses links preservam os dados da sessao
			if ((request.getServletPath()
					.equals("/andamento/ExibeMsgPorRespons.do"))
					|| (request.getServletPath()
							.equals("/andamento/ConsultaSolucoes.do"))
					|| (request.getServletPath()
							.equals("/andamento/ConsultarBancoScriptsMsg.do"))
					|| (request.getServletPath()
							.equals("/andamento/RedirecionarMensagem.do"))
					|| (request.getServletPath()
							.equals("/andamento/ReclassificarMensagem.do"))
					|| (request.getServletPath()
							.equals("/andamento/ConfirmaResposta.do"))
					|| (request.getServletPath()
							.equals("/andamento/RespondeAcionamento.do"))
					|| (request.getServletPath()
							.equals("/andamento/ConsultaMsgPorRespons.do"))
					|| (request.getServletPath()
							.equals("/andamento/SalvaRascunhoResp.do"))
					|| (request.getServletPath()
							.equals("/andamento/ListaMsgPorRespons.do"))
					|| (request.getServletPath()
							.equals("/andamento/ConfirmaRedirecionarMensagem.do"))

			) {
				caminho = 1;
			}

			switch (caminho) {
			case 0:
				// caso saia da tela, então a sessao é limpa
				limpaSessao(request, session);
				break;
			case 1:
				break;
			}
		}

		// obter o ID da sessão
		String orgaoSessionId = request.getParameter(Constants.ID_SESSAO_ORGAO);
		if (orgaoSessionId == null) {

			// verificar se a sessão expirou
			if (request.getSession() == null) {
				doForward(Constants.LOGIN_EXPIRED_ACTION, request, response);
				return;
			}

			// tentar obter o ID do atributo correspondente na sessão
			orgaoSessionId = (String) request.getSession().getAttribute(
					Constants.ID_SESSAO_ORGAO);

			// se não achou o ID no atributo da sessão, procurar pelo cookie
			if (orgaoSessionId == null) {
				Cookie[] cookies = request.getCookies();
				for (int i = 0; (cookies != null && i < cookies.length); i++) {
					Cookie cookie = cookies[i];
					if (cookie.getName().equals(Constants.ID_SESSAO_ORGAO)) {
						orgaoSessionId = cookie.getValue();

					}
				}
			}
		}

		// se não obteve o ID, redirecionar o usuário para página adequada
		if (orgaoSessionId == null) {
			doForward(Constants.NOT_FOUND_PAGE, request, response);
			return;
		}

		// obter o órgão
		orgao = orgaoCtrl.get(orgaoSessionId);
		if (orgao == null) {
			doForward(Constants.NOT_FOUND_PAGE, request, response);
			return;
		}

		/* adiciono o sessionId na sessão */
		HttpSession ses = request.getSession(true);
		ses.setAttribute(Constants.ID_SESSAO_ORGAO, orgaoSessionId);

		ses.setAttribute("_ORGAO_", new OrgaoDto(orgao));

		/* adiciono um cookie com o id do orgão */
		if (orgaoSessionId != null) {
			Cookie cookie = new Cookie(Constants.ID_SESSAO_ORGAO,
					orgaoSessionId);
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		/*
		 * adiciono um cookie com um identificador único para verificação do
		 * timeout da sessão
		 */
		if (request.getSession().getAttribute(Constants.PA_FUNCIONARIO) != null) {
			Cookie cookie = new Cookie(Constants.PA_EXPIRE, String
					.valueOf(System.currentTimeMillis()));
			cookie.setPath("/");
			response.addCookie(cookie);
		}

		/* adiciono o layout à sessão */
		setOrgaoLayout(request, orgao);

		try {

			ConfiguracoesOrgao configuracaoes = orgao.getConfiguracoes();
			request.setAttribute("configuracoes", configuracaoes);

			if (configuracaoes.getNotificacaoEmail() != null
					&& configuracaoes.getNotificacaoEmail().equals("S")) {

				if ((OuvidoriaScheduler.sched == null)
						|| (OuvidoriaScheduler.sched != null && !OuvidoriaScheduler.sched
								.isStarted())) {

					OuvidoriaScheduler.init(request);

				}
			}

		} catch (SchedulerException se) {

			se.printStackTrace();

		} catch (Exception e) {

			e.printStackTrace();
		}

		super.process(request, response);
	}

	/**
	 * @param request
	 * @param orgao
	 */
	private void setOrgaoLayout(HttpServletRequest request, Orgao orgao) {

		LayoutBean layoutBean = (LayoutBean) request.getSession().getAttribute(
				Constants.SS_LAYOUT);

		if (layoutBean == null) {
			layoutBean = new LayoutBean();
		}

		layoutBean.setDiretorioOrgao(orgao.getConfiguracoes()
				.getNomeDiretorioOrgao());

		layoutBean.setEsquemaCores("estilos/".concat(orgao.getConfiguracoes()
				.getEsquemaCoresLayout()));

		layoutBean.setCorCabecalhoBanner(orgao.getConfiguracoes()
				.getCorCabecalhoBanner());

		layoutBean.setCorCabecalhoLogo(orgao.getConfiguracoes()
				.getCorCabecalhoLogo());

		layoutBean.setImagem3("/"
				+ orgao.getConfiguracoes().getNomeDiretorioOrgao() + "/images/"
				+ orgao.getConfiguracoes().getImagem3());

		layoutBean.setImagem4("/"
				+ orgao.getConfiguracoes().getNomeDiretorioOrgao() + "/images/"
				+ orgao.getConfiguracoes().getImagem4());

		layoutBean.setImagem5("/"
				+ orgao.getConfiguracoes().getNomeDiretorioOrgao() + "/images/"
				+ orgao.getConfiguracoes().getImagem5());

		layoutBean.setImagemBanner("/"
				+ orgao.getConfiguracoes().getNomeDiretorioOrgao() + "/images/"
				+ orgao.getConfiguracoes().getImagemBanner());

		layoutBean.setImagemLogo("/"
				+ orgao.getConfiguracoes().getNomeDiretorioOrgao() + "/images/"
				+ orgao.getConfiguracoes().getImagemLogo());

		layoutBean.setDescricaoImagem3(orgao.getConfiguracoes()
				.getDescricaoImagem3());

		layoutBean.setDescricaoImagem4(orgao.getConfiguracoes()
				.getDescricaoImagem4());

		layoutBean.setDescricaoImagem5(orgao.getConfiguracoes()
				.getDescricaoImagem5());

		layoutBean.setDescricaoImagemBanner(orgao.getConfiguracoes()
				.getDescricaoImagemBanner());

		layoutBean.setDescricaoImagemLogo(orgao.getConfiguracoes()
				.getDescricaoImagemLogo());

		layoutBean.setLinkImagem3(orgao.getConfiguracoes().getLinkImagem3());

		layoutBean.setLinkImagem4(orgao.getConfiguracoes().getLinkImagem4());

		layoutBean.setLinkImagem5(orgao.getConfiguracoes().getLinkImagem5());

		layoutBean.setLinkImagemBanner(orgao.getConfiguracoes()
				.getLinkImagemBanner());

		layoutBean.setLinkImagemLogo(orgao.getConfiguracoes()
				.getLinkImagemLogo());

		layoutBean.setNomeExibicaoOrgao(orgao.getConfiguracoes()
				.getNomeExibicaoOrgao());

		request.getSession().setAttribute(Constants.SS_LAYOUT, layoutBean);
	}

	/**
	 * @param request
	 * @param session
	 */

	private void limpaSessao(HttpServletRequest request, HttpSession session) {

		session.removeAttribute("chkpend");
		session.removeAttribute("chkand");
		session.removeAttribute("chkatraso");
		session.removeAttribute("chkcritico");
		session.removeAttribute("txtDatIni");
		session.removeAttribute("txtDatFim");
		session.removeAttribute("txtTipoMsg");
		session.removeAttribute("txtAssunto");
		session.removeAttribute("txtTitulo");
		session.removeAttribute("ordenacao");
		session.removeAttribute("txtProtocolo");
		session.removeAttribute("possuiPesquisa");

	}

	protected boolean processRoles(HttpServletRequest request,
			HttpServletResponse response, ActionMapping mapping)
			throws IOException, ServletException {

		String role = null;

		ArrayList regras = new ArrayList();

		/*
		 * Trecho responsável por pegar as regras de acesso definidas no Struts
		 * Este tratamento foi feito para permitir/restringir acesso a mais de
		 * uma opção por url. No caso Reclassificar Assunto e Mensagem através
		 * da url reclassificar
		 */
		if (mapping.getRoles() != null) {

			String[] roles = mapping.getRoles().split(",");

			for (int cont = 0; cont < roles.length; cont++) {

				try {

					new Long(roles[cont]);

				} catch (Exception e) {

					e.printStackTrace();
					throw new ServletException(
							"Código de regra de acesso inválido.");
				}

				regras.add(roles[cont]);
				role = (String) regras.get(0);// Pega a primeira regra(role)
			}
		}

		OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

		/* Não existe bloqueio para esta acão */
		if (role == null || role.trim().length() == 0) {
			return true;
		}

		request.setAttribute(Constants.SR_FUNCIONALIDADE, role);

		/*Coloca a funcionalidade na sessão para
		 * ser recuperada na tela de ajuda
		 */
		request.getSession().setAttribute(Constants.SR_FUNCIONALIDADE, role);

		ControleAcessoCtrl controleAcessoCtrl = new ControleAcessoCtrl(
				daoFactory);

		Orgao orgao = orgaoCtrl.get((String) request.getSession().getAttribute(
				Constants.ID_SESSAO_ORGAO));

		/* verifico a vigência do órgão para acionamento e consulta resposta */
		String redirect = null;

		int vigenciaOrgao = controleAcessoCtrl.verificaVigenciaOrgao(orgao,
				role);

		switch (vigenciaOrgao) {
		case ControleAcessoCtrl.VG_FORA_PERIODO_ACIONAMENTO:
			redirect = Constants.CAD_ACNMNT_FORA_VIGENCIA_PAGE;
			break;
		case ControleAcessoCtrl.VG_FORA_PERIODO_CONSULTA_RESPOSTA:
			redirect = Constants.CON_RESPTA_FORA_VIGENCIA_PAGE;
			break;
		case ControleAcessoCtrl.VG_FORA_PERIODO_OPERACAO:
			redirect = Constants.CAD_OPERACAO_FORA_VIGENCIA_PAGE;
			break;
		default:
			// DO NOTHING
		}

		if (redirect != null) {

			controleAcessoCtrl = null;

			/* retiro o controle do struts */
			doForward(redirect, request, response);
			return false;
		}

		/* verifico o acesso do funcionario ao sistema */
		int possuiAcesso = ControleAcessoCtrl.CA_NECESSARIO_LOGIN;

		try {

			Long funcionarioId = (Long) request.getSession().getAttribute(
					Constants.PA_FUNCIONARIO);

			FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(daoFactory);

			Funcionario funcionario = (Funcionario) funcionarioCtrl
					.get(funcionarioId);

			possuiAcesso = controleAcessoCtrl.permiteAcesso(orgao, funcionario,
					regras);

		} catch (DaoException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

			throw new ServletException(e);
		}

		redirect = Constants.LOGIN_ACTION;

		switch (possuiAcesso) {
		case ControleAcessoCtrl.CA_ACESSO_PERMITIDO:
			request.getSession().setAttribute(Constants.SR_FUNCIONALIDADES,
					regras);
			return true;
		case ControleAcessoCtrl.CA_ACESSO_NEGADO:
			redirect = Constants.DENIED_ACCESS_ACTION;
			break;
		case ControleAcessoCtrl.CA_NECESSARIO_LOGIN:
			redirect = Constants.LOGIN_ACTION;
			break;
		case ControleAcessoCtrl.VG_FORA_PERIODO_OPERACAO:
			redirect = Constants.CAD_OPERACAO_FORA_VIGENCIA_PAGE;
			break;
		default:
			redirect = Constants.LOGIN_ACTION;
		}

		controleAcessoCtrl = null;

		/* retiro o funcionario da sessão */
		request.getSession().removeAttribute(Constants.PA_FUNCIONARIO);

		/* retiro o controle do struts */
		doForward(redirect, request, response);

		return false;
	}

	protected Action processActionCreate(HttpServletRequest request,
			HttpServletResponse response, ActionMapping mapping)
			throws IOException {

		Action instance = super.processActionCreate(request, response, mapping);
		if (instance instanceof Support) {
			((Support) instance).setDaoFactory(daoFactory);
		}
		return (instance);
	}

	protected Logger getLog() {

		if (this.log == null) {
			this.log = Logger
					.getLogger("<------ Processador de Requisições ------> ");
		}
		return this.log;
	}

}