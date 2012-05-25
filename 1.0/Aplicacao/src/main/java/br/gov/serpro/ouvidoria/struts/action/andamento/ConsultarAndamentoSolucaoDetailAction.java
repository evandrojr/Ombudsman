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
package br.gov.serpro.ouvidoria.struts.action.andamento;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.Acionador;
import br.gov.serpro.ouvidoria.model.AcionadorFuncionario;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaFisica;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaJuridica;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Recupera os dados utilizados na view consultarAndamentoSolucao-detail.jsp
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 2004/12/20 
 */
public class ConsultarAndamentoSolucaoDetailAction extends ActionSupport {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ActionErrors errors = new ActionErrors();

		try {

			Acionamento acionamento = null;
			
			String s = request.getParameter("id");

			Long id = s == null ? null : Long.valueOf(s);

			 acionamento = id == null ? null : (Acionamento)
			 getDaoFactory().create(Acionamento.class).get(id);

			 Long idAcionador = null;
			 
			 if(acionamento.getAcionador()!=null){
				 idAcionador = acionamento.getAcionador().getId();
			 }
				 
				 
			if (acionamento.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_FISICA)) {
				
				AcionadorPessoaFisica acionador= null;
				acionador = (AcionadorPessoaFisica) getDaoFactory().create(AcionadorPessoaFisica.class).get(idAcionador);
				request.setAttribute("acionador", acionador);
			
			} else if (acionamento.getAcionador().getTipoAcionador().equals(TipoAcionador.PESSOA_JURIDICA)) {
				
				AcionadorPessoaJuridica acionador= null;
				acionador = (AcionadorPessoaJuridica) getDaoFactory().create(AcionadorPessoaJuridica.class).get(idAcionador);
				request.setAttribute("acionador", acionador);
				
			} else if (acionamento.getAcionador().getTipoAcionador().equals(TipoAcionador.FUNCIONARIO)) {
				
				AcionadorFuncionario acionador = null;
				acionador = (AcionadorFuncionario) getDaoFactory().create(AcionadorFuncionario.class).get(idAcionador);
				request.setAttribute("acionador", acionador);
			
			}else{
				
				Acionador acionador = null;
				acionador = (Acionador) getDaoFactory().create(Acionador.class).get(idAcionador);
				request.setAttribute("acionador", acionador);
				
			}

			if (acionamento == null) {
				request.setAttribute("cas_detail", null);
				request.setAttribute("acionador", null);
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.solucao.notFound"));

			} else {
				request.setAttribute("cas_detail", acionamento);
				request.setAttribute("asessionid", Utilitario.encrypt(Constants.DES_KEY, acionamento.getId().toString()));

			}

			// Recupera o nome e o diretório dos arquivos anexos

			String nomeAnexo = acionamento.getMensagem().getArquivoAnexo();
			String nomeMsgDigitalizada = acionamento.getMensagem()
					.getMensagemDigitalizada();

			String caminho = "/".concat("anexos/").concat(
					this.getOrgao(request).getConfiguracoes()
							.getNomeDiretorioOrgao()).concat("/");

			// seta o nome dos anexos no request
			request.setAttribute("nomeAnexo", nomeAnexo);
			request.setAttribute("nomeMsgDigitalizada", nomeMsgDigitalizada);
			request.setAttribute("diretorioAnexo", caminho);

			// Recupera o nomeDiretorioOrgao para montar o link de arquivo anexo
			Orgao orgao = getOrgao(request);
			request.setAttribute("nomeDiretorioOrgao", orgao.getConfiguracoes()
					.getNomeDiretorioOrgao());

		} catch (DaoException e) {
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.solucao.excecao"));
		}

		geraHistorico(request);

		return (mapping.findForward(errors.isEmpty() ? "success" : "failure"));

	}

}