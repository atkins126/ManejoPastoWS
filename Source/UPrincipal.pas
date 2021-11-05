unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,
  Horse,
  Horse.Jhonson,
  System.JSON, Horse.HandleException,Winapi.Windows, FireDAC.Phys.PGDef,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client,System.Json.writers,System.IniFiles,System.JSON.Types,
  IdBaseComponent, IdComponent, IdIPWatch, FMX.Memo.Types;

type
  TfrmPrincipal = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Image1: TImage;
    mlog: TMemo;
    btnFechar: TImage;
    FDConPG: TFDConnection;
    PgDriverLink: TFDPhysPgDriverLink;
    IdIPWatch1: TIdIPWatch;
    lblWS: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    function GetVersaoArq: string;
  public
    function ConectaPG_LOCAL: TJSONObject;
    function LerIni(Diretorio,Chave1, Chave2, ValorPadrao: String): String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses dmLocal;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
 Application.Terminate;
end;

function TfrmPrincipal.ConectaPG_LOCAL: TJSONObject;
var
 Arquivo,
 vVendorLib,
 dbUser,
 dbPassw,
 dbName,
 dbServer,
 dbPort,vRDS: String;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
begin
 StrAux  := TStringWriter.Create;
 txtJson := TJsonTextWriter.Create(StrAux);
 Arquivo := ExtractFilePath(ParamStr(0))+'pecuarizze.ini';
 if not FileExists(Arquivo) then
 begin
   txtJson.WriteStartObject;
   txtJson.WritePropertyName('Erro');
   txtJson.WriteValue('Arquivo pecuarizze.ini não localizado no seguinte diretorio:'+
   Arquivo);
   txtJson.WriteEndObject;
   Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
 end
 else
 begin
   vVendorLib := ExtractFilePath(ParamStr(0))+'DrivesDB\libpq_32.dll';
   dbName     := LerIni(Arquivo,'LOCAL','Database','');
   dbServer   := LerIni(Arquivo,'LOCAL','Server','');
   vRDS       := LerIni(Arquivo,'LOCAL','RDS','');
   with FDConPG do
   begin
    Params.Clear;
    if vRDS='N' then
    begin
     Params.Values['DriverID']        := 'PG';
     Params.Values['User_name']       := 'postgres';
     Params.Values['Database']        := dbName;
     Params.Values['Password']        := 'Dev#110485';
     Params.Values['DriverName']      := 'PG';
     Params.Values['Server']          := dbServer;
     Params.Values['Port']            := '5432';
     PgDriverLink.VendorLib           := vVendorLib;
    end
    else
    begin
     Params.Values['DriverID']        := 'PG';
     Params.Values['User_name']       := 'postgres';
     Params.Values['Database']        := dbName;
     Params.Values['Password']        := 'Dev#110485';
     Params.Values['DriverName']      := 'PG';
     Params.Values['Server']          := 'solotecsolucoes.chhbmii57c8o.us-east-2.rds.amazonaws.com';
     Params.Values['Port']            := '5432';
     PgDriverLink.VendorLib           := vVendorLib;
    end;
   try
     Connected := true;
     txtJson.WriteStartObject;
     txtJson.WritePropertyName('Mensagem');
     txtJson.WriteValue('Conexao OK');
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      frmPrincipal.mlog.Lines.Add(E.Message);
      StrAux  := TStringWriter.Create;
      txtJson := TJsonTextWriter.Create(StrAux);
      txtJson.Formatting := TJsonFormatting.Indented;
      txtJson.WriteStartObject;
      txtJson.WritePropertyName('Erro');
      txtJson.WriteValue('Erro Ao Conectar DB Pedido:'+E.Message);
      txtJson.WriteEndObject;
      Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 end;
end;



function TfrmPrincipal.GetVersaoArq: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(
  ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0,
  VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue),
  VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(
    dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function TfrmPrincipal.LerIni(Diretorio, Chave1, Chave2,
  ValorPadrao: String): String;
var
 FileIni: TIniFile;
begin
  result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Diretorio);
    if FileExists(Diretorio) then
      result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
