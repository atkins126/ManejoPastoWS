unit dmLocal;

interface

 uses System.SysUtils, System.Classes, System.Json,
  vcl.Forms, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageJSON, FireDAC.Stan.StorageBin,
  System.Json.writers,System.JSON.Types, FireDAC.Phys.PGDef, FireDAC.Phys.PG,
  FireDAC.Phys.ODBCBase,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef,System.IniFiles, FireDAC.FMXUI.Wait,FMX.Dialogs,
  FireDAC.Phys.IBBase,IdSSLOpenSSL,IdSMTP,IdMessage,IdText,IdExplicitTLSClientServerBase,
  IdAttachmentFile, FireDAC.Comp.BatchMove,System.Variants, FireDAC.Comp.BatchMove.JSON,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  System.Net.HttpClient,FMX.Types,System.Net.URLClient,
  System.Net.HttpClientComponent, FireDAC.ConsoleUI.Wait,FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;
type
  TdmDB = class(TDataModule)
    TUsuario: TFDQuery;
    TUsuarioid: TIntegerField;
    TUsuarionome: TWideStringField;
    TUsuarioemail: TWideStringField;
    TUsuariotelefone: TWideStringField;
    TUsuariotipo: TIntegerField;
    TUsuariousuario: TWideStringField;
    TUsuariosenha: TWideStringField;
    TUsuariodataregistro: TSQLTimeStampField;
    TUsuariostatus: TIntegerField;
    TUsuarioidcliente: TIntegerField;
    TAuxCategoria: TFDQuery;
    TAuxCategoriaid: TIntegerField;
    TAuxCategoriastatus: TIntegerField;
    TAuxCategoriadatareg: TSQLTimeStampField;
    TAuxCategoriaidusuario: TIntegerField;
    TAuxCategoriadataalteracao: TSQLTimeStampField;
    TAuxCategoriaidusuarioalteracao: TIntegerField;
    TAuxCategorianome: TWideStringField;
    TAuxCategoriaidcliente: TIntegerField;
    TAuxCategoriasexo: TIntegerField;
    TAuxCapim: TFDQuery;
    TAuxCapimid: TIntegerField;
    TAuxCapimstatus: TIntegerField;
    TAuxCapimdatareg: TSQLTimeStampField;
    TAuxCapimidusuario: TIntegerField;
    TAuxCapimdataalteracao: TSQLTimeStampField;
    TAuxCapimidusuarioalteracao: TIntegerField;
    TAuxCapimnome: TWideStringField;
    TAuxCapimidcliente: TIntegerField;
    TRetiro: TFDQuery;
    TRetiroid: TIntegerField;
    TRetirostatus: TIntegerField;
    TRetirodatareg: TSQLTimeStampField;
    TRetiroidusuario: TIntegerField;
    TRetirodataalteracao: TSQLTimeStampField;
    TRetiroidusuarioalteracao: TIntegerField;
    TRetiroidcliente: TIntegerField;
    TRetironome: TWideStringField;
    TRetirolatitude: TWideStringField;
    TRetirolongitude: TWideStringField;
    TRetiroareahectare: TBCDField;
    TPasto: TFDQuery;
    TPastoid: TIntegerField;
    TPastostatus: TIntegerField;
    TPastodatareg: TSQLTimeStampField;
    TPastoidusuario: TIntegerField;
    TPastodataalteracao: TSQLTimeStampField;
    TPastoidusuarioalteracao: TIntegerField;
    TPastoidretiro: TIntegerField;
    TPastonome: TWideStringField;
    TPastolatitude: TWideStringField;
    TPastolongitude: TWideStringField;
    TPastoareahectare: TBCDField;
    TPastoqtdeanimais: TIntegerField;
    TPastopesomedio: TBCDField;
    TPastoidcategoria: TIntegerField;
    TPastoidcapim: TIntegerField;
    TPastoidcliente: TIntegerField;
    THitscorepasto: TFDQuery;
    THitscorepastoid: TIntegerField;
    THitscorepastostatus: TIntegerField;
    THitscorepastodatareg: TSQLTimeStampField;
    THitscorepastoidusuario: TIntegerField;
    THitscorepastodataalteracao: TSQLTimeStampField;
    THitscorepastoidusuarioalteracao: TIntegerField;
    THitscorepastoidcliente: TIntegerField;
    THitscorepastoidpasto: TIntegerField;
    THitscorepastostatuspasto: TIntegerField;
    THitscorepastoscore: TBCDField;
    THitscorepastotaloxfolha: TIntegerField;
    THitscorepastoqtdcabeca: TIntegerField;
    THitscorepastoidcategoria: TIntegerField;
    THitscorepastopesomedio: TBCDField;
    THitscorepastodatacoleta: TDateField;
    THitscorepastohoracoleta: TTimeField;
    TScorePasto: TFDQuery;
    TScorePastoid: TIntegerField;
    TScorePastostatus: TIntegerField;
    TScorePastodatareg: TSQLTimeStampField;
    TScorePastoidusuario: TIntegerField;
    TScorePastodataalteracao: TSQLTimeStampField;
    TScorePastoidusuarioalteracao: TIntegerField;
    TScorePastoidcliente: TIntegerField;
    TScorePastoidpasto: TIntegerField;
    TScorePastostatuspasto: TIntegerField;
    TScorePastoscore: TBCDField;
    TScorePastotaloxfolha: TIntegerField;
    TScorePastoqtdcabeca: TIntegerField;
    TScorePastoidcategoria: TIntegerField;
    TScorePastopesomedio: TBCDField;
    TScorePastodatacoleta: TDateField;
    TScorePastohoracoleta: TTimeField;
    TDetAnimalPasto: TFDQuery;
    TDetAnimalPastoid: TIntegerField;
    TDetAnimalPastostatus: TIntegerField;
    TDetAnimalPastodatareg: TSQLTimeStampField;
    TDetAnimalPastoidusuario: TIntegerField;
    TDetAnimalPastodataalteracao: TSQLTimeStampField;
    TDetAnimalPastoidusuarioalteracao: TIntegerField;
    TDetAnimalPastoidpasto: TIntegerField;
    TDetAnimalPastoidcategoria: TIntegerField;
    TDetAnimalPastoqtdanimais: TIntegerField;
    TDetAnimalPastopesomedio: TBCDField;
    TDetAnimalPastodataentrada: TDateField;
    TDetAnimalPastodatasaida: TDateField;
    TDetAnimalPastotipo: TIntegerField;
    TDetAnimalPastoidscore: TIntegerField;
    TScore: TFDQuery;
    TScoreid: TIntegerField;
    TScorestatus: TIntegerField;
    TScoredatareg: TSQLTimeStampField;
    TScoreidusuario: TIntegerField;
    TScoredataalteracao: TSQLTimeStampField;
    TScoreidusuarioalteracao: TIntegerField;
    TScoreidcliente: TIntegerField;
    TScoreidpasto: TIntegerField;
    TScorestatuspasto: TIntegerField;
    TScorescore: TBCDField;
    TScoretaloxfolha: TIntegerField;
    TScoreqtdcabeca: TIntegerField;
    TScoreidcategoria: TIntegerField;
    TScorepesomedio: TBCDField;
    TScoredatacoleta: TDateField;
    TScorehoracoleta: TTimeField;
    TDetAnimalPastoGet: TFDQuery;
    TDetAnimalPastoGetid: TIntegerField;
    TDetAnimalPastoGetstatus: TIntegerField;
    TDetAnimalPastoGetdatareg: TSQLTimeStampField;
    TDetAnimalPastoGetidusuario: TIntegerField;
    TDetAnimalPastoGetdataalteracao: TSQLTimeStampField;
    TDetAnimalPastoGetidusuarioalteracao: TIntegerField;
    TDetAnimalPastoGetidpasto: TIntegerField;
    TDetAnimalPastoGetidcategoria: TIntegerField;
    TDetAnimalPastoGetqtdanimais: TIntegerField;
    TDetAnimalPastoGetpesomedio: TBCDField;
    TDetAnimalPastoGetdataentrada: TDateField;
    TDetAnimalPastoGetdatasaida: TDateField;
    TDetAnimalPastoGettipo: TIntegerField;
    TDetAnimalPastoGetidscore: TIntegerField;
    QryAux: TFDQuery;
  private
    function GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
    procedure VerificaScoreExiste(idPasto,vData:string);

  public
    function GetUsuarios: TJSONObject;
    function GetRetiro: TJSONObject;
    function GetPasto: TJSONObject;
    function GetAuxCategoria: TJSONObject;
    function GetAuxCapim: TJSONObject;
    function GetHistEscore: TJSONObject;
    function GetAnimalPasto: TJSONObject;
    function RetornaMaxId(vTable:string):string;
    function PostScore(obj: TJSONObject): TJSONObject;
    function PostDetAnimalPasto(obj: TJSONObject): TJSONObject;
  end;

