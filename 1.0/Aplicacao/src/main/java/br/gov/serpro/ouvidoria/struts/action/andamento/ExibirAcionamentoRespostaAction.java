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

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.controller.andamento.ExibirRespostaCtrl;
import br.gov.serpro.ouvidoria.controller.andamento.ListarAcionamentoRespostaCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.model.AcionadorFuncionario;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaFisica;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaJuridica;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * Objetivo: Formatar Resposta do Acionamento para impressão
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:03 $
 * @version 0.1, 2004/12/20
 */
public class ExibirAcionamentoRespostaAction extends ActionSupport {

    /**
     * Método de execução da ação. Realiza dois forwards: um em caso de sucesso
     * e outro em caso de falha
     * 
     * @param mapping
     * @param form
     *            ActionForm, caso necessário
     * @param request
     * @param response
     *  
     */
    public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        ActionErrors errors = new ActionErrors();

        try {

            Orgao orgao = this.getOrgao(request);

            ExibirRespostaCtrl exibirRespostaCtrl = new ExibirRespostaCtrl(
                    getDaoFactory());

            List listarTipoAvaliacaoResposta = exibirRespostaCtrl
                    .listarTipoAvaliacaoResposta(this.getOrgao(request));

            Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
            
        	FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        	
        	Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);  

            String acionamentoId = request.getParameter("id");

            ListarAcionamentoRespostaCtrl larCtrl = new ListarAcionamentoRespostaCtrl(
                    getDaoFactory());

            Acionamento acionamento = larCtrl.getAcionamentoPeloCodigo(orgao,
                    funcionario, acionamentoId);

            String nomeCompletoAcionador = null;
            String primeiroNomeAcionador = null;

            if (acionamento.getAcionador().getTipoAcionador().equals(
                    TipoAcionador.PESSOA_FISICA)) {
                nomeCompletoAcionador = ((AcionadorPessoaFisica) acionamento
                        .getAcionador()).getNome();
            } else if (acionamento.getAcionador().getTipoAcionador().equals(
                    TipoAcionador.PESSOA_JURIDICA)) {
                nomeCompletoAcionador = ((AcionadorPessoaJuridica) acionamento
                        .getAcionador()).getRazaoSocial();
            } else if (acionamento.getAcionador().getTipoAcionador().equals(
                    TipoAcionador.FUNCIONARIO)) {
                nomeCompletoAcionador = ((AcionadorFuncionario) acionamento
                        .getAcionador()).getNome();
            }

            // mostrar somente o primeiro nome
            if (nomeCompletoAcionador != null) {
                int ind = nomeCompletoAcionador.indexOf(" ");
                if (ind != -1) {
                    primeiroNomeAcionador = nomeCompletoAcionador.subSequence(
                            0, ind).toString();
                }
            }

            request.setAttribute("nomeCompletoAcionador",nomeCompletoAcionador);
            request.setAttribute("primeiroNomeAcionador",primeiroNomeAcionador);
            request.setAttribute("sexo", acionamento.getAcionador().getSexo());
            request.setAttribute("telefone", acionamento.getAcionador().getTelefone());
            request.setAttribute("fax", acionamento.getAcionador().getFax());
            request.setAttribute("mensagem", acionamento.getMensagem()
                    .getTextoFormatado());

            String textoResposta = null;

            if (acionamento.getRespostaAcionamento() != null) {
                textoResposta = acionamento.getRespostaAcionamento().getTextoFormatado();
            }

            request.setAttribute("resposta", textoResposta);

            request.setAttribute("listaTipoAvaliacaoResposta",
                    listarTipoAvaliacaoResposta);

            request.setAttribute("numRows", String
                    .valueOf(listarTipoAvaliacaoResposta.size()));

            request.setAttribute("textoApresentacaoResposta", orgao
                    .getConfiguracoes().getTextoApresentacaoRespostaFormatado());

            request.setAttribute("textoConsultaRespostaNoPrazo", this.getOrgao(
                    request).getConfiguracoes()
                    .getTextoConsultaRespostaNoPrazoFormatado());

            request.setAttribute("textoConsultaRespostaSemPrazo", this
                    .getOrgao(request).getConfiguracoes()
                    .getTextoConsultaRespostaSemPrazoFormatado());

            request.setAttribute("textoConsultaRespostaEmAtraso", this
                    .getOrgao(request).getConfiguracoes()
                    .getTextoConsultaRespostaEmAtrasoFormatado());

            request.setAttribute("acionamento", acionamento);
            request.setAttribute("dataImpressao", new Timestamp(System
                    .currentTimeMillis()));

            //Gerar histórico
            this.geraHistorico(request, acionamento);

        } catch (DaoException e) {
            e.printStackTrace(System.out);
            errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.consulta.resposta"));
        }

        if (errors.isEmpty()) {
            return (mapping.findForward("success"));
        }
        
        saveMessages(request, errors);
        return (mapping.findForward("failure"));

    }

}