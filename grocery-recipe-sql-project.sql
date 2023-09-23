CREATE TABLE "product" (
  "id" integer PRIMARY KEY,
  "name" text,
  "brand" text
);

CREATE TABLE "unit_price" (
  "id" integer,
  "price" float,
  "product_id" integer
);

CREATE TABLE "ingredient" (
  "id" integer,
  "name" text,
  "amount" float,
  "unit" text,
  "recipe_id" integer
);

CREATE TABLE "recipe" (
  "id" integer PRIMARY KEY,
  "name" text,
  "prep_time" float,
  "cook_time" float,
  "servings" float
);

CREATE TABLE "package_type" (
  "id" integer PRIMARY KEY,
  "unit_of_measurement" text,
  "quantity" integer,
  "product_id" integer,
  "price" float,
  "unit_price_id" integer
);


COMMENT ON COLUMN "posts"."body" IS 'Content of the post';

ALTER TABLE "package_type" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");

ALTER TABLE "ingredient" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("id");

ALTER TABLE "package_type" ADD FOREIGN KEY ("id") REFERENCES "unit_price" ("product_id");


