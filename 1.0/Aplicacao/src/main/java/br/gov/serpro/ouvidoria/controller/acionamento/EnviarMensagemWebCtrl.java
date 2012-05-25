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
package br.gov.serpro.ouvidoria.controller.acionamento;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;

import br.gov.serpro.ouvidoria.dao.Dao;
import br.gov.serpro.ouvidoria.dao.DaoException;
import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.AcionadorFuncionario;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaFisica;
import br.gov.serpro.ouvidoria.model.AcionadorPessoaJuridica;
import br.gov.serpro.ouvidoria.model.Acionamento;
import br.gov.serpro.ouvidoria.model.Assunto;
import br.gov.serpro.ouvidoria.model.Escolaridade;
import br.gov.serpro.ouvidoria.model.FaixaEtaria;
import br.gov.serpro.ouvidoria.model.Instituicao;
import br.gov.serpro.ouvidoria.model.LocalidadeOcorrencia;
import br.gov.serpro.ouvidoria.model.MeioEnvioResposta;
import br.gov.serpro.ouvidoria.model.MeioEnvioRespostaOrgao;
import br.gov.serpro.ouvidoria.model.MeioRecebimentoAcionamento;
import br.gov.serpro.ouvidoria.model.Orgao;
import br.gov.serpro.ouvidoria.model.Pais;
import br.gov.serpro.ouvidoria.model.ParametrosGerais;
import br.gov.serpro.ouvidoria.model.PersistentObject;
import br.gov.serpro.ouvidoria.model.Protocolo;
import br.gov.serpro.ouvidoria.model.SubOrgao;
import br.gov.serpro.ouvidoria.model.TipoAcionador;
import br.gov.serpro.ouvidoria.model.TipoAcionadorOrgao;
import br.gov.serpro.ouvidoria.model.TipoMensagem;
import br.gov.serpro.ouvidoria.model.UF;

/**
 * Objetivo: Controlar as operações sobre os objetos relacionados à
 * funcionalidade Enviar Mensagem Web.
 *
 * @author SERPRO
 * @version $Revision: 1.1.2.5 $, $Date: 2011/10/18 17:55:14 $
 * @version 0.1, Date: 2004/12/01
 */

public class EnviarMensagemWebCtrl {
    
	/** atributo para datasource do tipo de mensagem */
	private Dao tipoMensagemDao;

	private Dao ufDao;

	private Dao tipoAcionadorDao;

	private Dao faixaEtariaDao;

	private Dao escolaridadeDao;

	private Dao paisDao;

	private Dao meioEnvioRespostaDao;

	private Dao meioEnvioRespostaOrgaoDao;

	private Dao assuntoDao;

	private Dao localidadeOcorrenciaDao;

	private Dao protocoloDao;

	private Dao acionamentoDao;

	private Dao meioRecebimentoAcionamentoDao;

	private Dao parametrosGeraisDao;

	private Acionamento acionamento = new Acionamento();
    
    /**
     * Construtor "default"
     */
    public EnviarMensagemWebCtrl() {
        
    }
    
    /**
     * Construtor recebendo objeto Dao
     * @param daoFactory
     */
    public EnviarMensagemWebCtrl(final DaoFactory daoFactory) {
        tipoMensagemDao = daoFactory.create(TipoMensagem.class);
        ufDao = daoFactory.create(UF.class);
        tipoAcionadorDao = daoFactory.create(TipoAcionador.class);
        faixaEtariaDao = daoFactory.create(FaixaEtaria.class);
        escolaridadeDao = daoFactory.create(Escolaridade.class);
        paisDao = daoFactory.create(Pais.class);
        meioEnvioRespostaDao = daoFactory.create(MeioEnvioResposta.class);
        meioEnvioRespostaOrgaoDao = daoFactory
                .create(MeioEnvioRespostaOrgao.class);
        assuntoDao = daoFactory.create(Assunto.class);
        localidadeOcorrenciaDao = daoFactory.create(LocalidadeOcorrencia.class);
        protocoloDao = daoFactory.create(Protocolo.class);
        acionamentoDao = daoFactory.create(Acionamento.class);
        meioRecebimentoAcionamentoDao = daoFactory
                .create(MeioRecebimentoAcionamento.class);
        parametrosGeraisDao = daoFactory.create(ParametrosGerais.class);
    }
    
