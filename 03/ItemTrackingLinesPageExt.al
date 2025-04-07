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
                ToolTip = 'This is the tooltip for my new field.';
                Editable = false;
                DrillDown = false;
            }

            field("Serial No"; Rec."Selected Serial No. from SI")
            {
                ApplicationArea = All;
                Caption = 'Serial No';
                ToolTip = 'Shows the base description from the Item table.';
                Editable = false;
                DrillDown = false;
            }
        }
    }


    trigger OnAfterGetCurrRecord()
    var
        ServiceItemRecord: Record "Service Item";
    begin
        ServiceItemRecord.SetRange("Serial No.", Rec."Serial No.");
        if (ServiceItemRecord.FindFirst()) then begin

            Rec."Expiration Date" := ServiceItemRecord."Warranty Date";


        end
    end;

}
#endregion