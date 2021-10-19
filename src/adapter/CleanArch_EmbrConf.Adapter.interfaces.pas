unit CleanArch_EmbrConf.Adapter.interfaces;

interface

uses
  CleanArch_EmbrConf.Core.Entity.Interfaces;

type
  iParkingLotAdapter = interface
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

end.
