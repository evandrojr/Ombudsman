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
package br.gov.serpro.ouvidoria.agendador;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.impl.StdSchedulerFactory;

import br.gov.serpro.ouvidoria.dao.DaoFactory;
import br.gov.serpro.ouvidoria.model.ConfiguracoesOrgao;
import br.gov.serpro.ouvidoria.util.Constants;

/**
 * 
 * @author SERPRO
 * @version $Revision: 1.1.2.3 $, $Date: 2011/10/18 17:39:43 $
 * 
 */
public final class OuvidoriaScheduler {

	// Fabrica para criar instancia de Scheduler
	protected static StdSchedulerFactory schedFactory = new StdSchedulerFactory();
	public static Scheduler sched;
	private static Logger log;
	protected DaoFactory daoFactory;

	public static void init(HttpServletRequest request) throws Exception {

		try {

			sched = schedFactory.getScheduler();

			// JobDetail utilizado para configurar as definições da Tareja(Job)

			getLog().info(
					"---------------- Criando Tarefa EnviarAlerta ----------------");

			JobDetail job = new JobDetail("EnviarAlertaJob",
					Scheduler.DEFAULT_GROUP, EnviarAlertaJob.class);

			// Obter parametros a serem utilizados no agendamento

			String osessionId = (String) request.getSession().getAttribute(
					Constants.ID_SESSAO_ORGAO);
			job.getJobDataMap().put(EnviarAlertaJob.ID_ORGAO, osessionId);

			String url = request.getScheme() + "://" + request.getServerName()
					+ ":" + request.getServerPort() + request.getContextPath();

			job.getJobDataMap().put(EnviarAlertaJob.URL, url);

			ConfiguracoesOrgao configuracoes = (ConfiguracoesOrgao) request
					.getAttribute("configuracoes");
			String[] horaMinuto = configuracoes.getHoraEnvioNotificacao()
					.split(":");

			String hora = horaMinuto[0];
			String minuto = horaMinuto[1];

			// Criar Trigger para enviar emails de alerta diaramente no horário
			// parametrizado.
			getLog().info("---------------- Criar Gatilho ----------------");
			CronTrigger enviarAlertaTrigger = new CronTrigger(
					"EnviarAlertaTrigger", Scheduler.DEFAULT_GROUP,
					"EnviarAlertaJob", Scheduler.DEFAULT_GROUP, "0 " + minuto
							+ " " + hora + " * * ?");

			// Confirgura o Job e a Trigger com o Agendador(Scheduler)
			getLog().info(
					"---------------- Fazer Agendamento do Envio de Alerta ----------------");
			java.util.Date ft = sched.scheduleJob(job, enviarAlertaTrigger);

			getLog().info(
					job.getFullName() + " Foi programado para funcionar em: "
							+ ft + " e repete baseado na expressão: "
							+ enviarAlertaTrigger.getCronExpression());

			// Iniciar execução do Agendador
			OuvidoriaScheduler.sched.start();

		} catch (Exception e) {

			getLog().info(
					"---------------- Erro ao tentar iniciar OuvidoriaScheduler ----------------");
			getLog().error(e.getMessage(), e);
		}
	}

	public static void restart(HttpServletRequest request) {
		try {

			if (OuvidoriaScheduler.sched == null) {

				sched = schedFactory.getScheduler();
			}
			OuvidoriaScheduler.sched.shutdown(true);

			init(request);

		} catch (Exception ex) {
			getLog().error("Erro ao tentar reiniciar as tarefas");
			getLog().error(ex.getMessage(), ex);
		}
	}

	protected static Logger getLog() {

		if (log == null) {
			log = Logger.getLogger("OuvidoriaScheduler ------> ");
		}
		return log;
	}
}
