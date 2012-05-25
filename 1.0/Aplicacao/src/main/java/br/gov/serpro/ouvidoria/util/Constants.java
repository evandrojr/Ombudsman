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
package br.gov.serpro.ouvidoria.util;

/**
 * 
 * Objetivo: Classe de objetos constantes da aplicação.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/20 15:30:35 $
 * @version 0.1, Date: 2005/01/21
 */
public final class Constants {

	/**
	 * INDICADOR GLOBAL DE DEBUG DO SISTEMA: alterando o valor desta variável
	 * para 'true', habilita-se a execução do sistema EM MODO DEBUG; alterando
	 * para 'false', desabilita-se a execução em modo debug.
	 */

	// alterado para fazer a homologação
	//public static final boolean DEBUG = true;
	public static final boolean DEBUG = false;

	/* Página de Login (Action) */
	public static final String LOGIN_ACTION = "/Login.do?action=exibir";

	/* Página de Login (Action), para sessão expirada */
	public static final String LOGIN_EXPIRED_ACTION = "/Login.do?action=sessaoExpirada";

	/* Página de Login (Forward) */
	public static final String LOGIN_FORWARD = "login";

	/* Página de Acesso Negado */
	public static final String DENIED_ACCESS_ACTION = "/DeniedAccess.do";

	/* Página para Orgão não Cadastrados */
	public static final String NOT_FOUND_PAGE = "/pages/Ouvidoria.jsp";

	/* Página para Orgão fora do período de operação */
	public static final String CAD_OPERACAO_FORA_VIGENCIA_PAGE = "/pages/VigOperacao.jsp";

	/* Página para Orgão fora do período para Acionamentos */
	public static final String CAD_ACNMNT_FORA_VIGENCIA_PAGE = "/pages/VigAcionamento.jsp";

	/* Página para Orgão fora do período para Consulta Resposta */
	public static final String CON_RESPTA_FORA_VIGENCIA_PAGE = "/pages/VigConsResposta.jsp";

	/* Parâmetro de Identificação das Páginas */
	public static final String PA_PATH = "path";

	/* Parâmetro para recuperar o Orgão */
	public static final String ID_SESSAO_ORGAO;
	static {
		if (Constants.DEBUG) {
			ID_SESSAO_ORGAO = "JSESSIONID";
		} else {
			ID_SESSAO_ORGAO = "osessionid";
		}
	}

	/* Parâmetro para recuperar o Funcionario */
	public static final String PA_FUNCIONARIO = "funcsessionid";

	/* Parâmetro para identificar o timeout da sessão */
	public static final String PA_EXPIRE = "_EXPIRE_";

	/* Layout do Orgão */
	public static final String SS_LAYOUT = "_LAYOUT_";

	/* sessão do usuário logado */
	public static final String SS_FUNCIONARIO = "_FUNCIONARIO_";

	/* Origem do Acionamento */
	public static final String SS_ORIGEM = "_ORIGEM_";

	/* Request Atributo do ID Funcionalidade */
	public static final String SR_FUNCIONALIDADE = "_FUNCIONALIDADE_";

	/* Request Atributo do ID Funcionalidade */
	public static final String SR_FUNCIONALIDADES = "_FUNCIONALIDADES_";

	/* Chave usada no Algoritimo DES para criptografar o ID do Orgão */
	public static final String DES_KEY = "B3E1C257";

	/* Constantes para os Indicadores */
	public static final String IMAGE_CHART = "_IMAGE_CHART_";

	public static final String HTML_RELATORIO = "_HTML_RELATORIO_";

	public static final String BOLETIM = "_BOLETIM_";

	/* Diretório de arquivos anexos */
	public static final String DIR_ANEXOS = "anexos/";

	/* String vazia para comparação em código */
	public static final String STRING_VAZIA = "";
}