tableextension 50600 ServiceItemTableExt extends "Service Item"
{
    fields
    {
        field(50100; "ILE Lookup Entry No."; Integer)
        {
            Caption = 'ILE Lookup Entry No.';
            TableRelation = "Item Ledger Entry"."Entry No." where("Item No." = field("Item No."),
                                                                    "Entry Type" = const(Sale),
                                                                    "Serial No." = filter('<>''''')); // Filter for entries with Serial No.
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
            begin
                if "ILE Lookup Entry No." <> 0 then begin
                    if ItemLedgerEntry.Get("ILE Lookup Entry No.") then begin
                        Rec."Selected Serial No." := ItemLedgerEntry."Serial No.";
                        Rec."Warranty Date" := ItemLedgerEntry."Warranty Date"; // Assuming Warranty Date exists in ILE
                        // Make Serial No. field non-editable if needed via page customization
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
            Editable = false; // To make it read-only as requested
        }
        field(50102; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
            DataClassification = CustomerContent;
            Editable = false; // To make it read-only
        }
    }
}

// Note: You might need to add the "Warranty Date" field to the "Item Ledger Entry" table
// if it doesn't exist, or use the appropriate existing date field (e.g., "Expiration Date").
// Example of extending Item Ledger Entry:
// tableextension 50101 ItemLedgerEntryExt extends "Item Ledger Entry"
// {
//     fields
//     {
//         field(50100; "Warranty Date"; Date)
//         {
//             Caption = 'Warranty Date';
//             DataClassification = CustomerContent;
//         }
//     }
// }