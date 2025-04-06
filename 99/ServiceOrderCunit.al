// codeunit 50600 ServiceOrderEvents // یا ID دلخواه دیگر
// {
//     // Event Subscriber که به تغییر فیلد سریال در صفحه Item Tracking Lines گوش می‌دهد
//     [EventSubscriber(ObjectType::Page, Page::"Item Tracking Lines", 'OnAfterValidateEvent', 'Serial No.', false, false)]
//     local procedure UpdateExpirationDateOnServiceLine(var Rec: Record "Reservation Entry"; var xRec: Record "Reservation Entry"; CurrFieldNo: Integer)
//     var
//         ServiceLine: Record "Service Line";          // جدول A (جدول فعلی که فیلد موجود را دارد)
//         ItemLedgerEntry: Record "Item Ledger Entry"; // جدول B (جدول منبع)
//         SourceType: Integer;
//         SourceSubType: Integer;
//         SourceID: Code[20];
//         SourceBatchName: Code[10];
//         SourceProdOrderLine: Integer;
//         SourceRefNo: Integer;
//     begin
//         // --- پیدا کردن رکورد Service Line والد ---
//         Rec.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);
//         if (SourceType <> Database::"Service Line") then
//             exit;
//         if not ServiceLine.Get(ServiceLine."Document Type"::Order, SourceID, SourceRefNo) then
//             exit;
//         // --- پایان پیدا کردن Service Line ---

//         // اگر شماره سریال پاک شده، تاریخ انقضا را هم پاک کن
//         if Rec."Serial No." = '' then begin
//             if ServiceLine."Expiration Date" <> 0D then begin
//                 ServiceLine."Expiration Date" := 0D; // به‌روزرسانی فیلد موجود
//                 ServiceLine.Modify(true);
//             end;
//             exit;
//         end;

//         // --- پیدا کردن رکورد Item Ledger Entry مربوطه (جدول B) ---
//         ItemLedgerEntry.SetCurrentKey("Item No.", "Serial No.", "Posting Date");
//         ItemLedgerEntry.SetRange("Item No.", ServiceLine."No.");
//         ItemLedgerEntry.SetRange("Serial No.", Rec."Serial No.");
//         ItemLedgerEntry.SetRange("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
//         // --- پایان جستجو در ILE ---

//         if ItemLedgerEntry.FindLast() then begin
//             // فرض وجود فیلد "Warranty Date" در جدول B (ILE)
//             if ItemLedgerEntry."Warranty Date" <> 0D then begin
//                  // *** هسته اصلی: کپی کردن مقدار از جدول B به فیلد موجود جدول A ***
//                  if ServiceLine."Expiration Date" <> ItemLedgerEntry."Warranty Date" then begin
//                     // مقدار فیلد منبع (Warranty Date) به فیلد موجود (Expiration Date) انتساب داده می‌شود
//                     ServiceLine."Expiration Date" := ItemLedgerEntry."Warranty Date";
//                     ServiceLine.Modify(true); // ذخیره تغییر در رکورد جدول A
//                  end;
//             end else begin
//                  // اگر منبع تاریخ نداشت، فیلد موجود را پاک کن
//                  if ServiceLine."Expiration Date" <> 0D then begin
//                      ServiceLine."Expiration Date" := 0D;
//                      ServiceLine.Modify(true);
//                  end;
//             end;
//         end else begin
//              // اگر رکوردی در جدول منبع پیدا نشد، فیلد موجود را پاک کن
//              if ServiceLine."Expiration Date" <> 0D then begin
//                  ServiceLine."Expiration Date" := 0D;
//                  ServiceLine.Modify(true);
//              end;
//         end;
//     end;

//     // --- تابع کمکی GetSourceTracking ---
//     procedure GetSourceTracking(ReservationEntry: Record "Reservation Entry"; var SourceType: Integer; var SourceSubType: Integer; var SourceID: Code[20]; var SourceBatchName: Code[10]; var SourceProdOrderLine: Integer; var SourceRefNo: Integer)
//     var
//         TrackingSpecification: Record "Tracking Specification";
//     begin
//         // ... (کد کامل تابع کمکی که قبلاً ارائه شد) ...
//         if ReservationEntry."Source Type" = 0 then begin
//              if ReservationEntry."Tracking Specification Entry No." <> 0 then begin
//                 TrackingSpecification.Get(ReservationEntry."Tracking Specification Entry No.");
//                 TrackingSpecification.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);
//              end;
//         end else
//             ReservationEntry.GetSourceTracking(SourceType, SourceSubType, SourceID, SourceBatchName, SourceProdOrderLine, SourceRefNo);
//     end;
//     // --- پایان تابع کمکی ---
// }