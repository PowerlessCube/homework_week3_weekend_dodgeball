##GETTING STARTED

1. Draw your ER diagram
2. Set up your directory structure
3. Create a Ruby file for each of your classes (remember singular names!)
4. Write your class definitions in each file (including an initialize)


For example:
```
class Team

  def initialize(name)
    @team_name = name
  end

end
```

5. Design your database tables
6. Create your database
7. Make a .sql file and write some SQL to create your tables
8. Run the .sql file (psql -d data_base_name -f file_name.sql)
9. Create an SQLRunner class that we can use to pass SQL strings to
10. Implement save, update and delete methods on your classes
11. Create console.rb to create some new objects and save them to the db
12. Create some business logic for testing (could be League class??)
