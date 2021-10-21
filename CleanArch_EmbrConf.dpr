program CleanArch_EmbrConf;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  CleanArch_EmbrConf.Infra.Database.Interfaces in 'src\infra\database\CleanArch_EmbrConf.Infra.Database.Interfaces.pas',
  CleanArch_EmbrConf.Infra.Database.Conexao in 'src\infra\database\impl\CleanArch_EmbrConf.Infra.Database.Conexao.pas',
  CleanArch_EmbrConf.Infra.Database.Impl.Database in 'src\infra\database\impl\CleanArch_EmbrConf.Infra.Database.Impl.Database.pas',
  CleanArch_EmbrConf.Infra.Http.Api in 'src\infra\http\CleanArch_EmbrConf.Infra.Http.Api.pas',
  CleanArch_EmbrConf.Infra.Repository.Memory in 'src\infra\repository\CleanArch_EmbrConf.Infra.Repository.Memory.pas',
  CleanArch_EmbrConf.Infra.Repository.SQL in 'src\infra\repository\CleanArch_EmbrConf.Infra.Repository.SQL.pas',
  CleanArch_EmbrConf.Core.UserCase.Interfaces in 'src\core\usercase\CleanArch_EmbrConf.Core.UserCase.Interfaces.pas',
  CleanArch_EmbrConf.Core.UserCase.Impl.EnterParkingLot in 'src\core\usercase\impl\CleanArch_EmbrConf.Core.UserCase.Impl.EnterParkingLot.pas',
  CleanArch_EmbrConf.Core.UserCase.Impl.GetParkingLot in 'src\core\usercase\impl\CleanArch_EmbrConf.Core.UserCase.Impl.GetParkingLot.pas',
  CleanArch_EmbrConf.Core.Repository.Interfaces in 'src\core\repository\CleanArch_EmbrConf.Core.Repository.Interfaces.pas',
  CleanArch_EmbrConf.Core.Entity.Interfaces in 'src\core\entity\CleanArch_EmbrConf.Core.Entity.Interfaces.pas',
  CleanArch_EmbrConf.Core.Entity.Impl.ParkedCar in 'src\core\entity\impl\CleanArch_EmbrConf.Core.Entity.Impl.ParkedCar.pas',
  CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot in 'src\core\entity\impl\CleanArch_EmbrConf.Core.Entity.Impl.ParkingLot.pas',
  CleanArch_EmbrConf.Controller.ParkinLot in 'src\controller\CleanArch_EmbrConf.Controller.ParkinLot.pas',
  CleanArch_EmbrConf.Adapter.interfaces in 'src\adapter\CleanArch_EmbrConf.Adapter.interfaces.pas',
  CleanArch_EmbrConf.Adapter.Impl.ParkingLotAdapter in 'src\adapter\impl\CleanArch_EmbrConf.Adapter.Impl.ParkingLotAdapter.pas';

begin
  try

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