var
  dmDB: TdmDB;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses UPrincipal;

{$R *.dfm}

{ TdmDB }
function TdmDB.PostScore(obj: TJSONObject): TJSONObject;
var
  I,X: Integer;
  JsonToSend :TStringStream;
  vField,vFieldJS:string;
  LJSon      : TJSONArray;
  StrAux     : TStringWriter;
  txtJson    : TJsonTextWriter;
  vQry       : TFDQuery;
  vIdResult  :string;
begin
  if frmPrincipal.FDConPG.Connected=false
   then frmPrincipal.ConectaPG_Local;
  TScorePasto.Connection :=frmPrincipal.FDConPG;
  vQry       := TFDQuery.Create(nil);
  vQry.Connection := frmPrincipal.FDConPG;
  JsonToSend := TStringStream.Create(obj.ToJSON);
  vQry.LoadFromStream(JsonToSend,sfJSON);
  vIdResult:='';
  TScore.Close;
  TScore.Open;
  while not vQry.eof do
  begin
    dmDB.VerificaScoreExiste(vQry.FieldByName('idPasto').AsString,
     FormatDateTime('yyyy-mm-dd',vQry.FieldByName('datacoleta').AsDateTime).QuotedString);
    if TScore.IsEmpty then
     TScore.Append
    else
     TScore.Edit;
    for x := 0 to TScore.Fields.Count -1 do
    begin
     vField  := StringReplace(TScore.Fields[x].Name,'TScore','',[rfReplaceAll]);
     if (vField<>'datareg') and (vField<>'id') then
      if vField='qtdcabeca' then
      begin
        if vQry.FieldByName(vField).AsString.Length=0 then
         TScore.FieldByName(vField).AsInteger:= 0;
      end
      else
       TScore.FieldByName(vField).AsString     := vQry.FieldByName(vField).AsString;
    end;
    try
     TScore.Post;
     if vIdResult.Length>0 then
      vIdResult:=vIdResult+','+vQry.FieldByName('id').AsString
     else
      vIdResult:=vQry.FieldByName('id').AsString;
     vQry.Next;
    except
      on E: Exception do
      begin
        StrAux  := TStringWriter.Create;
        txtJson := TJsonTextWriter.Create(StrAux);
        txtJson.Formatting := TJsonFormatting.Indented;
        txtJson.WriteStartObject;
        txtJson.WritePropertyName('Erro');
        txtJson.WriteValue('Erro Ao Sincronizar Movimentação de Combustivel:'+E.Message);
        txtJson.WriteEndObject;
        Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
        Exit;
      end;
    end;
  end;
  StrAux  := TStringWriter.Create;
  txtJson := TJsonTextWriter.Create(StrAux);
  txtJson.Formatting := TJsonFormatting.Indented;
  txtJson.WriteStartObject;
  txtJson.WritePropertyName('OK');
  txtJson.WriteValue(vIdResult);
  txtJson.WriteEndObject;
  Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
