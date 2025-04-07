#region CRID144 - 12032025-FIN-Automatic guarantee date
tableextension 50600 ServiceItemTableExt extends "Service Item"
{
    fields
    {
        field(50100; "ILE Lookup Entry No."; Integer)
        {
            Caption = 'ILE Lookup Entry No.';
            TableRelation = "Item Ledger Entry"."Entry No." where("Item No." = field("Item No."),
                                                                    "Entry Type" = const(Sale),
                                                                    "Serial No." = filter('<>'''''));
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
            begin
                if "ILE Lookup Entry No." <> 0 then begin
                    if ItemLedgerEntry.Get("ILE Lookup Entry No.") then begin
                        Rec."Selected Serial No." := ItemLedgerEntry."Serial No.";
                        Rec."Warranty Date" := ItemLedgerEntry."Warranty Date";

                    end else begin
                        Rec."Selected Serial No." := '';
                        Rec."Warranty Date" := 0D;
                    end;
                end else begin
                    Rec."Selected Serial No." := '';
                    Rec."Warranty Date" := 0D;
                end;
            end;
        }
        field(50101; "Selected Serial No."; Code[50])
        {
            Caption = 'Selected Serial No.';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50102; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
#endregion