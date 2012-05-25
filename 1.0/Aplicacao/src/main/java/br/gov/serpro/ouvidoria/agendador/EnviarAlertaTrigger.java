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

import java.util.Date;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SchedulerMetaData;
import org.quartz.impl.StdSchedulerFactory;

/**
 * This Example will demonstrate all of the basics of scheduling capabilities of
 * Quartz using Cron Triggers.
 * 
 * @author Bill Kratzer
 */
public class EnviarAlertaTrigger extends CronTrigger {

	private static final long serialVersionUID = 1L;

	private Logger log;

	public void run() {

		try {

			getLog().info("------- Iniciando -------------------");

			// First we must get a reference to a scheduler
			SchedulerFactory sf = new StdSchedulerFactory();
			Scheduler sched = sf.getScheduler();

			getLog().info("------- Inicialização Completa --------");

			getLog().info("------- Agendando Tarefas ----------------");

			// jobs can be scheduled before sched.start() has been called

			// job 1 will run every 20 seconds
			JobDetail job = new JobDetail("EnviarAlertaJob",
					Scheduler.DEFAULT_GROUP, EnviarAlertaJob.class);
			CronTrigger trigger = new CronTrigger("EnviarAlertaTrigger",
					Scheduler.DEFAULT_GROUP, "EnviarAlertaJob",
					Scheduler.DEFAULT_GROUP, "0/10 0/5 * * * *");
			sched.addJob(job, true);
			Date ft = sched.scheduleJob(trigger);
			getLog().info(
					job.getFullName() + " Foi programado para funcionar em: "
							+ ft + " e repete baseado na expressão: "
							+ trigger.getCronExpression());

			getLog().info("------- Starting Scheduler ----------------");

			// All of the jobs have been added to the scheduler, but none of the
			// jobs will run until the scheduler has been started
			sched.start();

			getLog().info("------- Started Scheduler -----------------");

			getLog().info("------- Waiting five minutes... ------------");

			// wait five minutes to show jobs
			Thread.sleep(10L * 500L);
			// executing...

			getLog().info("------- Shutting Down ---------------------");

			sched.shutdown(true);

			getLog().info("------- Shutdown Complete -----------------");

			SchedulerMetaData metaData = sched.getMetaData();
			getLog().info("Executed " + metaData.numJobsExecuted() + " jobs.");

		} catch (Exception e) {
			System.out.print("\n\nMensagem " + e.getMessage() + "\n\n");
			e.printStackTrace();
		}

	}

	protected Logger getLog() {
		if (this.log == null) {
			this.log = Logger.getLogger("AÇÃO : ");
		}

		return this.log;
	}
	
}