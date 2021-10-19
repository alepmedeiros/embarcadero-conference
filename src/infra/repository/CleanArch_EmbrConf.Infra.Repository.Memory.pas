unit CleanArch_EmbrConf.Infra.Repository.Memory;

interface

uses
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces,
  System.JSON, CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot,
  CleanArch_EmbrConf.Adapter.Impl.ParkingLotAdapter;

type
  TParkingLotRepositoryMemory = class(TInterfacedObject, iParkingLotRepository)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iParkingLotRepository;
    function getParkingLot(Code: String): iParkingLot; overload;
    function getParkingLot(Code: String; var aJsonArray: TJsonArray)
      : iParkingLotRepository; overload;
    function saveParkedCar(Value: iParkedCar): iParkingLotRepository;
  end;

implementation

constructor TParkingLotRepositoryMemory.Create;
begin

end;

destructor TParkingLotRepositoryMemory.Destroy;
begin

  inherited;
end;

function TParkingLotRepositoryMemory.getParkingLot(Code: String): iParkingLot;
var
  lParkingLot, lParkingLotData : iParkingLot;
begin
  lParkingLotData := TParkingLot.New
                        .Code('shopping')
                        .Capacity(5)
                        .OpenHour(8)
                        .CloseHour(22);

  lParkingLot := TParkingLotAdapter.New
                    .Code(lParkingLotData.Code)
                    .Capacity(lParkingLotData.Capacity)
                    .OpenHour(lParkingLotData.OpenHour)
                    .CloseHour(lParkingLotData.CloseHour)
                  .ParkingLot;

  Result := lParkingLot;
end;

function TParkingLotRepositoryMemory.getParkingLot(Code: String;
  var aJsonArray: TJsonArray): iParkingLotRepository;
begin

end;

class function TParkingLotRepositoryMemory.New: iParkingLotRepository;
begin
  Result := Self.Create;
end;

function TParkingLotRepositoryMemory.saveParkedCar(Value: iParkedCar)
  : iParkingLotRepository;
begin

end;

end.