end;

function TdmDB.RetornaMaxId(vTable: string): string;
begin
 with QryAux,QryAux.SQL do
 begin
   Clear;
   Add('select max(id)max_id from '+vTable);
   Open;
   Result:= FieldByName('max_id').AsString;
 end;
end;

function TdmDB.PostDetAnimalPasto(obj: TJSONObject): TJSONObject;
var
 vJsonString,vIdentificador :string;
 vJoInsert,vJoItemO,vJoItemO1 : TJSONObject;
 vJoItem,vJoItem1   : TJSONArray;
 LJSon      : TJSONArray;
 StrAux     : TStringWriter;
 txtJson    : TJsonTextWriter;
 I          : Integer;
begin
 if frmPrincipal.FDConPG.Connected=false then
  frmPrincipal.ConectaPG_Local;
 vJsonString := obj.ToString;
 vJoInsert := TJSONObject.ParseJSONValue(vJsonString) as TJSONObject;
 vJoItem := vJoInsert.GetValue('TDetAnimalPasto') as TJSONArray;
 frmPrincipal.mlog.Lines.Add('Sincronizando Det Animal Pasto');
 frmPrincipal.mlog.Lines.Add(vJsonString);
 TDetAnimalPasto.Close;
 TDetAnimalPasto.Open;
 try
  for i := 0 to vJoItem.Count-1 do
  begin
    vJoItemO := vJoItem.Items[I] as TJSONObject;
    frmPrincipal.mlog.Lines.Add('Lendo e Inserindo Json');
    TDetAnimalPasto.append;
    TDetAnimalPastoidusuario.AsString             := vJoItemO.GetValue('status').value;
    TDetAnimalPastoidusuario.AsString             := vJoItemO.GetValue('idusuario').value;
    TDetAnimalPastoidpasto.AsString               := vJoItemO.GetValue('idpasto').value;
    TDetAnimalPastoidcategoria.AsString           := vJoItemO.GetValue('idcategoria').value;
    TDetAnimalPastoqtdanimais.AsString            := vJoItemO.GetValue('qtdanimais').value;
    TDetAnimalPastopesomedio.AsString             := vJoItemO.GetValue('pesomedio').value;
    if vJoItemO.GetValue('dataentrada').value.Length>0 then
     TDetAnimalPastodataentrada.AsString          := vJoItemO.GetValue('dataentrada').value;
    if vJoItemO.GetValue('datasaida').value.Length>0 then
     TDetAnimalPastodatasaida.AsString            := vJoItemO.GetValue('datasaida').value;
    TDetAnimalPastotipo.AsString                  := vJoItemO.GetValue('tipo').value;
    try
     frmPrincipal.mlog.Lines.Add('Confirmando Inserção');
     TDetAnimalPasto.Post;
     vIdentificador := RetornaMaxId('detanimaispasto');
     StrAux  := TStringWriter.Create;
     txtJson := TJsonTextWriter.Create(StrAux);
     txtJson.Formatting := TJsonFormatting.Indented;
     txtJson.WriteStartObject;
     frmPrincipal.mlog.Lines.Add('Enviado com Sucesso!');
     txtJson.WritePropertyName('Ok');
     txtJson.WriteValue(vIdentificador);
     txtJson.WriteEndObject;
     Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
    except
     on E: Exception do
     begin
      StrAux  := TStringWriter.Create;
       txtJson := TJsonTextWriter.Create(StrAux);
       txtJson.Formatting := TJsonFormatting.Indented;
       txtJson.WriteStartObject;
       txtJson.WritePropertyName('Erro');
       frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Det Animal Pasto:'+E.Message);
       txtJson.WriteValue('Erro Ao Sincronizar Det Animal Pasto:'+E.Message);
       txtJson.WriteEndObject;
       Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
     end;
    end;
  end;
 except
 on E: Exception do
   begin
    StrAux  := TStringWriter.Create;
    txtJson := TJsonTextWriter.Create(StrAux);
    txtJson.Formatting := TJsonFormatting.Indented;
    txtJson.WriteStartObject;
    frmPrincipal.mlog.Lines.Add('Erro Ao Sincronizar Det Animal Pasto:'+E.Message);
    txtJson.WritePropertyName('Erro');
    txtJson.WriteValue('Erro Ao Sincronizar Det Animal Pasto:'+E.Message);
    txtJson.WriteEndObject;
    Result := TJsonObject.ParseJSONValue(TEncoding.UTF8.GetBytes(StrAux.ToString),0)as TJSONObject;
   end;
 end;

