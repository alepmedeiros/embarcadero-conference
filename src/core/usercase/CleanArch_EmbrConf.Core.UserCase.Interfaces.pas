unit CleanArch_EmbrConf.Core.UserCase.Interfaces;

interface

uses
  CleanArch_EmbrConf.Core.Entity.Interfaces;

type
  iEnterParkingLot = interface
    function Code(Value : String) : iEnterParkingLot;
    function Plate(Value : String) : iEnterParkingLot;
    function Data(Value : String) : iEnterParkingLot;
    function Execute : iParkingLot;
  end;

  iGetParkingLot = interface
    function Execute(Code : String) : iParkingLot;
  end;

implementation

end.
