unit ViaCEP;

interface

uses
  REST.Client, System.json, System.SysUtils;

type
  TViaCEP = class
  private
    RespCode: Integer;
    Logradouro: String;
    Complemento: String;
    Bairro: String;
    Localidade: String;
    UF: String;
    IBGE: String;
    Gia: String;
    procedure FindCEP(ACEP: String);
  public
    function GetRespCode: Integer;
    function GetLogradouro: String;
    function GetComplemento: String;
    function GetBairro: String;
    function GetLocalidade: String;
    function GetUF: String;
    function GetIBGE: String;
    function GetGia: String;
    constructor Create(ACEP: String);
  end;

implementation

{ TViaCEP }

constructor TViaCEP.Create(ACEP: String);
begin
  FindCEP(ACEP);
end;

procedure TViaCEP.FindCEP(ACEP: String);
var
  RESTClient: TRESTClient;
  RESTRequest: TRESTRequest;
  RESTResponse: TRESTResponse;
  JSONObject: TJSONObject;
begin
  RespCode := 0;

  RESTClient := TRESTClient.Create(nil);
  RESTRequest := TRESTRequest.Create(nil);
  RESTResponse := TRESTResponse.Create(nil);

  RESTRequest.Client := RESTClient;
  RESTRequest.Response := RESTResponse;
  RESTClient.BaseURL := 'https://viacep.com.br/ws/' + ACEP + '/json';
  RESTRequest.Execute;

  JSONObject := RESTResponse.JSONValue as TJSONObject;

  try
    if not Assigned(JSONObject) then
    begin
      RespCode := -1;
    end
    else
    begin
      if JSONObject.Count = 1 then
      begin
        RespCode := -1;
      end
      else
      begin
        Logradouro  := JSONObject.Get('logradouro').JsonValue.Value; // Busca dentro do JsonObject o  indíce 'logradouro'; passa o valor para o Field Logradouro
        Bairro      := JSONObject.Get('bairro').JsonValue.Value;
        Localidade  := JSONObject.Get('localidade').JsonValue.Value;
        Complemento := JSONObject.Get('complemento').JsonValue.Value;
        IBGE        := JSONObject.Get('ibge').JsonValue.Value;
        UF          := JSONObject.Get('uf').JsonValue.Value;
        Gia         := JSONObject.Get('gia').JsonValue.Value;
      end;
    end;
  finally
    FreeAndNil(JSONObject);
  end;
end;

function TViaCEP.GetBairro: String;
begin
  Result := Bairro;
end;

function TViaCEP.GetComplemento: String;
begin
  Result := Complemento;
end;

function TViaCEP.GetGia: String;
begin
  Result := Gia;
end;

function TViaCEP.GetIBGE: String;
begin
  Result := IBGE;
end;

function TViaCEP.GetLocalidade: String;
begin
  Result := Localidade;
end;

function TViaCEP.GetLogradouro: String;
begin
  Result := Logradouro;
end;

function TViaCEP.GetRespCode: Integer;
begin
  Result := RespCode;
end;

function TViaCEP.GetUF: String;
begin
  Result := UF;
end;

end.
