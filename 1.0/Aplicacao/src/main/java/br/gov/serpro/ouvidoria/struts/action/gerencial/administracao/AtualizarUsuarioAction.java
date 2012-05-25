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
package br.gov.serpro.ouvidoria.struts.action.gerencial.administracao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.FuncionalidadeCtrl;
import br.gov.serpro.ouvidoria.controller.PerfilCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.SubOrgaoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoAssuntoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.TipoMensagemCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.EstadoAcionamento;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.Perfil;
import br.gov.serpro.ouvidoria.model.PersistentObject;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.model.TipoMensagem;
import br.gov.serpro.ouvidoria.struts.DispatchActionSupport;
import br.gov.serpro.ouvidoria.struts.form.CadastrarFuncionarioForm;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Administrar Usuário
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/10/21 12:51:37 $
 * @version 0.1, 2004/12/27
 */
public class AtualizarUsuarioAction extends DispatchActionSupport {

	/**
	 * Representa a string que é retornada da página quando o a opção
	 * "Consultor?" é marcada na tela.
	 */
	private static final String CONSULTOR_ON = "on";

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.
	 * ActionMapping, org.apache.struts.action.ActionForm,
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward listar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// obter o parâmetro "pchave" do request (chave para pesquisa de
		// funcionário)
		final String pchave = request.getParameter("pchave");

