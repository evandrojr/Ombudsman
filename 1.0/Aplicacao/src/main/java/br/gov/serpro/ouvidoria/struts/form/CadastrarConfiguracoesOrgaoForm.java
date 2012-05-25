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

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.4 $, $Date: 2011/10/20 15:30:36 $
 * @version 0.1, Date:  2005/01/10
 */
public class CadastrarConfiguracoesOrgaoForm extends ActionForm {

    /**
	 * Default serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private FormFile imagemLogo;

    private FormFile imagemBanner;

    private FormFile imagem3;

    private FormFile imagem4;

    private FormFile imagem5;

    public FormFile getImagemLogo() {
        return imagemLogo;
    }

    public void setImagemLogo(FormFile imagemLogo) {
        this.imagemLogo = imagemLogo;
    }

    public FormFile getImagemBanner() {
        return imagemBanner;
    }

    public void setImagemBanner(FormFile imagemBanner) {
        this.imagemBanner = imagemBanner;
    }

    public FormFile getImagem3() {
        return imagem3;
    }

    public void setImagem3(FormFile imagem3) {
        this.imagem3 = imagem3;
    }

    public FormFile getImagem4() {
        return imagem4;
    }

    public void setImagem4(FormFile imagem4) {
        this.imagem4 = imagem4;
    }

    public FormFile getImagem5() {
        return imagem5;
    }

    public void setImagem5(FormFile imagem5) {
        this.imagem5 = imagem5;
    }

}