end;


function TdmDB.GetDataSetAsJSON(DataSet: TDataSet): TJSONObject;
var
  f: TField;
  o: TJSOnObject;
  a: TJSONArray;
begin
  a := TJSONArray.Create;
  DataSet.Active := True;
  DataSet.First;
  while not DataSet.EOF do begin
    o := TJSOnObject.Create;
    for f in DataSet.Fields do
      o.AddPair(f.FieldName, VarToStr(f.Value));
    a.AddElement(o);
    DataSet.Next;
  end;
  DataSet.Active := False;
  Result := TJSONObject.Create;
  Result.AddPair(DataSet.Name, a);
end;

function TdmDB.GetAnimalPasto: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  TDetAnimalPastoGet.Connection := frmPrincipal.FDConPG;
 TDetAnimalPastoGet.Close;
 TDetAnimalPastoGet.Open;
 Result := GetDataSetAsJSON(TDetAnimalPastoGet);
end;

function TdmDB.GetAuxCapim: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false
 then frmPrincipal.ConectaPG_Local;
  TAuxCapim.Connection := frmPrincipal.FDConPG;
 TAuxCapim.Close;
 TAuxCapim.Open;
 Result := GetDataSetAsJSON(TAuxCapim);
end;

function TdmDB.GetAuxCategoria: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  TAuxCategoria.Connection := frmPrincipal.FDConPG;
 TAuxCategoria.Close;
 TAuxCategoria.Open;
 Result := GetDataSetAsJSON(TAuxCategoria);
