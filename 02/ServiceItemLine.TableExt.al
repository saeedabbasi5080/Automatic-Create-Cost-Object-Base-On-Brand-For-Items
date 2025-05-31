#region CRID144 - 12032025-FIN-Automatic guarantee date
tableextension 50603 ServiceItemLineTblExt extends "Service Item Line"
{

    fields
    {
        modify("Service Item No.")
        {
            trigger OnBeforeValidate()
            var
                ServiceItem: Record "Service Item";
            begin
                if Rec."Service Item No." <> '' then begin
                    if ServiceItem.Get(Rec."Service Item No.") then begin
                        Rec."Entry No" := ServiceItem."ILE Lookup Entry No";
                        Rec."Serial Number" := ServiceItem."Serial Number";
                        Rec."Last Warranty Date" := ServiceItem."Last Warranty Date";
                    end
                end;
            end;
        }

        field(50108; "Entry No main Test"; Integer)
        {
            Caption = 'Entry No';
        }

        field(50109; "Last Warranty Date main Test"; Date)
        {
            Caption = 'Last Warranty Date';
        }


        field(50100; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }

        field(50102; "Last Warranty Date"; Date)
        {
            Caption = 'Last Warranty Date';
        }


        field(50107; "Serial Number main test"; Code[50])
        {
            Caption = 'Serial Number';
        }

    }
}
#endregion
