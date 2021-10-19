unit CleanArch_EmbrConf.test;

interface

uses
  CleanArch_EmbrConf.Core.UserCase.Interfaces,
  CleanArch_EmbrConf.Core.Repository.Interfaces,
  CleanArch_EmbrConf.Core.UserCase.Impl.EnterParkingLot,
  CleanArch_EmbrConf.Infra.Repository.Memory,
  CleanArch_EmbrConf.Core.UserCase.Impl.GetParkingLot,
  DUnitX.TestFramework, CleanArch_EmbrConf.Core.Entity.Interfaces,
  System.SysUtils;

type
  [TestFixture]
  TMyTestObject = class
  private
    FEnterParkingLot: iEnterParkingLot;
    FParkingLotRepositoryMemory: iParkingLotRepository;
    FParkingLotRepositorySQL : iParkingLotRepository;
    FGetParkingLot: iGetParkingLot;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;

    [Test]
    procedure ShouldEnterParkingLot;

    [Test]
    procedure ShoudGetParkingLot;

    [Test]
    procedure ShoudlBeClosed;
  end;

implementation

procedure TMyTestObject.Setup;
begin
  FParkingLotRepositoryMemory := TParkingLotRepositoryMemory.New;
//  FParkingLotRepositorySQL := TParkingLotRepositorySQL;
  FEnterParkingLot := TEnterParkingLot.New(FParkingLotRepositoryMemory);
  FGetParkingLot := TGetParkingLot.New(FParkingLotRepositoryMemory);
end;

procedure TMyTestObject.ShoudGetParkingLot;
var
  lParking : iParkingLot;
begin
  lParking := FGetParkingLot.Execute('shopping');

  Assert.IsTrue(lParking.Code = 'shopping');
end;

procedure TMyTestObject.ShoudlBeClosed;
var
  lParkingLot,
  lParkingLotBeforeEnter,
  lParkingLotAfterEnter : iParkingLot;
begin
  lParkingLot := FEnterParkingLot
                  .Code('shopping')
                  .Plate('MMM-0001')
                  .Data(FormatDateTime('hh:mm:ss', now))
                  .Execute;
  Assert.IsTrue(lParkingLot.Code = 'shopping');

  lParkingLotBeforeEnter := FGetParkingLot.Execute('shopping');
  Assert.IsTrue(lParkingLotBeforeEnter.Code = 'shopping');

  lParkingLotAfterEnter := FGetParkingLot.Execute('shopping');
  Assert.IsTrue(lParkingLotAfterEnter.Code = 'shopping');
end;

procedure TMyTestObject.ShouldEnterParkingLot;
var
  lParkingLot,
  lParkingLotEnter : iParkingLot;
begin
  lParkingLot := FEnterParkingLot
                  .Code('shopping')
                  .Plate('MMM-0001')
                  .Data(FormatDateTime('dd/mm/yyyy hh:mm:ss', now))
                .Execute;

  lParkingLotEnter := FGetParkingLot.Execute('shopping');

  Assert.IsTrue(lParkingLotEnter.OccupiedSpaces = 0);
end;

procedure TMyTestObject.TearDown;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);

end.
