unit CleanArch_EmbrConf.test;

interface

uses
  CleanArch_EmbrConf.Controller.ParkinLot,
  DUnitX.TestFramework,
  System.SysUtils, CleanArch_EmbrConf.Core.Entity.Interfaces;

type

  [TestFixture]
  TMyTestObject = class
  private
    FController : iController;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [test]
    procedure ShouldEnterParkingLot;

    [test]
    procedure ShoudGetParkingLot;

    [test]
    procedure ShoudlBeClosed;
  end;

implementation

procedure TMyTestObject.Setup;
begin
  FController := TController.New;
end;

procedure TMyTestObject.ShoudGetParkingLot;
var
  lParking: iParkingLot;
begin
  lParking := FController.GetParkingLot.Execute('shopping');

  Assert.IsTrue(lParking.Code = 'shopping');
end;

procedure TMyTestObject.ShoudlBeClosed;
var
  lParkingLot, lParkingLotBeforeEnter, lParkingLotAfterEnter: iParkingLot;
begin
  lParkingLot := FController.EnterParkingLot.Code('shopping').Plate('MMM-0001')
    .Data(FormatDateTime('hh:mm:ss', now)).Execute;
  Assert.IsTrue(lParkingLot.Code = 'shopping');

  lParkingLotBeforeEnter := FController.GetParkingLot.Execute('shopping');
  Assert.IsTrue(lParkingLotBeforeEnter.Code = 'shopping');

  lParkingLotAfterEnter := FController.GetParkingLot.Execute('shopping');
  Assert.IsTrue(lParkingLotAfterEnter.Code = 'shopping');
end;

procedure TMyTestObject.ShouldEnterParkingLot;
var
  lParkingLot, lParkingLotEnter: iParkingLot;
begin
  lParkingLot := FController.EnterParkingLot.Code('shopping').Plate('MMM-0001')
    .Data(FormatDateTime('dd/mm/yyyy hh:mm:ss', now)).Execute;

  lParkingLotEnter := FController.GetParkingLot.Execute('shopping');

  Assert.IsTrue(lParkingLotEnter.OccupiedSpaces >= 0);
end;

procedure TMyTestObject.TearDown;
begin
end;

initialization

TDUnitX.RegisterTestFixture(TMyTestObject);

end.
