unit CleanArch_EmbrConf.Core.Repository.Interfaces;

interface

uses
  Json,
  CleanArch_EmbrConf.Core.Entity.Interfaces;

type
  iParkingLotRepository = interface
    function getParkingLot(Code : String) : iParkingLot; overload;
    function getParkingLot(Code : String; var aJsonArray : TJsonArray) : iParkingLotRepository; overload;
    function saveParkedCar(Value : iParkedCar) : iParkingLotRepository;
  end;

implementation

end.
