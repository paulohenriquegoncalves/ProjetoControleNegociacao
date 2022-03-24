unit uExcessoes;

interface

uses
  System.SysUtils;

type
  ENomeObrigatorio = class(Exception)
end;

type
  EPrecoRevendaInvalido = class(Exception)
end;

type
  ECNPJCPFInvalido = class(Exception)
end;

implementation


end.
