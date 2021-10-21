unit CleanArch_EmbrConf.Controller.ParkinLot;

interface

uses
  CleanArch_EmbrConf.Core.UserCase.Interfaces,
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Infra.Repository.Memory,
  CleanArch_EmbrConf.Infra.Repository.SQL,
  CleanArch_EmbrConf.Core.UserCase.Impl.EnterParkingLot,
  CleanArch_EmbrConf.Core.UserCase.Impl.GetParkingLot;

type
  iController = interface
    function GetParkingLot : iGetParkingLot;
    function EnterParkingLot : iEnterParkingLot;
  end;

  TController = class(TInterfacedObject, iController)
    private
      FParkingLotRepositoryMemory : iParkingLotRepository;
      FParkingLotRespositorySQL : iParkingLotRepository;
      FGetParkingLot: iGetParkingLot;
      FEnterParkingLot: iEnterParkingLot;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iController;
      function GetParkingLot : iGetParkingLot;
      function EnterParkingLot : iEnterParkingLot;
  end;

implementation

constructor TController.Create;
begin
  FParkingLotRepositoryMemory := TParkingLotRepositoryMemory.New;
  FParkingLotRespositorySQL := TParkingLotRepositorySQL.New;
  FEnterParkingLot := TEnterParkingLot.New(FParkingLotRespositorySQL);
  FGetParkingLot := TGetParkingLot.New(FParkingLotRespositorySQL);
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.EnterParkingLot: iEnterParkingLot;
begin
  Result := FEnterParkingLot;
end;

function TController.GetParkingLot: iGetParkingLot;
begin
  Result := FGetParkingLot;
end;

class function TController.New : iController;
begin
  Result := Self.Create;
end;

end.
