unit CleanArch_EmbrConf.Core.UserCase.Impl.GetParkingLot;

interface

uses
  CleanArch_EmbrConf.Core.UserCase.Interfaces,
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Core.Entity.Interfaces, System.JSON;

type
  TGetParkingLot = class(TInterfacedObject, iGetParkingLot)
    private
      FParent: iParkingLotRepository;
    public
      constructor Create(Parent : iParkingLotRepository);
      destructor Destroy; override;
      class function New(Parent : iParkingLotRepository) : iGetParkingLot;
      function Execute(Code : String) : iParkingLot;
  end;

implementation

constructor TGetParkingLot.Create(Parent : iParkingLotRepository);
begin
  FParent := Parent;
end;

destructor TGetParkingLot.Destroy;
begin

  inherited;
end;

function TGetParkingLot.Execute(Code : String) : iParkingLot;
begin
  Result := FParent.getParkingLot(code);
end;

class function TGetParkingLot.New(Parent : iParkingLotRepository) : iGetParkingLot;
begin
  Result := Self.Create(Parent);
end;

end.
