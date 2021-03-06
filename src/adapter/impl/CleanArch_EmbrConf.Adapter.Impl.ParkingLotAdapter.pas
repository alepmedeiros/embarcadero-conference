unit CleanArch_EmbrConf.Adapter.Impl.ParkingLotAdapter;

interface

uses
  CleanArch_EmbrConf.Adapter.interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot;

type
  TParkingLotAdapter = class(TInterfacedObject, iParkingLotAdapter)
    private
      FParkingLot : iParkingLot;

      FCode: String;
      FCapacity: Integer;
      FOpenHour: Integer;
      FCloseHour: Integer;
      FOccupiedSpaces: Integer;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iParkingLotAdapter;
      function Code(Value : String) : iParkingLotAdapter; overload;
      function Code : String; overload;
      function Capacity(Value : Integer) : iParkingLotAdapter; overload;
      function Capacity : Integer; overload;
      function OpenHour(Value : Integer) : iParkingLotAdapter; overload;
      function OpenHour : Integer; overload;
      function CloseHour(Value : Integer) : iParkingLotAdapter; overload;
      function CloseHour : Integer; overload;
      function OccupiedSpaces(Value : Integer) : iParkingLotAdapter; overload;
      function OccupiedSpaces : Integer; overload;
      function ParkingLot : iParkingLot;
  end;

implementation

function TParkingLotAdapter.Capacity(Value: Integer): iParkingLotAdapter;
begin
  Result := self;
  FCapacity := Value;
end;

function TParkingLotAdapter.Capacity: Integer;
begin
  Result := FCapacity;
end;

function TParkingLotAdapter.CloseHour: Integer;
begin
  Result := FCloseHour;
end;

function TParkingLotAdapter.CloseHour(Value: Integer): iParkingLotAdapter;
begin
  Result := Self;
  FCloseHour := Value;
end;

function TParkingLotAdapter.Code: String;
begin
  Result := FCode;
end;

function TParkingLotAdapter.Code(Value: String): iParkingLotAdapter;
begin
  Result := Self;
  FCode := Value;
end;

constructor TParkingLotAdapter.Create;
begin
  FParkingLot := TParkingLot.New;
end;

destructor TParkingLotAdapter.Destroy;
begin

  inherited;
end;

class function TParkingLotAdapter.New : iParkingLotAdapter;
begin
  Result := Self.Create;
end;

function TParkingLotAdapter.OccupiedSpaces(Value: Integer): iParkingLotAdapter;
begin
  Result := Self;
  FOccupiedSpaces := Value;
end;

function TParkingLotAdapter.OccupiedSpaces: Integer;
begin
  Result := FOccupiedSpaces;
end;

function TParkingLotAdapter.OpenHour: Integer;
begin
  Result := FOpenHour;
end;

function TParkingLotAdapter.ParkingLot: iParkingLot;
begin
  Result := FParkingLot
              .Code(FCode)
              .Capacity(FCapacity)
              .OpenHour(FOpenHour)
              .CloseHour(FCloseHour)
              .OccupiedSpaces(FOccupiedSpaces);
end;

function TParkingLotAdapter.OpenHour(Value: Integer): iParkingLotAdapter;
begin
  Result := Self;
  FOpenHour := Value;
end;

end.
