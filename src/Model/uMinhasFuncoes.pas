unit uMinhasFuncoes;

interface

uses uTypes;


  function CPFValido(sCPF: String): Boolean;
  function CNPJValido(sCNPJ: String): Boolean;
  function TStatusToString(pStatus:TStatus):String;
  function StatusSiglaToStatusTexto(sStatus:String):String;

implementation

uses SysUtils;

function CPFValido(sCPF: String): Boolean;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9: Integer;
  d1,d2: Integer;
  digitado, calculado: String;
begin
  n1:= StrToInt(sCPF[1]);
  n2:= StrToInt(sCPF[2]);
  n3:= StrToInt(sCPF[3]);
  n4:= StrToInt(sCPF[4]);
  n5:= StrToInt(sCPF[5]);
  n6:= StrToInt(sCPF[6]);
  n7:= StrToInt(sCPF[7]);
  n8:= StrToInt(sCPF[8]);
  n9:= StrToInt(sCPF[9]);

  d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
  d1:= 11-(d1 mod 11);

  if d1>=10 then
    d1:=0;

  d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
  d2:= 11-(d2 mod 11);

  if d2>=10 then
    d2 := 0;

  calculado := IntToStr(d1) +  IntToStr(d2);
  digitado  := sCPF[10] + sCPF[11];

  Result := (calculado = digitado);
end;


function CNPJValido(sCNPJ: String): Boolean;
var   dig13, dig14: string;
    sm, i, r, peso: integer;
begin
// length - retorna o tamanho da string do CNPJ (CNPJ é um número formado por 14 dígitos)
  if ((sCNPJ = '00000000000000') or (sCNPJ = '11111111111111') or
      (sCNPJ = '22222222222222') or (sCNPJ = '33333333333333') or
      (sCNPJ = '44444444444444') or (sCNPJ = '55555555555555') or
      (sCNPJ = '66666666666666') or (sCNPJ = '77777777777777') or
      (sCNPJ = '88888888888888') or (sCNPJ = '99999999999999') or
      (length(sCNPJ) <> 14)) then
  begin
    Result := false;
    Exit;
  end;

// "try" - protege o código para eventuais erros de conversão de tipo através da função "StrToInt"
  try
{ *-- Cálculo do 1o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 12 downto 1 do
    begin
// StrToInt converte o i-ésimo caractere do CNPJ em um número
      sm := sm + (StrToInt(sCNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig13 := '0'
    else str((11-r):1, dig13); // converte um número no respectivo caractere numérico

{ *-- Cálculo do 2o. Digito Verificador --* }
    sm := 0;
    peso := 2;
    for i := 13 downto 1 do
    begin
      sm := sm + (StrToInt(sCNPJ[i]) * peso);
      peso := peso + 1;
      if (peso = 10)
         then peso := 2;
    end;
    r := sm mod 11;
    if ((r = 0) or (r = 1))
       then dig14 := '0'
    else str((11-r):1, dig14);

   { Verifica se os digitos calculados conferem com os digitos informados. }
    Result := ((dig13 = sCNPJ[13]) and (dig14 = sCNPJ[14]));
  except
    Result := False
  end;

end;


function TStatusToString(pStatus:TStatus):String;
var
  sAux: String;
begin
  case pStatus of
    tpPendente:  sAux := 'PE';
    tpAprovado:  sAux := 'AP';
    tpConcluido: sAux := 'CO';
    tpCancelado: sAux := 'CA';
  end;

  Result := sAux;
end;

function StatusSiglaToStatusTexto(sStatus:String):String;
begin
  if sStatus = 'PE' then
    Result := 'Pendente'
  else if sStatus = 'AP' then
    Result := 'Aprovado'
  else if sStatus = 'CO' then
    Result := 'Concluído'
  else if sStatus = 'CA' then
    Result := 'Cancelado';
end;
end.
