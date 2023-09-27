CREATE TABLE "product" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "brand" text,
  "food_type_id" integer
);

CREATE TABLE "ingredient" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "amount" float,
  "unit" text,
  "recipe_id" integer,
  "food_type_id" integer
);

CREATE TABLE "recipe" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "prep_time" float,
  "cook_time" float,
  "servings" float
);

CREATE TABLE "package_type" (
  "id" SERIAL PRIMARY KEY,
  "unit_of_measurement" text,
  "quantity" integer,
  "product_id" integer,
  "price" float
);

CREATE TABLE "food_type" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

ALTER TABLE "package_type" ADD FOREIGN KEY ("product_id") REFERENCES "product" ("id");

ALTER TABLE "ingredient" ADD FOREIGN KEY ("recipe_id") REFERENCES "recipe" ("id");

ALTER TABLE "product" ADD FOREIGN KEY ("food_type_id") REFERENCES "food_type" ("id");

ALTER TABLE "ingredient" ADD FOREIGN KEY ("food_type_id") REFERENCES "food_type" ("id");
