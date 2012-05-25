/*Esta fun??o exibe os campos espec?ficos de cada tipo de acionador*/

	function exibeIdentificacao(document,tipoPessoa){
	
		try{
			spanCodigoAcesso.style.display='';
		}catch(err){
		}
		
		if(tipoPessoa=='2'){
			document.getElementById('linhaIdentificacao').style.display='';
			document.getElementById('linhaPF1').style.display='';
			document.getElementById('linhaPF2').style.display='';
			document.getElementById('linhaPJ1').style.display='none';
			document.getElementById('linhaPJ2').style.display='none';
			document.getElementById('linhaFUN1').style.display='none';
			document.getElementById('linhaFUN2').style.display='none';
			document.getElementById('celulaTipoAcionador').colSpan='4';
			document.getElementById('celulaMat1').style.display='none';
			document.getElementById('celulaMat2').style.display='none';
			document.getElementById('linhaETF1').style.display='';
			document.getElementById('linhaETF2').style.display='';
			document.getElementById('linhaRespostaNormal').style.display='';
			document.getElementById('linhaRespostaNormal2').style.display='';
			document.getElementById('linhaRespostaInternet').style.display='none';
		}else{
			if(tipoPessoa=='3'){
				document.getElementById('linhaIdentificacao').style.display='';
				document.getElementById('linhaPF1').style.display='none';
				document.getElementById('linhaPF2').style.display='none';
				document.getElementById('linhaPJ1').style.display='';
				document.getElementById('linhaPJ2').style.display='';
				document.getElementById('linhaFUN1').style.display='none';
				document.getElementById('linhaFUN2').style.display='none';
				document.getElementById('celulaTipoAcionador').colSpan='4';
				document.getElementById('celulaMat1').style.display='none';
				document.getElementById('celulaMat2').style.display='none';
				document.getElementById('linhaETF1').style.display='';
				document.getElementById('linhaETF2').style.display='';
				document.getElementById('linhaRespostaNormal').style.display='';
				document.getElementById('linhaRespostaNormal2').style.display='';
				document.getElementById('linhaRespostaInternet').style.display='none';				
			}else{
			    // Funcion?rio
				if(tipoPessoa=='4'){
					document.getElementById('linhaIdentificacao').style.display='';
					document.getElementById('linhaPF1').style.display='none';
					document.getElementById('linhaPF2').style.display='none';
					document.getElementById('linhaPJ1').style.display='none';
					document.getElementById('linhaPJ2').style.display='none';
					document.getElementById('linhaFUN1').style.display='';
					document.getElementById('linhaFUN2').style.display='';
					document.getElementById('celulaTipoAcionador').colSpan='1';
					document.getElementById('celulaMat1').style.display='';
					document.getElementById('celulaMat2').style.display='';
					document.getElementById('linhaETF1').style.display='';
					document.getElementById('linhaETF2').style.display='';
					document.getElementById('linhaRespostaNormal').style.display='';
					document.getElementById('linhaRespostaNormal2').style.display='';
					document.getElementById('linhaRespostaInternet').style.display='none';					
				}else{
					if(tipoPessoa=='0'||'1'){
						document.getElementById('linhaIdentificacao').style.display='none';
						document.getElementById('linhaPF1').style.display='none';
						document.getElementById('linhaPF2').style.display='none';
						document.getElementById('linhaPJ1').style.display='none';
						document.getElementById('linhaPJ2').style.display='none';
						document.getElementById('linhaFUN1').style.display='none';
						document.getElementById('linhaFUN2').style.display='none';
						document.getElementById('celulaTipoAcionador').colSpan='4';
						document.getElementById('celulaMat1').style.display='none';
						document.getElementById('celulaMat2').style.display='none';
						document.getElementById('linhaETF1').style.display='none';
						document.getElementById('linhaETF2').style.display='none';						

						if (tipoPessoa=='1'){
							try{
								spanCodigoAcesso.style.display='none';
							}	catch(err){
							}
							document.getElementById('linhaRespostaNormal').style.display='none';
							document.getElementById('linhaRespostaNormal2').style.display='none';
							document.getElementById('linhaRespostaInternet').style.display='';
							document.forms[0].meioEnvioResposta.value = 2;
						} else{
							document.getElementById('linhaRespostaNormal').style.display='';
							document.getElementById('linhaRespostaNormal2').style.display='';
							document.getElementById('linhaRespostaInternet').style.display='none';						
						}
					}
				}
			}
		}
	}
	
	
	function exibeDadosRecuperacao(document){
	
		var perg = document.getElementById('linhaPergunta');
		var resp = document.getElementById('linhaResposta');
		
		try{
			if (document.forms[0].checkRecuperaCodigoAcesso.checked){
				perg.style.display='';
				resp.style.display='';
			} else{
				perg.style.display='none';
				resp.style.display='none';
				document.getElementById('pergunta').value = '';
				document.getElementById('resposta').value = '';
			}
		} catch (err){}
	}
	
	
	function exibeMensagem(document){
		try{
			if (document.forms[0].mensagemDigitalizada.value != ''){
				document.getElementById('asteriscoMensagem').style.visibility = 'hidden';
				
			} else{
				document.getElementById('asteriscoMensagem').style.visibility = 'visible';
			}
		}	catch(err){
		}	
	}

	/*Esta fun??o exibe os campos espec?ficos (e suas obrigatoriedades) de 
		cada tipo de resposta*/
	function exibeResposta(document, tipoResposta, tipoAcionador){
		//email
		if (tipoResposta == '1'){
			document.getElementById('carta').style.display='none';
			document.getElementById('asteriscoEmail').style.visibility='visible';
			document.getElementById('asteriscoTelefone').style.visibility='hidden';
			document.getElementById('asteriscoFax').style.visibility='hidden';
			return;
		}
		//Internet
		if (tipoResposta == '2'){
			document.getElementById('carta').style.display='none';
			document.getElementById('asteriscoEmail').style.visibility='hidden';
			document.getElementById('asteriscoTelefone').style.visibility='hidden';
			document.getElementById('asteriscoFax').style.visibility='hidden';
			return;
		}
		//Carta
		if (tipoResposta == '3'){
			document.getElementById('carta').style.display='';
			document.getElementById('asteriscoEmail').style.visibility='hidden';
			document.getElementById('asteriscoTelefone').style.visibility='hidden';
			document.getElementById('asteriscoFax').style.visibility='hidden';
			return;
		}
		//Telefone
		if (tipoResposta == '4'){
			document.getElementById('carta').style.display='none';
			document.getElementById('asteriscoEmail').style.visibility='hidden';
			document.getElementById('asteriscoTelefone').style.visibility='visible';
			document.getElementById('asteriscoFax').style.visibility='hidden';
			return;
		} 
		//Fax
		if (tipoResposta == '5'){
			document.getElementById('carta').style.display='none';
			document.getElementById('asteriscoEmail').style.visibility='hidden';
			document.getElementById('asteriscoTelefone').style.visibility='hidden';
			document.getElementById('asteriscoFax').style.visibility='visible';
			return;
		} 
	}
	
	/*Esta fun??o mostra ou n?o a lista de estados, dependendo do pa?s escolhido*/
	function exibeUF(document,pais){
		if(pais=='1'){
			document.getElementById('UFResidencia').style.visibility = 'visible';
		}else{
			document.forms[0].uf.value='0';
			document.getElementById('UFResidencia').style.visibility = 'hidden';
		}
	}
	
	/*Esta fun??o mostra ou n?o a lista de estados, dependendo do pa?s escolhido*/
	function exibeUFCarta(document,pais){
		if(pais=='1'){
			document.forms[0].ufCarta.disabled=false;
			document.getElementById('asteriscoUfCarta').style.visibility = 'visible';
		}else{
			document.forms[0].ufCarta.value='0';
			document.forms[0].ufCarta.disabled=true;
			document.getElementById('asteriscoUfCarta').style.visibility = 'hidden';
		}
	}
	
	
	function setaFocoInicio(document){
		//var focusControl = document.getElementById('titulo');
  		//focusControl.focus();
  		
  		document.getElementById('titulo').focus();
	}
	
	function setaFocoMatricula(document,tipoAcionador){
		if (tipoAcionador == 4){
			document.forms[0].matriculaAcionadorFuncionario.focus();
		}
	}

	function retornaStringMensagemErro(campo){
		var str;
		str  = '<li tabindex="3">';
		str += campo;
		str += ' deve ser preenchido.</li>';
		return str;
	}
	
	function retornaStringMensagemErroValor(campo, tipo){
	
		var str;
		str  = '<li tabindex="3">';
		str += campo;
		str += ' deve ser formado apenas por ' + tipo + '.</li>';
		return str;
	}

	function retornaStringMensagemErroInvalido(campo){
		var str;
		str  = '<li tabindex="3">';
		str += campo;
		str += ' deve ser um valor valido.</li>';
		
		return str;
	}
	
	function validaForm( document )
	{
		var innerHtmlMsgErros = '';
		
		if(document.forms[0].tipoMensagem.value=='0')
		{
			innerHtmlMsgErros += retornaStringMensagemErro('Tipo de Mensagem');
		}
		if(document.forms[0].assunto.value=='0')
		{
			innerHtmlMsgErros += retornaStringMensagemErro('Assunto da Mensagem');
		}
		if (document.forms[0].localidadeOcorrencia)
		{
			if((document.forms[0].localidadeOcorrencia.value=='0')&&
			   (document.forms[0].assunto.value!='0')
			   &&document.forms[0].localidadeOcorrencia.options.length > 2)
			{
				innerHtmlMsgErros += retornaStringMensagemErro('Localidade da Ocorrencia');
			}
		}	
		
		try
		{
			if(document.forms[0].mensagemDigitalizada.value=='')
			{
					if(document.forms[0].mensagem.value=='')
					{
			            innerHtmlMsgErros += CriticaString( document.forms[0].mensagem, 10, 1000, 'Mensagem' );
					}
			}
		}
		catch(err)
		{
            innerHtmlMsgErros += CriticaString( document.forms[0].mensagem, 10, 1000, 'Mensagem' );
		}

		if(document.forms[0].tipoAcionador.value=='0')
		{
			innerHtmlMsgErros += retornaStringMensagemErro('Tipo de Usuario');
		}
		else
		{
			if (document.forms[0].tipoAcionador.value=='2')
			{
             	limpaCampoEmBranco(document.forms[0].nomePessoaFisica);	
                innerHtmlMsgErros += CriticaString( document.forms[0].nomePessoaFisica, 3, 100, 'Nome' );
			}
			if (document.forms[0].tipoAcionador.value=='3')
			{
                innerHtmlMsgErros += CriticaString( document.forms[0].razaoSocialAcionadorPessoaJuridica, 3, 150, 'Razao Social' );
                innerHtmlMsgErros += CriticaString( document.forms[0].cnpjAcionadorPessoaJuridica, 14, 14, 'CNPJ' );
                innerHtmlMsgErros += CriticaString( document.forms[0].cpfAcionadorPessoaJuridica , 11, 11, 'CPF do Acionador' );

				if(document.forms[0].nomeContatoAcionadorPessoaJuridica.value!='')
				{
	                innerHtmlMsgErros += CriticaString( document.forms[0].nomeContatoAcionadorPessoaJuridica, 3, 100, 'Nome de contato' );
				}

			} else {
				if (document.forms[0].tipoAcionador.value=='4')
				{
	                innerHtmlMsgErros += CriticaString( document.forms[0].matriculaAcionadorFuncionario, 3, 15, 'Matricula' );

				    var num = document.forms[0].matriculaAcionadorFuncionario.value;
					if( isNaN(num) )
					{
						innerHtmlMsgErros += retornaStringMensagemErroGeral('Campo Matricula devera conter somente numeros.');
					}
                    innerHtmlMsgErros += CriticaString( document.forms[0].cpfAcionadorFuncionario , 11, 11, 'CPF' );
				}
			}
		}
		if(document.forms[0].meioEnvioResposta.value=='1'){
			if (document.forms[0].tipoAcionador.value != '1'){
                innerHtmlMsgErros += CriticaString( document.forms[0].email, 1, 50, 'Devido a sua opcao de resposta, o campo e-mail' );
			}
		} else {
			if(document.forms[0].meioEnvioResposta.value=='3'){
                innerHtmlMsgErros += CriticaString( document.forms[0].logradouroCarta, 3, 150, 'Logradouro' );
                innerHtmlMsgErros += CriticaString( document.forms[0].bairroCarta    , 3,  50, 'Bairro'     );
                innerHtmlMsgErros += CriticaString( document.forms[0].cidadeCarta    , 3,  50, 'Cidade'     );
                innerHtmlMsgErros += CriticaString( document.forms[0].cepCarta       , 8,   8, 'Cep'        );

				if (!isInteger(document.forms[0].cepCarta.value)){
					innerHtmlMsgErros += retornaStringMensagemErroValor('CEP', 'numeros');
				}
				
				if(document.forms[0].paisCarta.value=='1'){
					if(document.forms[0].ufCarta.value=='0'){
						innerHtmlMsgErros += retornaStringMensagemErro('UF do endereco para correspondencia');
					}	
				}
			} else {
				if (( document.forms[0].meioEnvioResposta.value == '4' ) &&
					( document.forms[0].tipoAcionador.value     != '1' ))
				{
					innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoPaisTelefone  , 2, 2, 0, 'Devido a sua opcao de resposta, o campo codigo do pais do telefone' );
					innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoCidadeTelefone, 2, 2, 0, 'Devido a sua opcao de resposta, o campo codigo de area do telefone' );
					innerHtmlMsgErros += CriticaNumero( document.forms[0].telefone            , 6, 8, 0, 'Devido a sua opcao de resposta, o campo numero do telefone' );
				}
				else if (( document.forms[0].codigoCidadeTelefone != "" ) ||
					     ( document.forms[0].telefone             != "" ))
				{
					if ( document.forms[0].codigoPaisTelefone.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoPaisTelefone  , 2, 2, 0, 'Se preenchido, o campo codigo do pais do telefone' );
					}
					if ( document.forms[0].codigoCidadeTelefone.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoCidadeTelefone, 2, 2, 0, 'Se preenchido, o campo codigo de area do telefone' );
					}
					if ( document.forms[0].telefone.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].telefone            , 6, 8, 0, 'Se preenchido, o campo numero do telefone' );
					}
				}

				if (( document.forms[0].meioEnvioResposta.value == '5' ) &&
					( document.forms[0].tipoAcionador.value     != '1' ))
				{
					innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoPaisFax  , 2, 2, 0, 'Devido a sua opcao de resposta, o campo codigo do pais do fax' );
					innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoCidadeFax, 2, 2, 0, 'Devido a sua opcao de resposta, o campo codigo de area do fax' );
					innerHtmlMsgErros += CriticaNumero( document.forms[0].fax            , 6, 8, 0, 'Devido a sua opcao de resposta, o campo numero do fax' );
				}
				else if (( document.forms[0].codigoCidadeFax != "" ) ||
					     ( document.forms[0].fax             != "" ))
				{
					if ( document.forms[0].codigoPaisFax.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoPaisFax  , 2, 2, 0, 'Se preenchido, o campo codigo do pais do fax' );
					}
					if ( document.forms[0].codigoCidadeFax.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].codigoCidadeFax, 2, 2, 0, 'Se preenchido, o campo codigo de area do fax' );
					}
					if ( document.forms[0].fax.value != "" )
					{
						innerHtmlMsgErros += CriticaNumero( document.forms[0].fax            , 6, 8, 0, 'Se preenchido, o campo numero do fax' );
					}
				}
			}
		}
		try{
			if ( document.forms[0].checkRecuperaCodigoAcesso.checked )
			{
				if(document.forms[0].pergunta.value==''){
					innerHtmlMsgErros += retornaStringMensagemErro('Pergunta');
				}
				if(document.forms[0].resposta.value==''){
					innerHtmlMsgErros += retornaStringMensagemErro('Resposta');
				}
			}
		} catch(err){}
	
	    // Se acionador n?o for an?nimo, verifica email
		if (( document.forms[0].tipoAcionador.value != '1') &&
		    (document.forms[0].email.value != '')) {
			if (!validaEmail(document.forms[0].email.value)){
				innerHtmlMsgErros += retornaStringMensagemErroInvalido('Email');
			}	
		}

	    // Se acionador for pessoa f?sica, verifica cpf
		if ((document.forms[0].tipoAcionador.value=='2') &&
		    (document.forms[0].cpfAcionadorPessoaFisica.value != '')) {
			if (!validaCPF(document.forms[0].cpfAcionadorPessoaFisica.value)){
				innerHtmlMsgErros += retornaStringMensagemErroInvalido('CPF');
			}	
		}

	    // Se acionador for pessoa jur?dica, verifica cpf do acionador	    
		if ((document.forms[0].tipoAcionador.value=='3') &&
			(document.forms[0].cpfAcionadorPessoaJuridica.value != '')) {
			if (!validaCPF(document.forms[0].cpfAcionadorPessoaJuridica.value)){
				innerHtmlMsgErros += retornaStringMensagemErroInvalido('CPF do Acionador');
			}	
		}
		
		// Se acionador for funcion?rio, verifica cpf 		
		if ((document.forms[0].tipoAcionador.value=='4') &&
			(document.forms[0].cpfAcionadorFuncionario.value != '')) {
			if (!validaCPF(document.forms[0].cpfAcionadorFuncionario.value)){
				innerHtmlMsgErros += retornaStringMensagemErroInvalido('CPF');
			}	
		}				

		// Valida CNPJ, caso o acionador seja PJ
		if ((document.forms[0].tipoAcionador.value=='3') &&
		 	(document.forms[0].cnpjAcionadorPessoaJuridica.value != '')) {
			if (!ValidarCNPJ(document.forms[0].cnpjAcionadorPessoaJuridica)){
				innerHtmlMsgErros += retornaStringMensagemErroInvalido('CNPJ');
			}	
		}		

		/* Vari?vel 'emw_userLogged' vem de EnviarMensagemWeb.jsp */
		if ( emw_userLogged )
		{
			if( document.forms[0].meioRecebimento.value == '0' )
			{
				innerHtmlMsgErros += retornaStringMensagemErro( 'Meio de Recebimento' );
			}
		}

