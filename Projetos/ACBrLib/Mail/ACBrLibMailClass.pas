﻿{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrLibMailClass;

interface

uses
  Classes, SysUtils, typinfo,
  ACBrLibComum, ACBrLibMailDataModule, ACBrMail;

type

  { TACBrLibMail }

  TACBrLibMail = class(TACBrLib)
  private
    FMailDM: TLibMailDM;

  protected
    procedure Inicializar; override;
    procedure CriarConfiguracao(ArqConfig: string = ''; ChaveCrypt: ansistring = '');
      override;
    procedure Executar; override;
  public
    constructor Create(ArqConfig: string = ''; ChaveCrypt: ansistring = ''); override;
    destructor Destroy; override;

    property MailDM: TLibMailDM read FMailDM;
  end;

{%region Declaração da funções}

{%region Redeclarando Métodos de ACBrLibComum, com nome específico}
function MAIL_Inicializar(const eArqConfig, eChaveCrypt: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_Finalizar: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_Nome(const sNome: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_Versao(const sVersao: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_UltimoRetorno(const sMensagem: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_ConfigLer(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_ConfigGravar(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_ConfigLerValor(const eSessao, eChave: PChar; sValor: PChar;
  var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_ConfigGravarValor(const eSessao, eChave, eValor: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
{%endregion}

{%region Diversos}
function MAIL_AddAddress(eEmail: PChar; eName: PChar = ''): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_AddReplyTo(eEmail: PChar; eName: PChar = ''): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_AddCC(eEmail: PChar; eName: PChar = ''): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_AddBCC(eEmail: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_ClearAttachment: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_AddAttachment(eFileName: PChar; eDescription: PChar = '';
            const aDisposition: TMailAttachmentDisposition = adInline): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_AddAttachmentStream(aStream: TStream; eDescription: PChar = '';
            const aDisposition: TMailAttachmentDisposition = adInline): longint;
 {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};

function MAIL_MailProcess(const aStatus: TMailStatus): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_SaveToFile(const eFileName: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_SaveToStream(AStream: TStream): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
{%endregion}

{%region Envio}
function MAIL_Clear: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_BuildMimeMess: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
function MAIL_Send(UseThreadNow: Boolean): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
{%endregion}

{%endregion}

implementation

uses
  ACBrLibConsts, ACBrLibMailConsts, ACBrLibConfig, ACBrLibMailConfig;

{ TACBrLibMail }

constructor TACBrLibMail.Create(ArqConfig: string; ChaveCrypt: ansistring);
begin
  inherited Create(ArqConfig, ChaveCrypt);
  fpNome := CLibMailNome;
  fpVersao := CLibMailVersao;

  FMailDM := TLibMailDM.Create(nil);
end;

destructor TACBrLibMail.Destroy;
begin
  FMailDM.Free;
  inherited Destroy;
end;

procedure TACBrLibMail.Inicializar;
begin
  inherited Inicializar;

  GravarLog('TACBrLibMail.Inicializar - Feito', logParanoico);
end;

procedure TACBrLibMail.CriarConfiguracao(ArqConfig: string; ChaveCrypt: ansistring);
begin
  fpConfig := TLibMailConfig.Create(Self, ArqConfig, ChaveCrypt);
end;

procedure TACBrLibMail.Executar;
begin
  inherited Executar;
  FMailDM.AplicarConfiguracoes;
end;

{%region Mail}

{%region Redeclarando Métodos de ACBrLibComum, com nome específico}
function MAIL_Inicializar(const eArqConfig, eChaveCrypt: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_Inicializar(eArqConfig, eChaveCrypt);
end;

function MAIL_Finalizar: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_Finalizar;
end;

function MAIL_Nome(const sNome: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_Nome(sNome, esTamanho);
end;

function MAIL_Versao(const sVersao: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_Versao(sVersao, esTamanho);
end;

function MAIL_UltimoRetorno(const sMensagem: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_UltimoRetorno(sMensagem, esTamanho);
end;

function MAIL_ConfigLer(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_ConfigLer(eArqConfig);
end;

function MAIL_ConfigGravar(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_ConfigGravar(eArqConfig);
end;

function MAIL_ConfigLerValor(const eSessao, eChave: PChar; sValor: PChar;
  var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_ConfigLerValor(eSessao, eChave, sValor, esTamanho);
end;

function MAIL_ConfigGravarValor(const eSessao, eChave, eValor: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  Result := LIB_ConfigGravarValor(eSessao, eChave, eValor);
end;
{%endregion}

{%region Diversos}
function MAIL_AddAddress(eEmail: PChar; eName: PChar = ''): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AEmail: AnsiString;
  AName: AnsiString;
begin
  try
    VerificarLibInicializada;
    AEmail := AnsiString(eEmail);
    AName := AnsiString(eName);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddAddress( ' + AEmail + ',' + AName + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddAddress', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddAddress(AEmail, AName);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_AddReplyTo(eEmail: PChar; eName: PChar = ''): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AEmail: AnsiString;
  AName: AnsiString;
begin
  try
    VerificarLibInicializada;
    AEmail := AnsiString(eEmail);
    AName := AnsiString(eName);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddReplyTo( ' + AEmail + ',' + AName + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddReplyTo', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddReplyTo(AEmail, AName);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_AddCC(eEmail: PChar; eName: PChar = ''): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AEmail: AnsiString;
  AName: AnsiString;
begin
  try
    VerificarLibInicializada;
    AEmail := AnsiString(eEmail);
    AName := AnsiString(eName);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddCC( ' + AEmail + ',' + AName + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddCC', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddCC(AEmail, AName);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_AddBCC(eEmail: PChar): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AEmail: AnsiString;
begin
  try
    VerificarLibInicializada;
    AEmail := AnsiString(eEmail);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddBCC( ' + AEmail + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddBCC', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddBCC(AEmail);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_ClearAttachment: longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    pLib.GravarLog('MAIL_ClearAttachment', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.ClearAttachments;
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_AddAttachment(eFileName: PChar; eDescription: PChar = '';
  const aDisposition: TMailAttachmentDisposition = adInline): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AFileName: AnsiString;
  ADescription: AnsiString;
begin
  try
    VerificarLibInicializada;
    AFileName := AnsiString(eFileName);
    ADescription := AnsiString(eDescription);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddAttachment( ' + AFileName + ',' + ADescription {+
             TMailAttachmentDisposition(aDisposition)} + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddAttachment', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddAttachment(AFileName, ADescription, aDisposition);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_AddAttachmentStream(aStream: TStream; eDescription: PChar = '';
  const aDisposition: TMailAttachmentDisposition = adInline): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  ADescription: AnsiString;
begin
  try
    VerificarLibInicializada;
    ADescription := AnsiString(eDescription);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_AddAttachmentStream( ' + {AFileName + ',' +} ADescription {+
             TMailAttachmentDisposition(aDisposition)} + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_AddAttachmentStream', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.AddAttachment(aStream, ADescription, aDisposition);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_MailProcess(const aStatus: TMailStatus): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_MailProcess( ' {+ TMailStatus(aStatus)} + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_MailProcess', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.MailProcess(aStatus);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_SaveToFile(const eFileName: PChar): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
var
  AFileName: AnsiString;
begin
  try
    VerificarLibInicializada;
    AFileName := AnsiString(eFileName);

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_MailProcess( ' + AFileName + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_MailProcess', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.SaveToFile(AFileName);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_SaveToStream(aStream: TStream): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_SaveToStream( ' + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_SaveToStream', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.SaveToStream(aStream);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;
{%endregion}

{%region Envio}
function MAIL_Clear: longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    pLib.GravarLog('MAIL_Clear', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.Clear;
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_BuildMimeMess: longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    pLib.GravarLog('MAIL_BuildMimeMess', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.BuildMimeMess;
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function MAIL_Send(UseThreadNow: Boolean): longint;{$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf};
begin
  try
    VerificarLibInicializada;

    if pLib.Config.Log.Nivel > logNormal then
      pLib.GravarLog('MAIL_Send( ' + BoolToStr(UseThreadNow, True) + ' )', logCompleto, True)
    else
      pLib.GravarLog('MAIL_Send', logNormal);

    with TACBrLibMail(pLib) do
    begin
      MailDM.Travar;
      try
        MailDM.ACBrMail1.Send(UseThreadNow);
        Result := SetRetorno(ErrOK);
      finally
        MailDM.Destravar;
      end;
    end;
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;
{%endregion}

{%endregion}

end.