    public List getListaLocalidadeOcorrencia(Integer idAssunto)
    throws DaoException {
        Instituicao instituicao;
        Assunto assunto;
        LocalidadeOcorrencia localidadeOcorrencia;
        List listaLocalidadeOcorrencia = new ArrayList();
        Iterator iter;
        
        if (idAssunto == null) {
            throw new DaoException("Id do assunto não pode ser nulo.");
        }
        
        assunto = (Assunto) assuntoDao.get(new Long(String.valueOf(idAssunto)));
        
        if (assunto != null) {
            instituicao = assunto.getInstituicao();
            iter = ((SubOrgao) instituicao).getListaLocalidadeOcorrencia()
            .iterator();
            while (iter.hasNext()) {
                localidadeOcorrencia = (LocalidadeOcorrencia) iter.next();
                if (!listaLocalidadeOcorrencia.contains(localidadeOcorrencia)) {
                    listaLocalidadeOcorrencia.add(localidadeOcorrencia);
                }
            }
            
            class LocalidadeComparator implements Comparator {
                public final int compare(Object a, Object b) {
                    return (((LocalidadeOcorrencia) a).getDescricao())
                    .compareTo((((LocalidadeOcorrencia) b)
                    .getDescricao()));
                } // end compare
            } // end class StringComparator
            
            Collections.sort(listaLocalidadeOcorrencia,
                    new LocalidadeComparator());
            
            return listaLocalidadeOcorrencia;
        }
        return null;
    }
    
    public List getListaAssunto(Orgao orgao) throws DaoException {
        Assunto assunto;
        SubOrgao subOrgao;
        
        Iterator iter, iter2;
        
        Collection listaSubOrgao;
        Collection listaAssuntoSubOrgao = new ArrayList();
        
        List listaAssunto = new ArrayList();
        
        if (orgao == null) {
            throw new DaoException("Órgão não pode ser nulo.");
        }
        
        listaSubOrgao = orgao.getListaSubOrgao();
        
        if (listaSubOrgao != null) {
            iter = listaSubOrgao.iterator();
            while (iter.hasNext()) {
                subOrgao = (SubOrgao) iter.next();
                
                /*
                 * Se não houver Localidades de Ocorrência para o Sub-Órgão, não
                 * mostra seus Assuntos
                 */
                if (subOrgao.getListaLocalidadeOcorrencia() == null
                        || subOrgao.getListaLocalidadeOcorrencia().isEmpty()) {
                    continue;
                }
                
                listaAssuntoSubOrgao = subOrgao.getListaAssunto();
                if (listaAssuntoSubOrgao == null
                        || listaAssuntoSubOrgao.isEmpty()) {
                    continue;
                }
                
                iter2 = listaAssuntoSubOrgao.iterator();
                while (iter2.hasNext()) {
                    assunto = (Assunto) iter2.next();
                    if (!listaAssunto.contains(assunto)) {
                        if (assunto.getDataVigencia() != null) {
                            if (assunto.getDataVigencia().after(
                                    new Timestamp(System.currentTimeMillis()))) {
                                listaAssunto.add(assunto);
                            }
                        } else {
                            listaAssunto.add(assunto);
                        }
                    }
                }
            }
            
            class AssuntoComparator implements Comparator {
                public final int compare(Object a, Object b) {
                    return (((Assunto) a).getDescricao())
                    .compareTo((((Assunto) b).getDescricao()));
                } // end compare
            } // end class StringComparator
            
            Collections.sort(listaAssunto, new AssuntoComparator());
            return listaAssunto;
        }
        
        return null;
    }
    