//  ConectaPG_AWS;
  ConectaPG_LOCAL;
  THorse.Use(Jhonson);
  THorse.Use(HandleException);
  THorse.Get('/ping',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
    Res.Send('pong');
  end);
  THorse.Listen(8099, procedure(Horse: THorse)
  begin
    lblWS.Text := ('WS Pecuarizze Rodando no ip:'+IdIPWatch1.LocalIP+' na porta: ' + Horse.Port.ToString+' Versão:'+GetVersaoArq);
    Application.ProcessMessages;
  end);
//Metodos ADM***********************************************************************
  THorse.Get('/conectadb',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
   T: TJSONObject;
   vJsonString :string;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB AWS');
     try
//      T:= ConectaPG_AWS;
      vjsonString:=copy(T.ToString,2,6);
      if vjsonString<>'"Erro"' then
      begin
       Res.Send(tjsonobject.Create.AddPair('OK','Conectado com sucesso!')).Status(200);
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
      end
      else
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db AWS ');
       Res.Send(tjsonobject.Create.AddPair('Erro','Error ao conectar db!')).Status(201);
      end;
      except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db AWS '+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro','Error ao conectar db local!')).Status(201);
       end
     end;
  end);

  THorse.Post('/AutCliente',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Autenticando Cliente');
    LBody := Req.Body<TJSONObject>;
    try
//     LBodyRed:=dmMetodos.AtenticaCliente(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);
//Metodos Cliente***********************************************************************
 THorse.Get('/conectadblocal',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
   T: TJSONObject;
   vJsonString :string;
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conecta DB Local');
     try
      T:= ConectaPG_LOCAL;
      vjsonString:=copy(T.ToString,2,6);
      if vjsonString<>'"Erro"' then
      begin
       Res.Send(tjsonobject.Create.AddPair('OK','Conectado com sucesso!')).Status(200);
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Conectado Com Sucesso!');
      end
      else
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db local ');
       Res.Send(tjsonobject.Create.AddPair('Erro','Error ao conectar db!')).Status(201);
      end;
      except on ex:exception do
       begin
        mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error ao conectar db local '+ex.Message);
        Res.Send(tjsonobject.Create.AddPair('Erro','Error ao conectar db local!')).Status(201);
       end
     end;
  end);

  THorse.Get('/GetTesteServidor',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Testando Servidor');
     try
//      Res.Send<TJSONObject>(dmLocal.GetTestaServidor);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetUsuario',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Usuarios');
     try
      Res.Send<TJSONObject>(dmdb.GetUsuarios);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetCapim',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Capim');
     try
      Res.Send<TJSONObject>(dmdb.GetAuxCapim);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetCategoria',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Categoria');
     try
      Res.Send<TJSONObject>(dmdb.GetAuxCategoria);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetRetiro',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Retiro');
     try
      Res.Send<TJSONObject>(dmdb.GetRetiro);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetPasto',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Pasto');
     try
      Res.Send<TJSONObject>(dmdb.GetPasto);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetHistScore',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Historico Score');
     try
      Res.Send<TJSONObject>(dmdb.GetHistEscore);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

  THorse.Get('/GetDetAnimaPasto',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  begin
     mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Baixando Det Animal Pasto');
     try
      Res.Send<TJSONObject>(dmdb.GetAnimalPasto);
     except on ex:exception do
      begin
       mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' : Error '+ex.Message);
       Res.Send(tjsonobject.Create.AddPair('Erro',ex.Message)).Status(201);
      end;
     end;
  end);

 THorse.Post('/PostScore',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Score de Pasto');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmdb.PostScore(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);

  THorse.Post('/DetAnimalPasto',
  procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
  var
    LBody,LBodyRed: TJSONObject;
  begin
    mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Recebendo Det Animal Pasto');
    LBody := Req.Body<TJSONObject>;
    try
     LBodyRed:=dmdb.PostDetAnimalPasto(LBody);
     Res.Send(LBodyRed).Status(200)
     except on ex:exception do
     begin
      mLog.Lines.Add(FormatDateTime('dd-mm-yyyy-hh:mm:ss',now)+' Erro :'+ex.Message);
      Res.Send(tjsonobject.Create.AddPair('Mensagem', ex.Message)).Status(500);
     end;
    end;
  end);
end;

end.

