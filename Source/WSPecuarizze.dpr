program WSPecuarizze;

uses
  System.StartUpCopy,
  FMX.Forms,
  dmLocal in 'dmLocal.pas' {dmDB: TDataModule},
  UPrincipal in 'UPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmDB, dmDB);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