    public Hashtable getListaAssuntoLocalidadeOcorrencia(Orgao orgao)
    throws DaoException {
        SubOrgao subOrgao;
        Assunto assunto;
        Collection listaAssuntoSubOrgao = new ArrayList();
        Collection listaSubOrgao;
        List listaAssunto = new ArrayList();
        Hashtable hash = new Hashtable();
        Iterator iter;
        Iterator iter2;
        
        if (orgao == null) {
            throw new DaoException("Órgão não pode ser nulo.");
        }
        
        listaSubOrgao = orgao.getListaSubOrgao();
        
        if (listaSubOrgao != null) {
            iter = listaSubOrgao.iterator();
            while (iter.hasNext()) {
                subOrgao = (SubOrgao) iter.next();
                listaAssuntoSubOrgao = subOrgao.getListaAssunto();
                iter2 = listaAssuntoSubOrgao.iterator();
                while (iter2.hasNext()) {
                    assunto = (Assunto) iter2.next();
                    if (!listaAssunto.contains(assunto)) {
                        if (assunto.getDataVigencia() != null) {
                            if (assunto.getDataVigencia().after(
                                    new Timestamp(System.currentTimeMillis()))) {
                                hash
                                        .put(
                                        assunto,
                                        this
                                        .getListaLocalidadeOcorrencia(new Integer(
                                        assunto
                                        .getId()
                                        .intValue())));
                                
                            }
                        } else {
                            hash.put(assunto, this
                                    .getListaLocalidadeOcorrencia(new Integer(
                                    assunto.getId().intValue())));
                            
                        }
                    }
                }
            }
            return hash;
        }
        
        return null;
    }
    
    /**
     * @return Lista com os tipos de mensagens
     * @throws DaoException
     */
    public List listarTipoMensagem() throws DaoException {
        
        Iterator iter;
        TipoMensagem tipoMensagem;
        List tiposMensagem = tipoMensagemDao
                .query("from TipoMensagem tm order by tm.descricao");

        List retorno = new ArrayList();
        
        if (!tiposMensagem.isEmpty()) {
            iter = tiposMensagem.iterator();
            
            while (iter.hasNext()) {
                tipoMensagem = (TipoMensagem) iter.next();
                if (tipoMensagem.getDataVigencia() != null) {
                    if (tipoMensagem.getDataVigencia().after(
                            new Timestamp(System.currentTimeMillis()))) {
                        retorno.add(tipoMensagem);
                    }
                } else {
                    retorno.add(tipoMensagem);
                }
            }
        }
        return retorno;
    }
    
    public List listarUf() throws DaoException {
        return ufDao.query("from UF uf order by uf.nome");
    }
    
    public Collection listarTipoAcionador(final Orgao orgao)
    throws DaoException {
        
        Collection listaTipoAcionadorOrgao = orgao.getListaTipoAcionadorOrgao();
        
        if (listaTipoAcionadorOrgao == null) {
            return new ArrayList();
        }
        
        List listaTipoAcionador = new ArrayList();
        
        Timestamp agora = new Timestamp(System.currentTimeMillis());
        for (Iterator iter = listaTipoAcionadorOrgao.iterator(); iter.hasNext();) {
            TipoAcionadorOrgao tipoAcionadorOrgao = (TipoAcionadorOrgao) iter
                    .next();
            
            if (tipoAcionadorOrgao.getDataVigencia() == null
                    || tipoAcionadorOrgao.getDataVigencia().after(agora)) {
                listaTipoAcionador.add(tipoAcionadorOrgao.getTipoAcionador());
            }
        }
        
        class ComparatorImpl implements Comparator {
            public final int compare(Object a, Object b) {
                return (((PersistentObject) a).getDescricao())
                .compareTo((((PersistentObject) b).getDescricao()));
            }
        }
        
        Collections.sort(listaTipoAcionador, new ComparatorImpl());
        
        return listaTipoAcionador;
    }
    