		// obter o funcionário atualmente logado
		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);
		FuncionarioCtrl defaultCtrl = new FuncionarioCtrl(getDaoFactory());
		Funcionario funcionario = (Funcionario) defaultCtrl.get(funcionarioId);

		// consultar os funcionários e colocar a lista de resultados no request
		request.setAttribute("listar",
				defaultCtrl.list(getOrgao(request), funcionario, pchave));

		return mapping.findForward("listar");
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.apache.struts.action.Action#execute(org.apache.struts.action.
	 * ActionMapping, org.apache.struts.action.ActionForm,
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse)
	 */
	public ActionForward exibir(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// obter o funcionário atualmente logado
		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);
		FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
		Funcionario funcionario = (Funcionario) funcionarioCtrl
				.get(funcionarioId);

		final String id = request.getParameter("id");

		Funcionario object = null;
		if (id == null || id.trim().length() == 0) {
			object = new Funcionario();
			object.setListaFuncionalidade(new TreeSet());
			object.setListaAssunto(new TreeSet());
			object.setListaTipoMensagem(new TreeSet());
			object.setSituacao(Funcionario.ATIVO);
			object.setPerfil(Perfil.ATENDENTE);
			object.setInstituicao(getOrgao(request));
			object.setListaInstituicao(new TreeSet());
		} else {
			FuncionarioCtrl defaultCtrl = new FuncionarioCtrl(getDaoFactory());
			object = defaultCtrl.get(new Long(id));
		}

		/*
		 * Os perfis de Ouvidor Geral e Ouvidor Assistente não podem assumir o
		 * papel de Consultor
		 */
		if (object != null && object.getPerfil() != null
				&& object.getPerfil().getId() != null
				&& object.getPerfil().isOuvidor()) {
			object.setConsultor(null);
		}

		Comparator ordem = new Comparator() {
			public int compare(Object obj1, Object obj2) {
				PersistentObject pobj1 = (PersistentObject) obj1;
				PersistentObject pobj2 = (PersistentObject) obj2;
				if (pobj1 != null && pobj1.getDescricao() != null) {
					return pobj1.getDescricao().compareTo(pobj2.getDescricao());
				}
				return 0;
			}
		};

		/* Lista de Sub-órgãos */
		SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
		Collection subOrgaoList = new TreeSet(ordem);

		/* Se funcionário é administrador ou tem nivel de acesso ao órgão */
		if (funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)
				|| funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO)
			subOrgaoList.addAll(subOrgaoCtrl.list(getOrgao(request)));
		else {
			subOrgaoList.addAll(funcionario.getListaSubOrgaosAtivos());
		}

		/* Lista de Perfis */
		PerfilCtrl perfilCtrl = new PerfilCtrl(getDaoFactory());
		Collection perfilList = new TreeSet(ordem);
		perfilList.addAll(perfilCtrl.list());
		if (!funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)) {
			perfilList.remove(Perfil.ADMINISTRADOR);
		}

		/* Lista de Funcionalidades */
		FuncionalidadeCtrl funcionalideCtrl = new FuncionalidadeCtrl(
				getDaoFactory());
		Collection funcionalideList = new TreeSet(ordem);
		funcionalideList.addAll(funcionalideCtrl.list());

		/* Lista de Tipo de Assunto */
		TipoAssuntoCtrl tipoAssuntoCtrl = new TipoAssuntoCtrl(getDaoFactory());
		Collection tipoAssuntoList = new TreeSet(ordem);

		/* Se funcionário é administrador ou tem nivel de acesso ao órgão */
		if (funcionario.getPerfil().equals(Perfil.ADMINISTRADOR)
				|| funcionario.getNivelAtuacao() == Funcionario.NA_ORGAO)
			tipoAssuntoList.addAll(tipoAssuntoCtrl.list(getOrgao(request)));
		else {
			for (Iterator iter = funcionario.getListaSubOrgaosAtivos()
					.iterator(); iter.hasNext();) {
				SubOrgao subOrgao = (SubOrgao) iter.next();
				tipoAssuntoList.addAll(subOrgao.getListaAssunto(Assunto.ATIVO));
			}
		}
		// verifica se o usuário tem acionamentos atrelados a ele

		List listaAcionamento = new ArrayList();

		if (object.getListaAcionamento() != null) {
			for (Iterator iter = object.getListaAcionamento().iterator(); iter
					.hasNext();) {
				Acionamento acionamento = (Acionamento) iter.next();
				if (!(acionamento.getEstadoAcionamento().equals(
						EstadoAcionamento.RESPONDIDO) || acionamento
						.getEstadoAcionamento().equals(
								EstadoAcionamento.ENVIADO))) {
					/*
					 * Caso tenha, ele joga no request para ser verificado na
					 * pagina jsp, e assim lance o aviso para o admin caso ele
					 * mude o perfil do usuario
					 */
					request.setAttribute("temAcionamento", listaAcionamento);
				}
			}
		}

		/* Lista de Tipo Mensagem */
		TipoMensagemCtrl tipoMensagemCtrl = new TipoMensagemCtrl(
				getDaoFactory());
		Collection tipoMesagemList = new TreeSet(ordem);
		tipoMesagemList.addAll(tipoMensagemCtrl.list(getOrgao(request)));

		request.setAttribute("object", object);
		request.setAttribute("function", request.getParameter("function"));

		request.setAttribute("listarPerfil", perfilList);
		request.setAttribute("listarTipoAssunto", tipoAssuntoList);
		request.setAttribute("listarTipoMesagem", tipoMesagemList);

		request.setAttribute("listarInstituicao", subOrgaoList);
		request.setAttribute("listarFuncionalidade", funcionalideList);

		request.setAttribute("funcionario", funcionario);

		return mapping.findForward("exibir");
	}

	public ActionForward salvar(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		// obter o funcionário logado
		FuncionarioCtrl defaultCtrl = new FuncionarioCtrl(getDaoFactory());
		Long funcionarioId = (Long) request.getSession().getAttribute(
				Constants.PA_FUNCIONARIO);
		Funcionario gestor = (Funcionario) defaultCtrl.get(funcionarioId);

		CadastrarFuncionarioForm funcionarioForm = (CadastrarFuncionarioForm) form;

		ActionMessages msgs = funcionarioForm.validate(mapping, request);

		if (!msgs.isEmpty()) {
			saveErrors(request, msgs);
			return mapping.findForward("error");
		}

		boolean erroLogica = false;

		/*
		 * Valida para garantir que Ouvidores (Geral ou Assistente) não estejam
		 * marcados como Consultores
		 */
		if (CONSULTOR_ON.equals(funcionarioForm.getConsultor())
				&& (Perfil.OUVIDOR_ASSISTENTE.getId().equals(
						funcionarioForm.getPerfil()) || Perfil.OUVIDOR_GERAL
						.getId().equals(funcionarioForm.getPerfil()))) {
			funcionarioForm.setConsultor(null);
		}

		if (funcionarioForm.getId() == null
				|| funcionarioForm.getId().intValue() == 0) {
			// INSERT de novo funcionário
			try {
				defaultCtrl.insert(getOrgao(request),
						funcionarioForm.getNome(), funcionarioForm.getLogin(),
						funcionarioForm.getSenha(),
						funcionarioForm.getSituacao(),
						funcionarioForm.getMotivo(),
						funcionarioForm.getPerfil(),
						funcionarioForm.getFuncionalidades(),
						funcionarioForm.getTipoAssunto(),
						funcionarioForm.getTipoMensagem(),
						funcionarioForm.getSubOrgao(),
						funcionarioForm.getLocalidades(),
						funcionarioForm.getNivel(),
						funcionarioForm.getConsultor(),
						funcionarioForm.getEmail());

				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"message.administrarUsuario.incluir"));
			} catch (DaoException e) {

				if (Constants.DEBUG) {
					e.printStackTrace(System.out);
				}

				String errorMessage = e.getMessage();

				if (errorMessage != null
						&& errorMessage.toLowerCase().indexOf("duplicate key") >= 0) {
					erroLogica = true;
					msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.administrarUsuario.chaveDuplicada"));
				}
			}
		} else {
			try {
				// UPDATE de funcionário existente
				defaultCtrl.update(getOrgao(request), gestor,
						funcionarioForm.getId(), funcionarioForm.getNome(),
						funcionarioForm.getLogin(), funcionarioForm.getSenha(),
						funcionarioForm.getSituacao(),
						funcionarioForm.getMotivo(),
						funcionarioForm.getPerfil(),
						funcionarioForm.getFuncionalidades(),
						funcionarioForm.getTipoAssunto(),
						funcionarioForm.getTipoMensagem(),
						funcionarioForm.getSubOrgao(),
						funcionarioForm.getLocalidades(),
						funcionarioForm.getNivel(),
						funcionarioForm.getConsultor(),
						funcionarioForm.getEmail());

				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"message.administrarUsuario.alterar"));

			} catch (DaoException e) {
				if (Constants.DEBUG) {
					e.printStackTrace(System.out);
				}

				String errorMessage = e.getMessage();
				if (errorMessage != null
						&& errorMessage.toLowerCase().indexOf("duplicate key") >= 0) {
					erroLogica = true;
					msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.administrarUsuario.chaveDuplicada"));
				}
			} catch (Exception e) {
				if (Constants.DEBUG) {
					e.printStackTrace(System.out);
				}
				erroLogica = true;
				msgs.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.administrarUsuario.redirecionar"));
			}
		}

		if (erroLogica) {

			PerfilCtrl perfilCtrl = new PerfilCtrl(getDaoFactory());

			Funcionario object = new Funcionario();

			object.setNome(funcionarioForm.getNome());
			object.setLogin(funcionarioForm.getLogin());
			object.setSenha("default");
			object.setSituacao(funcionarioForm.getSituacao());

			object.setListaFuncionalidade(defaultCtrl.listas(
					funcionarioForm.getFuncionalidades(), Funcionalidade.class));
			object.setListaAssunto(defaultCtrl.listas(
					funcionarioForm.getTipoAssunto(), Assunto.class));
			object.setListaTipoMensagem(defaultCtrl.listas(
					funcionarioForm.getTipoMensagem(), TipoMensagem.class));
			object.setSituacao(funcionarioForm.getSituacao());
			object.setPerfil(perfilCtrl.get(funcionarioForm.getPerfil()));
			object.setInstituicao(getOrgao(request));
			object.setListaInstituicao(defaultCtrl.listas(
					funcionarioForm.getSubOrgao(), SubOrgao.class));
			object.setListaLocalidadeOcorrencia(defaultCtrl.listas(
					funcionarioForm.getLocalidades(),
					LocalidadeOcorrencia.class));

			Comparator ordem = new Comparator() {
				public int compare(Object obj1, Object obj2) {
					PersistentObject pobj1 = (PersistentObject) obj1;
					PersistentObject pobj2 = (PersistentObject) obj2;
					if (pobj1 != null && pobj1.getDescricao() != null) {
						return pobj1.getDescricao().compareTo(
								pobj2.getDescricao());
					}
					return 0;
				}
			};

			/* Lista de Sub-órgãos */
			SubOrgaoCtrl subOrgaoCtrl = new SubOrgaoCtrl(getDaoFactory());
			Collection subOrgaoList = new TreeSet(ordem);

			/* Se funcionário é administrador ou tem nivel de acesso ao órgão */
			if (gestor.getPerfil().equals(Perfil.ADMINISTRADOR)
					|| gestor.getListaSubOrgaosAtivos() == null
					|| gestor.getListaSubOrgaosAtivos().isEmpty())
				subOrgaoList.addAll(subOrgaoCtrl.list(getOrgao(request)));
			else {
				subOrgaoList.addAll(gestor.getListaSubOrgaosAtivos());
			}

			/* Lista de Perfis */
			Collection perfilList = new TreeSet(ordem);

			perfilList.addAll(perfilCtrl.list());

			if (!gestor.getPerfil().equals(Perfil.ADMINISTRADOR)) {
				perfilList.remove(Perfil.ADMINISTRADOR);
			}

			/* Lista de Funcionalidades */
			FuncionalidadeCtrl funcionalideCtrl = new FuncionalidadeCtrl(
					getDaoFactory());
			Collection funcionalideList = new TreeSet(ordem);
			funcionalideList.addAll(funcionalideCtrl.list());

			/* Lista de Tipo de Assunto */
			TipoAssuntoCtrl tipoAssuntoCtrl = new TipoAssuntoCtrl(
					getDaoFactory());
			Collection tipoAssuntoList = new TreeSet(ordem);

			/* Se funcionário é administrador ou tem nível de acesso ao órgão */
			if (gestor.getPerfil().equals(Perfil.ADMINISTRADOR)
					|| gestor.getListaSubOrgaosAtivos() == null
					|| gestor.getListaSubOrgaosAtivos().isEmpty())
				tipoAssuntoList.addAll(tipoAssuntoCtrl.list(getOrgao(request)));
			else {
				for (Iterator iter = gestor.getListaSubOrgaosAtivos()
						.iterator(); iter.hasNext();) {
					SubOrgao subOrgao = (SubOrgao) iter.next();
					tipoAssuntoList.addAll(subOrgao
							.getListaAssunto(Assunto.ATIVO));
				}
			}

			/* Lista de Tipo Mensagem */
			TipoMensagemCtrl tipoMensagemCtrl = new TipoMensagemCtrl(
					getDaoFactory());
			Collection tipoMesagemList = new TreeSet(ordem);
			tipoMesagemList.addAll(tipoMensagemCtrl.list(getOrgao(request)));

			request.setAttribute("object", object);
			request.setAttribute("function", request.getParameter("function"));

			request.setAttribute("listarPerfil", perfilList);
			request.setAttribute("listarTipoAssunto", tipoAssuntoList);
			request.setAttribute("listarTipoMesagem", tipoMesagemList);

			request.setAttribute("listarInstituicao", subOrgaoList);
			request.setAttribute("listarFuncionalidade", funcionalideList);

			saveErrors(request, msgs);
			return mapping.findForward("error");
		}

		saveMessages(request, msgs);
		return mapping.findForward("success");
	}

}