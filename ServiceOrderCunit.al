// codeunit 50100 ServiceOrderEvents
// {
//     [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterValidateEvent', 'Serial No.', false, false)]
//     local procedure UpdateExpirationDateOnServiceLine(var Rec: Record "Reservation Entry"; var xRec: Record "Reservation Entry"; CurrFieldNo: Integer)
//     var
//         ServiceLine: Record "Service Line";
//         ItemLedgerEntry: Record "Item Ledger Entry";
//         SourceType: Integer;
//         SourceSubType: Integer;
//         SourceID: Code[20];
//         SourceBatchName: Code[10];
//         SourceProdOrderLine: Integer;
//         SourceRefNo: Integer;
//         FoundILE: Boolean;
//     begin
//         // Ensure we are in the context of a Service Order Line
//         Rec.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);

//         if (SourceType <> Database::"Service Line") or (Rec."Serial No." = '') then
//             exit;

//         if not ServiceLine.Get(ServiceLine."Document Type"::Order, SourceID, SourceRefNo) then
//             exit;

//         // Find the Item Ledger Entry with the matching Item No. and Serial No.
//         // The logic to find the *correct* ILE might need refinement.
//         // This example assumes we look for the latest Sale entry for that serial.
//         ItemLedgerEntry.SetCurrentKey("Item No.", "Serial No.", "Posting Date");
//         ItemLedgerEntry.SetRange("Item No.", ServiceLine."No.");
//         ItemLedgerEntry.SetRange("Serial No.", Rec."Serial No.");
//         ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Sale); // Ensure it's a sale entry
//         if ItemLedgerEntry.FindLast() then begin
//             // Assuming "Warranty Date" is the field on ILE or use another relevant date
//             if ItemLedgerEntry."Warranty Date" <> 0D then begin
//                  // Check if the field exists and has a value
//                  ServiceLine."Expiration Date" := ItemLedgerEntry."Warranty Date";
//                  // You might want to store the warranty date on the service line too:
//                  // ServiceLine."Warranty Date" := ItemLedgerEntry."Warranty Date";
//                  ServiceLine.Modify(true); // Modify the service line
//             end;
//         end;
//     end;

//     // Helper procedure from BaseApp to decompose Source ID
//     procedure GetSourceTracking(ReservationEntry: Record "Reservation Entry"; var SourceType: Integer; var SourceSubType: Integer; var SourceID: Code[20]; var SourceBatchName: Code[10]; var SourceProdOrderLine: Integer; var SourceRefNo: Integer)
//     var
//         TrackingSpecification: Record "Tracking Specification";
//     begin
//         if ReservationEntry."Source Type" = 0 then begin
//             TrackingSpecification.Get(ReservationEntry."Tracking Specification Entry No.");
//             TrackingSpecification.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);
//         end else
//             ReservationEntry.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);
//     end;
// }