    public List listarFaixaEtaria() throws DaoException {
        return faixaEtariaDao
                .query("from FaixaEtaria fe order by fe.idadeInicial");
    }
    
    public List listarEscolaridade() throws DaoException {
        return escolaridadeDao.list();
    }
    
    public List listarPais() throws DaoException {
        return paisDao.query("from Pais p order by p.descricao");
    }
    
    public List listarMeioEnvioResposta() throws DaoException {
        return meioEnvioRespostaDao.list();
    }
    
    public List listarMeioRecebimentoAcionamento() throws DaoException {
        return meioRecebimentoAcionamentoDao
                .query("from MeioRecebimentoAcionamento m order by m.descricao");
    }
    
    public LocalidadeOcorrencia getLocalidadeOcorrencia(Integer id)
    throws DaoException {
        LocalidadeOcorrencia localidadeOcorrencia = (LocalidadeOcorrencia) localidadeOcorrenciaDao
                .get(new Long(id.longValue()));
        return localidadeOcorrencia;
    }
    
    public TipoMensagem getTipoMensagem(Integer id) throws DaoException {
        TipoMensagem tipoMensagem = (TipoMensagem) tipoMensagemDao
                .get(new Long(id.longValue()));
        return tipoMensagem;
    }
    
    public Assunto getAssunto(Integer id) throws DaoException {
        Assunto assunto = (Assunto) assuntoDao.get(new Long(id.longValue()));
        return assunto;
    }
    
    public MeioEnvioResposta getMeioEnvioResposta(Integer id)
    throws DaoException {
        MeioEnvioResposta meioEnvioResposta = (MeioEnvioResposta) meioEnvioRespostaDao
                .get(new Long(id.longValue()));
        return meioEnvioResposta;
    }
    
    public MeioRecebimentoAcionamento getMeioRecebimentoAcionamento(Integer id)
    throws DaoException {
        if (meioRecebimentoAcionamentoDao.get(new Long(id.longValue())) != null) {
            MeioRecebimentoAcionamento meioRecebimentoAcionamento = (MeioRecebimentoAcionamento) meioRecebimentoAcionamentoDao
                    .get(new Long(id.longValue()));
            return meioRecebimentoAcionamento;
        }
        return null;
        
    }
    
    public TipoAcionador getTipoAcionador(Integer id) throws DaoException {
        TipoAcionador tipoAcionador = (TipoAcionador) tipoAcionadorDao
                .get(new Long(id.longValue()));
        return tipoAcionador;
    }
    
    public Escolaridade getEscolaridade(Integer id) throws DaoException {
        Escolaridade escolaridade = (Escolaridade) escolaridadeDao
                .get(new Long(id.longValue()));
        return escolaridade;
    }
    
    public Escolaridade getEscolaridade(String escolaridade)
    throws DaoException {
        
        String sql = " from Escolaridade as a where a.descricao = '"
                + escolaridade + "'";
        
        List listaEscolaridade = escolaridadeDao.query(sql);
        if (!listaEscolaridade.isEmpty()) {
            return (Escolaridade) listaEscolaridade.get(0);
        }
        return null;
    }
    
    public FaixaEtaria getFaixaEtaria(Integer id) throws DaoException {
        FaixaEtaria faixaEtaria = (FaixaEtaria) faixaEtariaDao.get(new Long(id
                .longValue()));
        return faixaEtaria;
    }
    
    public FaixaEtaria getFaixaEtaria(String idade) throws DaoException {
        
        String sql = " from FaixaEtaria as a where a.idadeInicial <= " + idade
                + " and a.idadeFinal >= " + idade;
        
        List listaFaixaEtaria = faixaEtariaDao.query(sql);
        if (!listaFaixaEtaria.isEmpty()) {
            return (FaixaEtaria) listaFaixaEtaria.get(0);
        }
        return null;
    }
    
