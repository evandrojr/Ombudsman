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

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.activation.FileTypeMap;
import javax.activation.MimetypesFileTypeMap;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.gov.serpro.ouvidoria.controller.AcionamentoCtrl;
import br.gov.serpro.ouvidoria.controller.ControleAcessoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.FuncionarioCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.OrgaoCtrl;
import br.gov.serpro.ouvidoria.controller.gerencial.administracao.ParametrosGeraisCtrl;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.dao.hibernate.HibernateDaoFactory;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Funcionario;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.util.Constants;
import br.gov.serpro.ouvidoria.util.Utilitario;

/**
 * Objetivo: Fornecer um meio seguro de fazer o download dos arquivos anexos.
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:57:04 $
 * @version 0.1, 2005/03/30
 */

public class VisualizarAnexoServlet extends HttpServlet {

	private static final String CONS_MENS_RESPON_FUNC = "11";

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {

			final DaoFactory daoFactory = new HibernateDaoFactory();

			final Long funcionarioId = (Long) request.getSession()
					.getAttribute(Constants.PA_FUNCIONARIO);

			final FuncionarioCtrl funcionarioCtrl = new FuncionarioCtrl(
					daoFactory);

			final Funcionario funcionario = (Funcionario) funcionarioCtrl
					.get(funcionarioId);

			if (funcionario == null) {
				return;
			}

			final OrgaoCtrl orgaoCtrl = new OrgaoCtrl(daoFactory);

			final Orgao orgao = (Orgao) orgaoCtrl.get((String) request
					.getSession().getAttribute(Constants.ID_SESSAO_ORGAO));

			final ControleAcessoCtrl controleAcessoCtrl = new ControleAcessoCtrl(
					daoFactory);

			ArrayList regras = new ArrayList();
			regras.add(VisualizarAnexoServlet.CONS_MENS_RESPON_FUNC);

			final int permiteAcesso = controleAcessoCtrl.permiteAcesso(orgao,
					funcionario, regras);

			if (permiteAcesso != ControleAcessoCtrl.CA_ACESSO_PERMITIDO) {
				return;
			}

			final String id;
			try {
				id = new String(Utilitario.decrypt(Constants.DES_KEY, request
						.getParameter("asessionid")));
			} catch (RuntimeException re) {
				if (Constants.DEBUG) {
					re.printStackTrace(System.out);
				}
				return;
			}

			final ParametrosGeraisCtrl pgc = new ParametrosGeraisCtrl(
					daoFactory);

			final ParametrosGerais pg = pgc.get(new Long(1));

			final AcionamentoCtrl ac = new AcionamentoCtrl(daoFactory);

			final Acionamento acionamento = ac.get(new Long(id));

			if (acionamento == null) {
				return;
			}


			ServletOutputStream op = response.getOutputStream();

			String root = pg.getDiretorioContextoAplicacao()
					+ Constants.DIR_ANEXOS
					+ orgao.getConfiguracoes().getNomeDiretorioOrgao();

			final String tp = request.getParameter("tp");

			final String name;

			if (tp == null || tp.equalsIgnoreCase("an")) {
				name = acionamento.getMensagem().getArquivoAnexo();
			} else {
				name = acionamento.getMensagem().getMensagemDigitalizada();
			}

			byte[] buf = new byte[response.getBufferSize()];
			InputStream in = null;
			try {

				final File file = new File(root.concat("/").concat(name));
				final FileTypeMap ftm = new MimetypesFileTypeMap();

				response.setContentType(ftm.getContentType(file));

				// Para abrir o vizualizador do tipo do arquivo
				response.setHeader("Content-Disposition", "filename=" + name);

				response.setContentLength((int) file.length());

				in = new BufferedInputStream(new FileInputStream(file));
				int length;
				while ((in != null) && ((length = in.read(buf)) != -1)) {
					op.write(buf, 0, length);
				}

			} finally {
				if (in != null)
					in.close();
			}
			op.flush();
			op.close();
		} catch (DaoException de) {
			throw new ServletException(de);
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}