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
package br.gov.serpro.ouvidoria.struts.form;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import br.gov.serpro.ouvidoria.model.Perfil;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, Date:  2005/01/10
 */
public class CadastrarFuncionarioForm extends ActionForm {

	private Long id;

    private String nome;

    private String login;

    private String senha;
    
    private String email;

    private String situacao;

    private String motivo;

    private String nivel;

    private Long perfil;
    
    private String consultor;

    private Long[] funcionalidades;

    private Long[] tipoMensagem;

    private Long[] tipoAssunto;

    private Long[] subOrgao;

    private Long[] localidades;

    private String[] instituicaoFunc;


    public void reset(ActionMapping arg0, HttpServletRequest arg1) {
        // DO NOTHING
    }

    public ActionErrors validate(ActionMapping arg0, HttpServletRequest request) {

        ActionErrors erros = new ActionErrors();
        
        if (nome == null || nome.trim().length() == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.administrarUsuario.nome"));
        }

        if (login == null || login.trim().length() == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.administrarUsuario.login"));
        }

        if (id == null) {
            if (senha == null || senha.trim().length() < 0) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.administrarUsuario.senha"));
            }
        }

        if (nivel != null && nivel.equals("S")) {

            if (instituicaoFunc == null || instituicaoFunc.length == 0) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.administrarUsuario.instituicaoFunc"));
            } else {
                List subOrgao = new ArrayList();
                List localida = new ArrayList();

                String value = null;
                for (int i = 0; i < instituicaoFunc.length; i++) {
                    value = instituicaoFunc[i];

                    if (value.startsWith("O")) {
                        subOrgao.add(new Long(value.substring(value
                                .indexOf("_") + 1)));
                    } else {
                        localida.add(new Long(value.substring(value
                                .indexOf("_") + 1)));
                    }
                }

                if (!subOrgao.isEmpty()) {
                    this.subOrgao = new Long[subOrgao.size()];
                    for (int i = 0; i < subOrgao.size(); i++) {
                        this.subOrgao[i] = (Long) subOrgao.get(i);
                    }
                }

                if (!localida.isEmpty()) {
                    this.localidades = new Long[localida.size()];
                    for (int i = 0; i < localida.size(); i++) {
                        this.localidades[i] = (Long) localida.get(i);
                    }
                }
            }
        } else {
            if (perfil != null && perfil.equals(Perfil.ESPECIALISTA.getId())
                    && (motivo == null || motivo.trim().length() == 0)) {
                erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                        "error.administrarUsuario.motivo"));
            }
        }

        if (funcionalidades == null || funcionalidades.length == 0) {
            erros.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
                    "error.administrarUsuario.funcionalidades"));
        }

        return erros;
    }

    public Long[] getFuncionalidades() {
        return this.funcionalidades;
    }

    public void setFuncionalidades(Long[] funcionalidades) {
        this.funcionalidades = funcionalidades;
    }

    public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long[] getLocalidades() {
        return this.localidades;
    }

    public void setLocalidades(Long[] localidades) {
        this.localidades = localidades;
    }

    public String getLogin() {
        return this.login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getMotivo() {
        return this.motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNivel() {
        return this.nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Long getPerfil() {
        return this.perfil;
    }

    public void setPerfil(Long perfil) {
        this.perfil = perfil;
    }

    public String getSenha() {
        return this.senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getSituacao() {
        return this.situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

    public Long[] getTipoAssunto() {
        return this.tipoAssunto;
    }

    public void setTipoAssunto(Long[] tipoAssunto) {
        this.tipoAssunto = tipoAssunto;
    }

    public Long[] getTipoMensagem() {
        return this.tipoMensagem;
    }

    public void setTipoMensagem(Long[] tipoMensagem) {
        this.tipoMensagem = tipoMensagem;
    }

    public String[] getInstituicaoFunc() {
        return this.instituicaoFunc;
    }

    public void setInstituicaoFunc(String[] instituicaoFunc) {
        this.instituicaoFunc = instituicaoFunc;
    }

    public Long[] getSubOrgao() {
        return this.subOrgao;
    }

    public void setSubOrgao(Long[] subOrgao) {
        this.subOrgao = subOrgao;
    }

	public String getConsultor() {
		if (consultor == null)
		   return "0";
	    else
		   return consultor;			
	}

	public void setConsultor(String consultor) {		
		  this.consultor = consultor;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}