unit CleanArch_EmbrConf.Core.Entity.Impl.ParkedCar;

interface

uses
  CleanArch_EmbrConf.Core.Entity.Interfaces,
  System.RegularExpressions,
  System.SysUtils;

type
  TParkedCar = class(TInterfacedObject, iParkedCar)
  private
    FCode: string;
    FPlate: String;
    Fdata: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iParkedCar;
    function Code(Value: String): iParkedCar; overload;
    function Code: String; overload;
    function Plate(Value: String): iParkedCar; overload;
    function Plate: String; overload;
    function Data(Value: String): iParkedCar; overload;
    function Data: String; overload;
  end;

implementation

function TParkedCar.Code(Value: String): iParkedCar;
begin
  result := self;
  FCode := Value;
end;

function TParkedCar.Code: String;
begin
  result := FCode;
end;

constructor TParkedCar.Create;
begin

end;

function TParkedCar.Data: String;
begin
  result := Fdata;
end;

function TParkedCar.Data(Value: String): iParkedCar;
begin
  result := self;
  Fdata := Value;
end;

destructor TParkedCar.Destroy;
begin

  inherited;
end;

class function TParkedCar.New: iParkedCar;
begin
  result := self.Create;
end;

function TParkedCar.Plate(Value: String): iParkedCar;
begin
  result := self;
  FPlate := Value;
end;

function TParkedCar.Plate: String;
begin
  if not TRegEx.IsMatch(FPlate, '\w[A-Z]{1,3}-[0-9]{1,4}') then
    raise Exception.Create('Invalid Plate');
  result := FPlate;
end;

end.
