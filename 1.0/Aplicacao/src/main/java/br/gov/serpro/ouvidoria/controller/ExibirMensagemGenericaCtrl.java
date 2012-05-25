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

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.Funcionalidade;
import br.gov.serpro.ouvidoria.model.Funcionario;

/**
 * ExibirMensagemGenericaCtrl
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/19 18:18:10 $
 * @version 0.1, Date: 2004/12/13
 */
public class ExibirMensagemGenericaCtrl {

	private Dao funcionalidadeDao;

	public ExibirMensagemGenericaCtrl(final DaoFactory daoFactory) {
		funcionalidadeDao = daoFactory.create(Funcionalidade.class);
	}

	public List getSubMenu(final Funcionario funcionario,
			final Funcionalidade funcionalidade) {
		List retorno = new ArrayList();
		Collection lista = funcionalidade.getListaSubItem();

		for (Iterator iter = lista.iterator(); iter.hasNext();) {
			Funcionalidade subItem = (Funcionalidade) iter.next();
			if (subItem.getItemMenu().booleanValue()
					&& funcionario.getListaFuncionalidade().contains(subItem)) {
				retorno.add(subItem);
			}
		}

		Collections.sort(retorno, new FuncionalidadeComparator());
		return retorno;
	}

	public List getMenu(final Funcionario funcionario) {
		List retorno = new ArrayList();
		Collection lista = funcionario.getListaFuncionalidade();

		for (Iterator iter = lista.iterator(); iter.hasNext();) {
			Funcionalidade funcionalidade = (Funcionalidade) iter.next();
			if (funcionalidade.getItemMenu().booleanValue()
					&& funcionalidade.getItemPai() == null) {
				retorno.add(funcionalidade);
			}
		}

		Collections.sort(retorno, new FuncionalidadeComparator());

		return retorno;
	}

	public Funcionalidade getFuncionalidade(Integer id) throws DaoException {
		Funcionalidade funcionalidade = (Funcionalidade) funcionalidadeDao
				.get(new Long(id.longValue()));
		return funcionalidade;
	}

	class FuncionalidadeComparator implements Comparator {
		public final int compare(Object a, Object b) {
			return (((Funcionalidade) a).getOrdemItemMenu())
					.compareTo((((Funcionalidade) b).getOrdemItemMenu()));
		} // end compare
	} // end class StringComparator

}