unit CleanArch_EmbrConf.Core.Repository.Interfaces;

interface

uses
  Json,
  CleanArch_EmbrConf.Core.Entity.Interfaces;

type
  iParkingLotRepository = interface
    function getParkingLot(Code : String) : iParkingLot;
    function getParkingLotJSON(Code : String) : TJSONArray;
    function saveParkedCar(Value : iParkedCar) : iParkingLotRepository;
  end;

implementation

end.
