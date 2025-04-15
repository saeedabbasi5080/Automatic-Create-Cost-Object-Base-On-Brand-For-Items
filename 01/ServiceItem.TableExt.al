#region CRID144 - 12032025-FIN-Automatic guarantee date
tableextension 50600 ServiceItemTableExt extends "Service Item"
{
    fields
    {
        field(50100; "ILE Lookup Entry No"; Integer)
        {
            Caption = 'ILE Lookup Entry No.';
            TableRelation = "Item Ledger Entry"."Entry No." where("Item No." = field("Item No."),
                                                                    "Entry Type" = const(Sale),
                                                                    "Serial No." = filter('<>'''''));

            trigger OnValidate()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
            begin
                if "ILE Lookup Entry No" <> 0 then begin
                    if ItemLedgerEntry.Get("ILE Lookup Entry No") then begin
                        Rec."Serial Number" := ItemLedgerEntry."Serial No.";
                        Rec."Last Warranty Date" := ItemLedgerEntry."Warranty Date";

                    end else begin
                        Rec."Serial Number" := '';
                        Rec."Last Warranty Date" := 0D;
                    end;
                end else begin
                    Rec."Serial Number" := '';
                    Rec."Last Warranty Date" := 0D;
                end;
            end;
        }
        field(50101; "Serial Number"; Code[50])
        {
            Caption = 'Serial Number';
            Editable = false;
        }
        field(50102; "Last Warranty Date"; Date)
        {
            Caption = 'Last Warranty Date';
            Editable = false;
        }
    }
}
#endregion