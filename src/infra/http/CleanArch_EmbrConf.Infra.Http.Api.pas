unit CleanArch_EmbrConf.Infra.Http.Api;

interface

uses
  Horse,
  CleanArch_EmbrConf.Controller.ParkinLot,
  System.JSON,
  System.SysUtils,
  Rest.Json;

type
  TApi = class
  private
    FController: iController;
  public
    constructor Create;
    destructor Destroy; override;
    procedure getParkingLots;
  end;

implementation

{ TApi }

constructor TApi.Create;
begin
  FController := TController.New;
end;

destructor TApi.Destroy;
begin

  inherited;
end;

procedure TApi.getParkingLots;
begin
  THorse.Get('/parkinglots/:code',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      FController.GetParkingLot.Execute(Req.Params['code']);
      Res.Send('Indo');
    end);

  THorse.Listen(9000);
end;

end.