    public UF getUF(Integer id) throws DaoException {
        UF uf = (UF) ufDao.get(new Long(id.longValue()));
        return uf;
    }
    
    public UF getUF(String uf) throws DaoException {
        String sql = " from UF as a where a.sigla = '" + uf + "'";
        
        List listaUf = ufDao.query(sql);
        if (!listaUf.isEmpty()) {
            return (UF) listaUf.get(0);
        }
        return null;
    }
    
    public Pais getPais(Integer id) throws DaoException {
        Pais pais = (Pais) paisDao.get(new Long(id.longValue()));
        return pais;
    }
    
    public Pais getPais(String pais) throws DaoException {
        String sql = " from Pais as a where a.descricao = '" + pais + "'";
        
        List listaPais = paisDao.query(sql);
        if (!listaPais.isEmpty()) {
            return (Pais) listaPais.get(0);
        }
        return null;
    }
    
    public MeioEnvioRespostaOrgao getMeioEnvioRespostaOrgao(
            Integer idMeioEnvioResposta, Integer idOrgao) throws DaoException {
        
        String sql = " from MeioEnvioRespostaOrgao as a where a.orgao.id = "
                + idOrgao + " and a.meioEnvioResposta.id = "
                + idMeioEnvioResposta;
        
        List meioEnvioRespostaOrgao = meioEnvioRespostaOrgaoDao.query(sql);
        if (!meioEnvioRespostaOrgao.isEmpty()) {
            return (MeioEnvioRespostaOrgao) meioEnvioRespostaOrgao.get(0);
        }
        
        return null;
    }
    
    public ParametrosGerais getParametrosGerais() throws DaoException {
        
        List parametrosGerais = parametrosGeraisDao.list();
        ParametrosGerais parametros = null;
        if (!parametrosGerais.isEmpty()) {
            parametros = (ParametrosGerais) parametrosGerais.get(0);
            return parametros;
        }
        return null;
        
    }
    
    /**
     * @return Integer com o número do protocolo a ser usado
     * @throws DaoException
     */
    public synchronized Integer obterNumeroProtocolo() throws DaoException {
        
        Protocolo protocolo = (Protocolo) protocoloDao.get(new Long(1));
        
        if (protocolo == null) {
            protocolo = new Protocolo();
            protocolo.setNumeroProtocolo(new Integer(1));
            protocoloDao.save(protocolo);
        } else {
            protocolo.setNumeroProtocolo(new Integer(protocolo
                    .getNumeroProtocolo().intValue() + 1));
            protocoloDao.save(protocolo);
        }
        
        return protocolo.getNumeroProtocolo();
        
    }
    
    public void salvarAcionamento() throws DaoException {
        acionamentoDao.save(this.acionamento);
    }
    
    /**
     * @return Retorna acionamento.
     */
    public Acionamento getAcionamento() {
        return acionamento;
    }
    
    /**
     * @param acionamento
     *            acionamento a ser atribuido.
     */
    public void setAcionamento(Acionamento acionamento) {
        this.acionamento = acionamento;
    }
    
    public String getNomeAcionador() {
        String nomeAcionador = "";
        if (this.acionamento.getAcionador().getTipoAcionador().equals(
                TipoAcionador.PESSOA_FISICA))
            nomeAcionador = ((AcionadorPessoaFisica) this.acionamento
                    .getAcionador()).getNome();
        
        if (this.acionamento.getAcionador().getTipoAcionador().equals(
                TipoAcionador.PESSOA_JURIDICA))
            nomeAcionador = ((AcionadorPessoaJuridica) this.acionamento
                    .getAcionador()).getRazaoSocial();
        
        if (this.acionamento.getAcionador().getTipoAcionador().equals(
                TipoAcionador.FUNCIONARIO))
            nomeAcionador = ((AcionadorFuncionario) this.acionamento
                    .getAcionador()).getNome();
        
        return nomeAcionador;
    }
    
}