#region CRID144 - 12032025-FIN-Automatic guarantee date
pageextension 50600 ServiceItemCardPageExt extends "Service Item Card"
{
    layout
    {
        addlast(General)
        {
            field("ILE Lookup Entry No"; Rec."ILE Lookup Entry No")
            {
                Caption = 'Entry No';
                ApplicationArea = All;
            }
            field("Serial Number"; Rec."Serial Number")
            {
                Caption = 'Last Serial Number';
                ApplicationArea = All;
            }
            field("Last Warranty Date"; Rec."Last Warranty Date")
            {
                Caption = 'Last Warranty Date';
                ApplicationArea = All;
            }

        }
    }
}
#endregion