end;

function TdmDB.GetHistEscore: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  THitscorepasto.Connection := frmPrincipal.FDConPG;
 THitscorepasto.Close;
 THitscorepasto.Open;
 Result := GetDataSetAsJSON(THitscorepasto);
end;

function TdmDB.GetPasto: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  TPasto.Connection := frmPrincipal.FDConPG;
 TPasto.Close;
 TPasto.Open;
 Result := GetDataSetAsJSON(TPasto);
end;

function TdmDB.GetRetiro: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  TRetiro.Connection := frmPrincipal.FDConPG;
 TRetiro.Close;
 TRetiro.Open;
 Result := GetDataSetAsJSON(TRetiro);
end;

function TdmDB.GetUsuarios: TJSONObject;
begin
 if frmPrincipal.FDConPG.Connected=false then frmPrincipal.ConectaPG_Local;
  TUsuario.Connection := frmPrincipal.FDConPG;
 TUsuario.Close;
 TUsuario.Open;
 Result := GetDataSetAsJSON(TUsuario);
end;

procedure TdmDB.VerificaScoreExiste(idPasto, vData: string);
begin
 with TScore,TScore.SQL do
 begin
   Clear;
   Add('select * from scorepasto s');
   Add('where status=1 and idpasto='+idPasto);
   Add('and datacoleta='+vData);
   Open;
 end;
end;

end.
