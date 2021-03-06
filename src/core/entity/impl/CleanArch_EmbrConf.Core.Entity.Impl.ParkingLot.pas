unit CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot;

interface

uses
  System.SysUtils,
  CleanArch_EmbrConf.Core.Entity.Interfaces;

type
  TParkingLot = class(TInterfacedObject, iParkingLot)
    private
      FCode : String;
      FCapacity : Integer;
      FOpenHour : Integer;
      FCloseHour : Integer;
      FOccupiedSpaces : Integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iParkingLot;
      function Code(Value : String) : iParkingLot; overload;
      function Code : String; overload;
      function Capacity(Value : Integer) : iParkingLot; overload;
      function Capacity : Integer; overload;
      function OpenHour(Value : Integer) : iParkingLot; overload;
      function OpenHour : Integer; overload;
      function CloseHour(Value : Integer) : iParkingLot; overload;
      function CloseHour : Integer; overload;
      function OccupiedSpaces(Value : Integer) : iParkingLot; overload;
      function OccupiedSpaces : Integer; overload;
      function isOpen(Data : String) : Boolean;
      function isFull : Boolean;
  end;

implementation

function TParkingLot.Capacity(Value: Integer): iParkingLot;
begin
  Result := Self;
  FCapacity := Value;
end;

function TParkingLot.Capacity: Integer;
begin
  Result := FCapacity;
end;

function TParkingLot.CloseHour: Integer;
begin
  Result := FCloseHour;
end;

function TParkingLot.CloseHour(Value: Integer): iParkingLot;
begin
  Result := Self;
  FCloseHour := Value;
end;

function TParkingLot.Code: String;
begin
  Result := FCode;
end;

function TParkingLot.Code(Value: String): iParkingLot;
begin
  Result := Self;
  FCode := Value;
end;

constructor TParkingLot.Create;
begin

end;

destructor TParkingLot.Destroy;
begin

  inherited;
end;

function TParkingLot.isFull: Boolean;
begin
  Result := not (FCapacity = FOccupiedSpaces);
end;

function TParkingLot.isOpen(Data : String) : Boolean;
begin
  Result := not ((Trunc(StrToDateTime(Data)) >= FOpenHour) and
              (Trunc(StrToDateTime(Data)) <= FCloseHour));
end;

class function TParkingLot.New : iParkingLot;
begin
  Result := Self.Create;
end;

function TParkingLot.OccupiedSpaces(Value: Integer): iParkingLot;
begin
  Result := Self;
  FOccupiedSpaces := Value;
end;

function TParkingLot.OccupiedSpaces: Integer;
begin
  Result := FOccupiedSpaces;
end;

function TParkingLot.OpenHour: Integer;
begin
  Result := FOpenHour;
end;

function TParkingLot.OpenHour(Value: Integer): iParkingLot;
begin
  Result := Self;
  FOpenHour := Value;
end;

end.
