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
package br.gov.serpro.ouvidoria.controller;

import java.security.cert.X509Certificate;

/**
 * CertificadoDigitalCtrl
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:09 $
 * @version 0.1, Date: 2004/12/13
 */
public final class CertificadoDigitalCtrl {

	private CertificadoDigitalCtrl() {
		// DO NOTHING
	}

	public static String getLogin(final X509Certificate[] certs) {
		String login = null;
		for (int i = 0; i < certs.length; i++) {
			X509Certificate cert = certs[i];

			/** recupera o cpf */
			String subject = cert.getSubjectDN().getName();
			int indexSubjectCN = subject.indexOf("CN");
			int indexDoisPontos = subject.indexOf(":", indexSubjectCN);
			int indexVirgula = subject.indexOf(",", indexDoisPontos);
			if (indexVirgula >= 0) {
				login = subject.substring(indexDoisPontos + 1, indexVirgula);
			} else {
				login = subject.substring(indexDoisPontos + 1);
			}
		}
		return login;
	}

}