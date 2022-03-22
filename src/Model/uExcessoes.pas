unit uExcessoes;

interface

uses
  System.SysUtils;

type
  ENomeProdutoObrigatorio = class(Exception)
end;

type
  EPrecoRevendaInvalido = class(Exception)
end;

type
  ENomeDistribuidorObrigatorio = class(Exception)
end;

type
  ECNPJCPFObrigatorio = class(Exception)
end;

implementation


end.
