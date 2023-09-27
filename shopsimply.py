import psycopg2
import json

with open ('credentials.json') as cred_file:
    credentials = json.load(cred_file)

new_list = []

with open ('test.txt') as test_file:
    test_data = test_file.readlines()

    recipe_name = test_data[0]
    
    for line in test_data:
        tidy_line = line.strip()
        new_line = tidy_line.upper()
        test_split = new_line.split(", ")
        test_tuple = tuple(test_split)
        new_list.append(test_tuple)

new_tuple_list = new_list[1:]


#--------------------------------------------------------------------------------------------------

conn = psycopg2.connect(
    host = credentials["host"],
    database = credentials["database"],
    user = credentials["user"],
    password = credentials["password"],
    port = credentials["port"]
)
cursor = conn.cursor()


#--------------------------------------------------------------------------------------------------
selected_id = int(input("Please enter the ID of the recipe you would like to view: "))
sql = 'SELECT * FROM recipe WHERE id = %s'
cursor.execute(sql, (selected_id,))

selected_recipe = cursor.fetchone()

if selected_recipe:
    print(f"Recipe for {selected_recipe[1]}:")
    print(f"Prep Time: {selected_recipe[2]}")
    print(f"Cook Time: {selected_recipe[3]}")
    print(f"Servings: {selected_recipe[4]}")
else:
    print("Sorry, no recipe found with that ID.")

sql = 'SELECT name, amount, unit FROM ingredient i WHERE recipe_id = %s;'
cursor.execute(sql, (selected_id,))
selected_ingredients = cursor.fetchall()

if selected_ingredients:
    print("---------------------")
    print("Ingredients:")
    for ingredient in selected_ingredients:
        name, amount, unit = ingredient
        print(f"{name}, {amount}, {unit}")
else:
    print("No ingredients found for the selected recipe.")

cursor.close()
conn.close()


