#region CRID144 - 12032025-FIN-Automatic guarantee date
pageextension 50604 ItemTrackingLinesPgeExt extends "Item Tracking Lines"
{
    layout
    {
        addlast(Control1)
        {
            field("Entry No"; Rec."Entry No")
            {
                ApplicationArea = All;
                Caption = 'Entry No';
                Editable = false;
                DrillDown = false;
            }

            field("Serial Number"; Rec."Serial Number")
            {
                ApplicationArea = All;
                Caption = 'Serial Number';
                Editable = false;
                DrillDown = false;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        ServiceItemRecord: Record "Service item line";
    begin
        ServiceItemRecord.SetRange("Document No.", Rec."Source ID");
        if (ServiceItemRecord.FindFirst()) then begin
            Rec."Expiration Date" := ServiceItemRecord."Last Warranty Date";
            Rec."Entry No" := ServiceItemRecord."Entry No";
            Rec."Serial Number" := ServiceItemRecord."Serial Number";
        end
    end;
}
#endregion