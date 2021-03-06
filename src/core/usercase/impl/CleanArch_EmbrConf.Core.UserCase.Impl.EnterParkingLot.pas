unit CleanArch_EmbrConf.Core.UserCase.Impl.EnterParkingLot;

interface

uses
  CleanArch_EmbrConf.Core.UserCase.Interfaces,
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot, System.SysUtils,
  CleanArch_EmbrConf.Core.Entity.Impl.ParkedCar,
  System.DateUtils;

type
  TEnterParkingLot = class(TInterfacedObject, iEnterParkingLot)
  private
    FParent: iParkingLotRepository;

    FCode: String;
    FPlate: String;
    FData: string;
  public
    constructor Create(Parent: iParkingLotRepository);
    destructor Destroy; override;
    class function New(Parent: iParkingLotRepository): iEnterParkingLot;
    function Code(Value: String): iEnterParkingLot;
    function Plate(Value: String): iEnterParkingLot;
    function Data(Value: String): iEnterParkingLot;
    function Execute: iParkingLot;
  end;

implementation

function TEnterParkingLot.Code(Value: String): iEnterParkingLot;
begin
  Result := Self;
  FCode := Value;
end;

constructor TEnterParkingLot.Create(Parent: iParkingLotRepository);
begin
  FParent := Parent;
end;

function TEnterParkingLot.Data(Value: String): iEnterParkingLot;
begin
  Result := Self;
  FData := Value;
end;

destructor TEnterParkingLot.Destroy;
begin

  inherited;
end;

function TEnterParkingLot.Execute: iParkingLot;
var
  lParkingLot : iParkingLot;
  lParkedCar : iParkedCar;
begin
  lParkingLot := FParent.getParkingLot(FCode);

  lParkedCar :=
    TParkedCar.New
      .Code(FCode)
      .Plate(FPlate)
      .Data(FData);

  if not lParkingLot.isOpen(IntToStr(HourOf(StrToDateTime(lParkedCar.Data)))) then
    raise Exception.Create('The parking lot is closed');

  if not lParkingLot.isFull then
    raise Exception.Create('The parking lot is full');

  FParent.saveParkedCar(lParkedCar);

  Result := lParkingLot;
end;

class function TEnterParkingLot.New(Parent: iParkingLotRepository)
  : iEnterParkingLot;
begin
  Result := Self.Create(Parent);
end;

function TEnterParkingLot.Plate(Value: String): iEnterParkingLot;
begin
  Result := Self;
  FPlate := Value;
end;

end.
