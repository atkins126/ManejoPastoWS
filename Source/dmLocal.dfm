object dmDB: TdmDB
  OldCreateOrder = False
  Height = 464
  Width = 800
  object TUsuario: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select *'
      'from usuario')
    Left = 32
    Top = 64
    object TUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TUsuarionome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TUsuarioemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object TUsuariotelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object TUsuariotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TUsuariousuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 100
    end
    object TUsuariosenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
    object TUsuariodataregistro: TSQLTimeStampField
      FieldName = 'dataregistro'
      Origin = 'dataregistro'
    end
    object TUsuariostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TUsuarioidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
  end
  object TAuxCategoria: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select * from auxcategoria')
    Left = 104
    Top = 72
    object TAuxCategoriaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCategoriastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCategoriadatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCategoriaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCategoriadataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCategoriaidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCategorianome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TAuxCategoriaidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object TAuxCategoriasexo: TIntegerField
      FieldName = 'sexo'
      Origin = 'sexo'
    end
  end
  object TAuxCapim: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select * from auxcapim')
    Left = 104
    Top = 136
    object TAuxCapimid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAuxCapimstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TAuxCapimdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TAuxCapimidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TAuxCapimdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TAuxCapimidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TAuxCapimnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TAuxCapimidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
  end
  object TRetiro: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select * from retiro')
    Left = 32
    Top = 128
    object TRetiroid: TIntegerField
      FieldName = 'id'
    end
    object TRetirostatus: TIntegerField
      FieldName = 'status'
    end
    object TRetirodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TRetiroidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TRetirodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TRetiroidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TRetiroidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object TRetironome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object TRetirolatitude: TWideStringField
      FieldName = 'latitude'
    end
    object TRetirolongitude: TWideStringField
      FieldName = 'longitude'
    end
    object TRetiroareahectare: TBCDField
      FieldName = 'areahectare'
      Precision = 15
      Size = 2
    end
  end
  object TPasto: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select '
      '*'
      'from pasto p ')
    Left = 32
    Top = 184
    object TPastoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPastostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPastodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPastoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPastodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPastoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPastoidretiro: TIntegerField
      FieldName = 'idretiro'
      Origin = 'idretiro'
    end
    object TPastonome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TPastolatitude: TWideStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TPastolongitude: TWideStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TPastoareahectare: TBCDField
      FieldName = 'areahectare'
      Origin = 'areahectare'
      Precision = 15
      Size = 2
    end
    object TPastoqtdeanimais: TIntegerField
      FieldName = 'qtdeanimais'
      Origin = 'qtdeanimais'
    end
    object TPastopesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 2
    end
    object TPastoidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TPastoidcapim: TIntegerField
      FieldName = 'idcapim'
      Origin = 'idcapim'
    end
    object TPastoidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
  end
  object THitscorepasto: TFDQuery
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select s.* from scorepasto s '
      'join'
      '(select a.idpasto,max(datacoleta) maxdata from scorepasto  a '
      'where status=1'
      'group by idpasto)y'
      'on s.idpasto=y.idpasto and s.datacoleta =y.maxdata')
    Left = 104
    Top = 192
    object THitscorepastoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object THitscorepastostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object THitscorepastodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object THitscorepastoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object THitscorepastodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object THitscorepastoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object THitscorepastoidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object THitscorepastoidpasto: TIntegerField
      FieldName = 'idpasto'
      Origin = 'idpasto'
    end
    object THitscorepastostatuspasto: TIntegerField
      FieldName = 'statuspasto'
      Origin = 'statuspasto'
    end
    object THitscorepastoscore: TBCDField
      FieldName = 'score'
      Origin = 'score'
      Precision = 15
      Size = 2
    end
    object THitscorepastotaloxfolha: TIntegerField
      FieldName = 'taloxfolha'
      Origin = 'taloxfolha'
    end
    object THitscorepastoqtdcabeca: TIntegerField
      FieldName = 'qtdcabeca'
      Origin = 'qtdcabeca'
    end
    object THitscorepastoidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object THitscorepastopesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 3
    end
    object THitscorepastodatacoleta: TDateField
      FieldName = 'datacoleta'
      Origin = 'datacoleta'
    end
    object THitscorepastohoracoleta: TTimeField
      FieldName = 'horacoleta'
      Origin = 'horacoleta'
    end
  end
  object TScorePasto: TFDQuery
    CachedUpdates = True
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select '
      ' *'
      'from scorepasto s '
      '')
    Left = 184
    Top = 80
    object TScorePastoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TScorePastostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TScorePastodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TScorePastoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TScorePastodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TScorePastoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TScorePastoidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object TScorePastoidpasto: TIntegerField
      FieldName = 'idpasto'
      Origin = 'idpasto'
    end
    object TScorePastostatuspasto: TIntegerField
      FieldName = 'statuspasto'
      Origin = 'statuspasto'
    end
    object TScorePastoscore: TBCDField
      FieldName = 'score'
      Origin = 'score'
      Precision = 15
      Size = 2
    end
    object TScorePastotaloxfolha: TIntegerField
      FieldName = 'taloxfolha'
      Origin = 'taloxfolha'
    end
    object TScorePastoqtdcabeca: TIntegerField
      FieldName = 'qtdcabeca'
      Origin = 'qtdcabeca'
    end
    object TScorePastoidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TScorePastopesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 3
    end
    object TScorePastodatacoleta: TDateField
      FieldName = 'datacoleta'
      Origin = 'datacoleta'
    end
    object TScorePastohoracoleta: TTimeField
      FieldName = 'horacoleta'
      Origin = 'horacoleta'
    end
  end
  object TDetAnimalPasto: TFDQuery
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select '
      ' d.*'
      'from detanimaispasto d '
      'where d.status=1')
    Left = 208
    Top = 176
    object TDetAnimalPastoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetAnimalPastostatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetAnimalPastodatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetAnimalPastoidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetAnimalPastodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetAnimalPastoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetAnimalPastoidpasto: TIntegerField
      FieldName = 'idpasto'
      Origin = 'idpasto'
    end
    object TDetAnimalPastoidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TDetAnimalPastoqtdanimais: TIntegerField
      FieldName = 'qtdanimais'
      Origin = 'qtdanimais'
    end
    object TDetAnimalPastopesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 2
    end
    object TDetAnimalPastodataentrada: TDateField
      FieldName = 'dataentrada'
      Origin = 'dataentrada'
    end
    object TDetAnimalPastodatasaida: TDateField
      FieldName = 'datasaida'
      Origin = 'datasaida'
    end
    object TDetAnimalPastotipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TDetAnimalPastoidscore: TIntegerField
      FieldName = 'idscore'
      Origin = 'idscore'
    end
  end
  object TScore: TFDQuery
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select '
      '*'
      'from scorepasto s '
      'where id=-5000')
    Left = 384
    Top = 184
    object TScoreid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TScorestatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TScoredatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TScoreidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TScoredataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TScoreidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TScoreidcliente: TIntegerField
      FieldName = 'idcliente'
      Origin = 'idcliente'
    end
    object TScoreidpasto: TIntegerField
      FieldName = 'idpasto'
      Origin = 'idpasto'
    end
    object TScorestatuspasto: TIntegerField
      FieldName = 'statuspasto'
      Origin = 'statuspasto'
    end
    object TScorescore: TBCDField
      FieldName = 'score'
      Origin = 'score'
      Precision = 15
      Size = 2
    end
    object TScoretaloxfolha: TIntegerField
      FieldName = 'taloxfolha'
      Origin = 'taloxfolha'
    end
    object TScoreqtdcabeca: TIntegerField
      FieldName = 'qtdcabeca'
      Origin = 'qtdcabeca'
    end
    object TScoreidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TScorepesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 3
    end
    object TScoredatacoleta: TDateField
      FieldName = 'datacoleta'
      Origin = 'datacoleta'
    end
    object TScorehoracoleta: TTimeField
      FieldName = 'horacoleta'
      Origin = 'horacoleta'
    end
  end
  object TDetAnimalPastoGet: TFDQuery
    Connection = frmPrincipal.FDConPG
    SQL.Strings = (
      'select '
      ' d.*'
      'from detanimaispasto d '
      'where d.status=1')
    Left = 216
    Top = 248
    object TDetAnimalPastoGetid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TDetAnimalPastoGetstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TDetAnimalPastoGetdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TDetAnimalPastoGetidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TDetAnimalPastoGetdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TDetAnimalPastoGetidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TDetAnimalPastoGetidpasto: TIntegerField
      FieldName = 'idpasto'
      Origin = 'idpasto'
    end
    object TDetAnimalPastoGetidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Origin = 'idcategoria'
    end
    object TDetAnimalPastoGetqtdanimais: TIntegerField
      FieldName = 'qtdanimais'
      Origin = 'qtdanimais'
    end
    object TDetAnimalPastoGetpesomedio: TBCDField
      FieldName = 'pesomedio'
      Origin = 'pesomedio'
      Precision = 15
      Size = 2
    end
    object TDetAnimalPastoGetdataentrada: TDateField
      FieldName = 'dataentrada'
      Origin = 'dataentrada'
    end
    object TDetAnimalPastoGetdatasaida: TDateField
      FieldName = 'datasaida'
      Origin = 'datasaida'
    end
    object TDetAnimalPastoGettipo: TIntegerField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TDetAnimalPastoGetidscore: TIntegerField
      FieldName = 'idscore'
      Origin = 'idscore'
    end
  end
  object QryAux: TFDQuery
    Connection = frmPrincipal.FDConPG
    Left = 448
    Top = 136
  end
end
