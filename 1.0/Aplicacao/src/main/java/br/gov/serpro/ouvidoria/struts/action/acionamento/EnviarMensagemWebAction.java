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
package br.gov.serpro.ouvidoria.struts.action.acionamento;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.httpclient.Credentials;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.UsernamePasswordCredentials;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.w3c.dom.Document;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import br.gov.serpro.ouvidoria.controller.acionamento.EnviarMensagemWebCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.struts.ActionSupport;
import br.gov.serpro.ouvidoria.struts.form.CadastrarAcionamentoForm;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Montar a tela de enviar mensagem Web (novo acionamento) de acordo
 * com os parâmetros configuráveis do órgão
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.6 $, $Date: 2011/10/21 11:19:59 $
 * @version 0.1, Date: 2004/12/01
 */
public class EnviarMensagemWebAction extends ActionSupport {

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
        
        EnviarMensagemWebCtrl enviarMensagemWebCtrl = new EnviarMensagemWebCtrl(
                getDaoFactory());

        CadastrarAcionamentoForm _form = (CadastrarAcionamentoForm) form;
        
        String matriculaAcionadorFuncionario = _form
                .getMatriculaAcionadorFuncionario();
        
        if ((_form.getArquivoAnexo() != null)
        && (!_form.getArquivoAnexo().getFileName().equals(""))) {
            request.setAttribute("anexoSelecionado", "true");
        } else {
            request.setAttribute("anexoSelecionado", "false");
        }
        if ((_form.getMensagemDigitalizada() != null)
        && (!_form.getMensagemDigitalizada().getFileName().equals(""))) {
            request.setAttribute("msgDigitalizadaSelecionada", "true");
        } else {
            request.setAttribute("msgDigitalizadaSelecionada", "false");
        }
        
        request.setAttribute("flagPesquisaFuncionario", "false");
        request.setAttribute("dscArqAnexo", "");
        request.setAttribute("dscMsgDigitalizada", "");
        
