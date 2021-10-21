unit CleanArch_EmbrConf.Infra.Repository.SQL;

interface

uses
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces, System.JSON,
  CleanArch_EmbrConf.Infra.Database.Interfaces,
  CleanArch_EmbrConf.Infra.Database.Impl.Database,
  CleanArch_EmbrConf.Adapter.Impl.ParkingLotAdapter;

type
  TParkingLotRepositorySQL = class(TInterfacedObject, iParkingLotRepository)
    private
      FDatabase : iDatabase;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iParkingLotRepository;
      function getParkingLot(Code : String) : iParkingLot;
      function getParkingLotJSON(Code : String) : TJSONArray; overload;
      function saveParkedCar(Value : iParkedCar) : iParkingLotRepository;
  end;

implementation

constructor TParkingLotRepositorySQL.Create;
begin
  FDatabase := TDatabase.New;
end;

destructor TParkingLotRepositorySQL.Destroy;
begin

  inherited;
end;

function TParkingLotRepositorySQL.getParkingLot(Code: String): iParkingLot;
var
  lParkingLotData : iParkingLot;
begin
  lParkingLotData := FDatabase.getOneOrNone('select *, (select count(*) '+
                   'from parked_car pc where pc.code = pl.code) as occupied_spaces '+
                   'from parking_lot pl where pl.code = :code', [code]);

  Result := TParkingLotAdapter.New
              .Code(lParkingLotData.Code)
              .Capacity(lParkingLotData.Capacity)
              .OpenHour(lParkingLotData.OpenHour)
              .CloseHour(lParkingLotData.CloseHour)
              .OccupiedSpaces(lParkingLotData.OccupiedSpaces)
              .ParkingLot;
end;

function TParkingLotRepositorySQL.getParkingLotJSON(Code: String): TJSONArray;
begin
  Result := FDatabase.OneOrNone('select *, (select count(*) '+
                   'from parked_car pc where pc.code = pl.code) as occupied_spaces '+
                   'from parking_lot pl where pl.code = :code', [code]);
end;

class function TParkingLotRepositorySQL.New : iParkingLotRepository;
begin
  Result := Self.Create;
end;

function TParkingLotRepositorySQL.saveParkedCar(
  Value: iParkedCar): iParkingLotRepository;
begin
  Result := Self;
  FDatabase.postPark('insert into parked_car (code, plate, data) values '+
                 '(:code, :plate, :data)', [Value.Code, Value.Plate, Value.Data]);
end;

end.
