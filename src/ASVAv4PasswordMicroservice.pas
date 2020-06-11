{
  Version     1.1
  Copyright   2020, Marcus Fernstrom
  License     MIT License
  GitHub      https://github.com/MFernstrom/OWASP-ASVA-v4-password-microservice
  About       Implements 2.1.1 and 2.1.7 of the OWASP ASVA v.4 guide
}

program ASVAv4PasswordMicroservice;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX}cthreads,
  cmem, {$ENDIF}
  Classes,
  SysUtils,
  fphttpapp,
  httpdefs,
  httproute,
  fpjson;

var
  Top10KPasswords: TStringList;

  procedure passwordCheckEndpoint(aRequest: TRequest; aResponse: TResponse);
  var
    json: TJSONObject;
    password: string;
  begin
    json := TJSONObject.Create;
    json.Booleans['passed'] := True;
    json.Add('reasons', TJSONArray.Create);

    password := aRequest.ContentFields.Values['password'];

    if Top10KPasswords.IndexOf(password) > -1 then begin
      json.Booleans['passed'] := False;
      json.Arrays['reasons'].Add('Password is too common');
    end;

    if Length(password) < 12 then begin
      json.Booleans['passed'] := False;
      json.Arrays['reasons'].Add('Password needs to be at least 12 characters long');
    end;

    if json.Booleans['passed'] = True then
      json.Delete('reasons');

    aResponse.Content := json.AsJSON;
    aResponse.Code := 200;
    aResponse.ContentType := 'application/json';
    aResponse.ContentLength := length(aResponse.Content);
    aResponse.SendContent;
  end;

begin
  Top10KPasswords := TStringList.Create;
  Top10KPasswords.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'top10000passwords.txt');

  if ParamCount = 1 then
    Application.Port := StrToInt(ParamStr(1))
  else
    Application.Port := 9080;

  HTTPRouter.RegisterRoute('/api/password', rmPost, @passwordCheckEndpoint);
  Application.Threaded := True;
  Application.Initialize;
  WriteLn(Format('Microservice is ready on port %d', [Application.Port]));
  Application.Run;
end.
