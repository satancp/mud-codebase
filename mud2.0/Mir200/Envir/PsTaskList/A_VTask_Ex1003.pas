{******************************************************************
* ��Ŀ���ƣ�
* ��Ԫ���ƣ��ɳ�֮· 
* ��Ԫ���ߣ�
* ժ    Ҫ��
* ��    ע��

*******************************************************************}

program Mir2;
{$I common.pas}

//�������������,ÿ�������Ӧ��ͬ�������ţ�����������ظ� 
const CurrentTaskID   = 1003; 
//TASK_TYPE_MAIN      ��������Ϊ����
//TASK_TYPE_SUB       ��������Ϊ֧��
//TASK_TYPE_EVERYDAY  ��������Ϊÿ��
const CurrentTaskType = TASK_TYPE_SUB;
const CurrentTaskTitle = '֧������-�ȼ�3 ��ʦ����';

//�öβ����κ��޸� 
//********************************************************************
//��ǰ����ı�� 
function GetTaskID(): Integer;
begin
  Result := CurrentTaskID;   
end; 

//��ǰ���������
function GetTaskType(): Integer;
begin
  Result := CurrentTaskType;
end; 

//��ǰ����ı���
function GetTaskTitle(): string;
begin
  Result := CurrentTaskTitle; 
end; 
//********************************************************************


//�жϵ�ǰ���������Ҷ�����������״̬
function GetTaskState(): Integer;
var
  Tem111 : integer;
begin
   //��������п���ʹ�� This_Player
   //TASK_STATE_UNRECEIVED   //����״̬Ϊδ�ӵ�ǰ����
   //TASK_STATE_RECEIVED     //����״̬Ϊ�ѽӵ�ǰ����
   //TASK_STATE_FINISHED     //����״̬Ϊ����ɵ�ǰ����
   Tem111 := This_Player.GetV(111,3);
   if Tem111 = 10 then
   begin
      Result := TASK_STATE_FINISHED;
   end else if (Tem111 = 1) or (This_Player.Level = 2) then
   begin
      Result := Task_State_Received;
   end else
   begin
      if This_Player.Level >= 36 then
      begin
         This_Player.SetV(111,3,10);
         Result := TASK_STATE_FINISHED;
      end else if (This_Player.Level >= 3) and (not (This_Player.IsAStudent)) then
      begin
         This_Player.SetV(111,3,1);
         Result := Task_State_Received;
      end else
      begin
         Result := TASK_STATE_UNRECEIVED;
      end;
   end;     
end;

//��ǰ�������ϸ����
function GetTaskDetail(): string;
var
  Tem111_1 : integer;
begin
  //��������п���ʹ�� This_Player
  Tem111_1 := This_Player.GetV(111,3);
  if (Tem111_1 = 1) and (This_Player.Level >= 3) then
  begin
     Result := '��ϲ���Ѿ��ﵽ��3��������Ե����棨327��260����\'+
               '���أ�286��341������ݽ�ͷ��������35���������\'+
               '��ʦ����Ϊ��ʦ���ӡ���ʦ����ÿ��һ�����Ե�\'+
               '���أ�331��328���������ߴ���ȡһ����ʦ���ӽ�\'+
               '|{cmd}<����/c=red>������ݽ�ͷ���˽⡰ʦ�������ͽ��\'+
               '|{cmd}<�������NPC/C=red>�����桢���ص���ݽ�ͷ';
  end;
end;

//��ǰ����Ľ���
function GetTaskProgress(): string;
begin
end; 

//���ű��п���֧�ֵ����� 
function DoTaskCommand(const value: string): Boolean;
begin 
  Result := True;
end; 

begin
  //�������������� 
end.