// ------------

		innerHtmlMsgErros += CriticaNumero(document.forms[0].validacao, 4, 4, 0, "Validacao" );

        if( innerHtmlMsgErros == '' )
        {
			document.forms[0].submit();
		}
		else
		{
			document.forms[0].validacao.value = '';
			abreAlerta(innerHtmlMsgErros);
		}
		
	}
	
	/* 
		Fun??o que faz valida??o de email
		S? exige que haja algum caracter antes do arroba,
		algum caracter entre o arroba e um ponto e algum caracter depois
		do ponto
	*/
	function validaEmail(email){
		var arroba;
		var ponto;
		var stringAntesArroba;
		var stringDepoisArroba1;
		var stringDepoisArroba2;
		
		arroba = email.indexOf('@');
		
		if (arroba == -1) return false;
		stringAntesArroba = email.substring(0,arroba);
		if (stringAntesArroba.length <= 0){
			return false;	
		}
		email = email.substring(arroba+1);
		ponto = email.indexOf('.');
		
		if (ponto == -1) return false;
		stringDepoisArroba1 = email.substring(0,ponto);
		if (stringDepoisArroba1.length <= 0){
			return false;	
		}
		stringDepoisArroba2 = email.substring(ponto+1);
		if (stringDepoisArroba2.length <= 0){
			return false;	
		}
		return true;
	}
	
