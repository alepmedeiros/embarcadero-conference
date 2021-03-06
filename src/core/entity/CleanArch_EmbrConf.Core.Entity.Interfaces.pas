unit CleanArch_EmbrConf.Core.Entity.Interfaces;

interface

type
  iParkingLot = interface
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

  iParkedCar = interface
    function Code(Value : String) : iParkedCar; overload;
    function Code : String; overload;
    function Plate(Value : String) : iParkedCar; overload;
    function Plate : String; overload;
    function Data(Value : String) : iParkedCar; overload;
    function Data : String; overload;
  end;

implementation

end.
