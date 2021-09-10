-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Receipts" (
    "id" VARCHAR   NOT NULL,
    "bonus_points_earned" INT,
    "bonus_points_earned_reason" VARCHAR,
    "create_date" TIMESTAMP   NOT NULL,
    "date_scanned" TIMESTAMP   NOT NULL,
    "finished_date" TIMESTAMP,
    "modify_date" TIMESTAMP   NOT NULL,
    "points_awarded_date" TIMESTAMP,
    "points_earned" FLOAT,
    "purchase_date" TIMESTAMP,
    "purchased_item_count" INT,
    "rewards_receipt_item_list" VARCHAR,
    "rewards_receipt_status" VARCHAR   NOT NULL,
    "total_spent" FLOAT,
    "user_id" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Receipts" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" VARCHAR   NOT NULL,
    "active" BOOLEAN   NOT NULL,
    "created_date" TIMESTAMP   NOT NULL,
    "last_login" TIMESTAMP,
    "role" VARCHAR  DEFAULT 'consumer' NOT NULL,
    "sign_up_source" VARCHAR,
    "state" VARCHAR,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Rewards_Receipt_Item_List" (
    "id" VARCHAR   NOT NULL,
    "receipt_id" VARCHAR,
    "barcode" VARCHAR,
    "description" VARCHAR,
    "finalPrice" FLOAT,
    "itemPrice" FLOAT,
    "needsFetchReview" BOOLEAN,
    "partnerItemId" VARCHAR,
    "preventTargetGapPoints" BOOLEAN,
    "quantityPurchased" INT,
    "userFlaggedBarcode" VARCHAR,
    "userFlaggedNewItem" BOOLEAN,
    "userFlaggedPrice" FLOAT,
    "userFlaggedQuantity" INT,
    "needsFetchReviewReason" VARCHAR,
    "pointsNotAwardedReason" VARCHAR,
    "pointsPayerId" VARCHAR,
    "rewardsGroup" VARCHAR,
    "rewardsProductPartnerId" VARCHAR,
    "userFlaggedDescription" VARCHAR,
    "originalMetaBriteBarcode" VARCHAR,
    "originalMetaBriteDescription" VARCHAR,
    "brandCode" VARCHAR,
    "competitorRewardsGroup" VARCHAR,
    "discountedItemPrice" FLOAT,
    "originalReceiptItemText" VARCHAR,
    "itemNumber" VARCHAR,
    "originalMetaBriteQuantityPurchased" INT,
    "pointsEarned" FLOAT,
    "targetPrice" FLOAT,
    "competitiveProduct" BOOLEAN,
    "originalFinalPrice" FLOAT,
    "originalMetaBriteItemPrice" FLOAT,
    "deleted" BOOLEAN,
    "priceAfterCoupon" FLOAT,
    "metabriteCampaignId" VARCHAR,
    CONSTRAINT "pk_Rewards_Receipt_Item_List" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Brands" (
    "id" VARCHAR   NOT NULL,
    "barcode" VARCHAR   NOT NULL,
    "category_code" VARCHAR,
    "cpg" VARCHAR   NOT NULL,
    "brandCode" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Brands" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Brand_Code" (
    "id" VARCHAR   NOT NULL,
    "name" VARCHAR   NOT NULL,
    "top_brand" BOOLEAN,
    CONSTRAINT "pk_Brand_Code" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "CPG" (
    "id" VARCHAR   NOT NULL,
    "ref" VARCHAR   NOT NULL,
    CONSTRAINT "pk_CPG" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Category" (
    "id" VARCHAR   NOT NULL,
    "category" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Receipts" ADD CONSTRAINT "fk_Receipts_rewards_receipt_item_list" FOREIGN KEY("rewards_receipt_item_list")
REFERENCES "Rewards_Receipt_Item_List" ("id");

ALTER TABLE "Receipts" ADD CONSTRAINT "fk_Receipts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_receipt_id" FOREIGN KEY("receipt_id")
REFERENCES "Receipts" ("id");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_barcode" FOREIGN KEY("barcode")
REFERENCES "Brands" ("barcode");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_userFlaggedBarcode" FOREIGN KEY("userFlaggedBarcode")
REFERENCES "Brands" ("barcode");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_pointsPayerId" FOREIGN KEY("pointsPayerId")
REFERENCES "CPG" ("id");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_rewardsProductPartnerId" FOREIGN KEY("rewardsProductPartnerId")
REFERENCES "CPG" ("id");

ALTER TABLE "Rewards_Receipt_Item_List" ADD CONSTRAINT "fk_Rewards_Receipt_Item_List_brandCode" FOREIGN KEY("brandCode")
REFERENCES "Brand_Code" ("id");

ALTER TABLE "Brands" ADD CONSTRAINT "fk_Brands_category_code" FOREIGN KEY("category_code")
REFERENCES "Category" ("id");

ALTER TABLE "Brands" ADD CONSTRAINT "fk_Brands_cpg" FOREIGN KEY("cpg")
REFERENCES "CPG" ("id");

ALTER TABLE "Brands" ADD CONSTRAINT "fk_Brands_brandCode" FOREIGN KEY("brandCode")
REFERENCES "Brand_Code" ("id");