        /* Sistema configurado para consultar funcionários? */
        if ((this.getOrgao(request).getConfiguracoes().getUrlBaseFuncionarios() != null)
        && (this.getOrgao(request).getConfiguracoes()
        .getUrlBaseFuncionarios().length() > 0)) {
            request.setAttribute("flagPermitePesquisaFuncionario", "true");
            
            String resultadoBuscaFunc = "";
            
            if ((_form.getTipoAcionador() != null)
            && (_form.getTipoAcionador().intValue() == TipoAcionador.FUNCIONARIO
                    .getId().intValue())) {
                if ((matriculaAcionadorFuncionario != null)
                && (matriculaAcionadorFuncionario.compareTo("") != 0)) {
                    
                    HttpClient httpClient = new HttpClient();
                    
                    /*
                     * Parámetros de configuração do Proxy para acesso a
                     * recursos externos
                     */
                    httpClient.getHostConfiguration().setProxy("192.168.0.1",
                            8080);
                    
                    Credentials defaultcreds = new UsernamePasswordCredentials(
                            "username", "senha");
                    
                    httpClient.getState().setAuthenticationPreemptive(true);
                    httpClient.getState().setProxyCredentials(null, null,
                            defaultcreds);
                    
                    /*
                     * Questão do tempo limite de consulta à base de
                     * funcionários
                     */
                    if (enviarMensagemWebCtrl.getParametrosGerais()
                    .getTempoAcessoBaseFuncionarios() != null) {
                        httpClient.setConnectionTimeout(enviarMensagemWebCtrl
                                .getParametrosGerais()
                                .getTempoAcessoBaseFuncionarios().intValue());
                        httpClient.setTimeout(enviarMensagemWebCtrl
                                .getParametrosGerais()
                                .getTempoAcessoBaseFuncionarios().intValue());
                    }
                    
                    HttpMethod method = new GetMethod(this.getOrgao(request)
                    .getConfiguracoes().getUrlBaseFuncionarios()
                    + "?matricula=" + matriculaAcionadorFuncionario);
                    
                    method.setDoAuthentication(true);
                    
                    try {
                        // Execute the method.
                        int statusCode = httpClient.executeMethod(method);
                        
                        if (statusCode != HttpStatus.SC_OK) {
                            
                            resultadoBuscaFunc = "A busca pelos seus dados cadastrais na sua instituição não retornou nenhuma informação.";

                        } else {
                            
                            InputStream in = method.getResponseBodyAsStream();
                            
                            DocumentBuilderFactory dFactory = DocumentBuilderFactory
                                    .newInstance();
                            DocumentBuilder dBuilder = dFactory
                                    .newDocumentBuilder();
                            Document doc = dBuilder.parse(in);
                            
                            NodeList nodes = doc
                                    .getElementsByTagName("Funcionario");
                            
                            if (nodes.getLength() != 0) {
                                Node no = nodes.item(0);
                                NamedNodeMap nnm = no.getAttributes();
                                
                                if (nnm.getNamedItem("nome") != null) {
                                    try {
                                        _form.setNomeAcionadorFuncionario(nnm
                                                .getNamedItem("nome")
                                                .getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (nnm.getNamedItem("cpf") != null) {
                                    try {
                                        _form.setCpfAcionadorFuncionario(nnm
                                                .getNamedItem("cpf")
                                                .getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (nnm.getNamedItem("setor") != null) {
                                    try {
                                        _form.setSetorAcionadorFuncionario(nnm
                                                .getNamedItem("setor")
                                                .getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if (nnm.getNamedItem("idade") != null) {
                                    try {
                                        _form
                                                .setFaixaEtaria(new Integer(
                                                enviarMensagemWebCtrl
                                                .getFaixaEtaria(
                                                nnm
                                                .getNamedItem(
                                                "idade")
                                                .getNodeValue())
                                                .getId()
                                                .intValue()));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if (nnm.getNamedItem("sexo") != null) {
                                    try {
                                        _form.setSexo(nnm.getNamedItem("sexo")
                                        .getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if (nnm.getNamedItem("escolaridade") != null) {
                                    try {
                                        _form
                                                .setEscolaridade(new Integer(
                                                enviarMensagemWebCtrl
                                                .getEscolaridade(
                                                nnm
                                                .getNamedItem(
                                                "escolaridade")
                                                .getNodeValue())
                                                .getId()
                                                .intValue()));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if (nnm.getNamedItem("pais") != null) {
                                    try {
                                        _form
                                                .setPais(new Integer(
                                                enviarMensagemWebCtrl
                                                .getPais(
                                                nnm
                                                .getNamedItem(
                                                "pais")
                                                .getNodeValue())
                                                .getId()
                                                .intValue()));
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                                if (_form.getPais().intValue() == 1) {
                                    if (nnm.getNamedItem("localResidencia") != null) {
                                        try {
                                            _form
                                                    .setUf(new Integer(
                                                    enviarMensagemWebCtrl
                                                    .getUF(
                                                    nnm
                                                    .getNamedItem(
                                                    "localResidencia")
                                                    .getNodeValue())
                                                    .getId()
                                                    .intValue()));
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                                if (nnm.getNamedItem("email") != null) {
                                    try {
                                        _form.setEmail(nnm
                                                .getNamedItem("email")
                                                .getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                if (nnm.getNamedItem("telefone") != null) {
                                    try {
                                        _form.setTelefone(nnm.getNamedItem(
                                                "telefone").getNodeValue());
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                }
                                
                            }
                            
                            resultadoBuscaFunc = "Os seus dados cadastrais foram preenchidos conforme dados informados pela sua instituição.";
                        }
                    } catch (Exception e) {
                        if (Constants.DEBUG)
                            e.printStackTrace(System.out);
                    } finally {
                        method.releaseConnection();
                    }
                    request.setAttribute("flagPesquisaFuncionario", "true");
                }
            }
            
            request.setAttribute("resultadoBuscaFunc", resultadoBuscaFunc);
        }
        
        //FIM da consulta de funcionários (XML)
        
        ActionErrors errors = new ActionErrors();
        
        request.setAttribute("listaTipoMensagem", this.getOrgao(request)
        .listarTipoMensagemAtivos());
        
        request.setAttribute("listaUf", enviarMensagemWebCtrl.listarUf());
        
        request.setAttribute("listaTipoAcionador", enviarMensagemWebCtrl
                .listarTipoAcionador(this.getOrgao(request)));
        
        request.setAttribute("listaFaixaEtaria", enviarMensagemWebCtrl
                .listarFaixaEtaria());
        
        request.setAttribute("listaEscolaridade", enviarMensagemWebCtrl
                .listarEscolaridade());
        
        request.setAttribute("listaPais", enviarMensagemWebCtrl.listarPais());
        
        request.setAttribute("listaMeioEnvioResposta", this.getOrgao(request)
        .getListaMeioEnvioResposta());
        request.setAttribute("listaAssunto", enviarMensagemWebCtrl
                .getListaAssunto(this.getOrgao(request)));
        
        request.setAttribute("listaMeioRecebimento", enviarMensagemWebCtrl
                .listarMeioRecebimentoAcionamento());
        
        request.setAttribute("permiteArquivoAnexo", this.getOrgao(request)
        .getConfiguracoes().getPermiteArquivoAnexoAcionamento());
        
        request.setAttribute("permiteMensagemDigitalizada", this.getOrgao(
                request).getConfiguracoes()
                .getPermiteMsgDigitalizadaAcionamento());
        
        request.setAttribute("tamanhoArquivoAnexo", this.getOrgao(request)
        .getConfiguracoes().getTamanhoMaxArquivoAnexo());
        
        request.setAttribute("tamanhoMensagemDigitalizada", this.getOrgao(
                request).getConfiguracoes()
                .getTamanhoMaxArquivoCartaDigitalizada());
        
        if (this.getOrgao(request).getConfiguracoes()
        .getTextoApresentacaoFormulario() != null) {
            request.setAttribute("textoApresentacaoFormularioAcionamento", this
                    .getOrgao(request).getConfiguracoes()
                    .getTextoApresentacaoFormulario());
        }
        
        Long funcionarioId = (Long) request.getSession().getAttribute(Constants.PA_FUNCIONARIO);
        
        FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(getDaoFactory());
        
        Funcionario funcionario = (Funcionario) funcionarioCtrl.get(funcionarioId);
        
        request.setAttribute("hashAssunto", enviarMensagemWebCtrl
                .getListaAssuntoLocalidadeOcorrencia(this.getOrgao(request)));
        
        if (funcionario != null) {
            request.setAttribute("usuarioLogado", "true");
        }
        
        request.setAttribute("possuiCodigoAcesso", this.getOrgao(request)
        .getConfiguracoes().getPossuiCodigoAcesso());
        
        
        String strRand = Utilitario.gerarNumeroRandomico(new Integer(4));
        
        request.setAttribute("srcImagem1", _form.getImagens().get(
                strRand.charAt(0) + ""));
        request.setAttribute("srcImagem2", _form.getImagens().get(
                strRand.charAt(1) + ""));
        request.setAttribute("srcImagem3", _form.getImagens().get(
                strRand.charAt(2) + ""));
        request.setAttribute("srcImagem4", _form.getImagens().get(
                strRand.charAt(3) + ""));
        
        request.setAttribute("altImagem1", strRand.charAt(0) + "");
        request.setAttribute("altImagem2", strRand.charAt(1) + "");
        request.setAttribute("altImagem3", strRand.charAt(2) + "");
        request.setAttribute("altImagem4", strRand.charAt(3) + "");
        
        request.setAttribute("validacao", strRand);
        
        request.getSession().setAttribute("valorValidacao", strRand);
        
        SimpleDateFormat sfd1 = new SimpleDateFormat(
                "EEEE, dd 'de' MMMM 'de' yyyy", new Locale("pt", "BR"));
        String dataFormatada = sfd1
                .format(new Date(System.currentTimeMillis()));
        
        request.setAttribute("dataAtual", dataFormatada);
        
        if (!errors.isEmpty()) {
            return (mapping.findForward("failure"));
        }
        return (mapping.findForward("success"));
    }
}