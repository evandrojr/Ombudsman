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
package br.gov.serpro.ouvidoria.util.freechart.data;

import org.apache.oro.text.regex.MalformedPatternException;
import org.apache.oro.text.regex.Pattern;
import org.apache.oro.text.regex.Perl5Compiler;
import org.apache.oro.text.regex.Perl5Matcher;
import org.apache.oro.text.regex.Perl5Substitution;
import org.apache.oro.text.regex.Util;

/**
 * @author SERPRO
 * @version $Revision: 1.1.2.1 $, $Date: 2011/10/21 18:47:37 $
 */
public class QueryKit {

	private QueryKit() {
	}

	public static String asCountQuery(String query, boolean useSubSelect) {
		if (useSubSelect)
			return "select count(*) from (" + query + ") as USER_QUERY";
		else
			return Util.substitute(matcher, NOT_FIELDS_PATTERN, NOT_FIELDS_SUB,
					query);
	}

	public static String asExistsQuery(String query) {
		return "select exists (" + query + ") as USER_QUERY_EXISTS";
	}

	private static final Perl5Matcher matcher = new Perl5Matcher();
	private static final Perl5Compiler compiler;
	private static Pattern NOT_FIELDS_PATTERN;
	private static final Perl5Substitution NOT_FIELDS_SUB = new Perl5Substitution(
			"$1count\\(\\*\\) $2");

	static {
		compiler = new Perl5Compiler();
		try {
			NOT_FIELDS_PATTERN = compiler
					.compile("(select\\s).*(from\\s.*)", 1);
		} catch (MalformedPatternException e) {
			NOT_FIELDS_PATTERN = null;
			e.printStackTrace();
		}
	}
}
