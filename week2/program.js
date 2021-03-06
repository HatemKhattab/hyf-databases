// This is the connector (also known as driver)
// that we can use to connect to a MySQL process
// and access its databases.
const mysql = require('mysql');

class TodoModel {
    constructor(dbConnection) {
        this.dbConnection = dbConnection;
    }

    // Loads all the TODOs in the database
    load(callback) {
        const selectTodoItems = "SELECT * FROM todo_items";
        this.dbConnection.query(selectTodoItems, function(err, results, fields) {
            if(err) {
                callback(err);
                return;
            }

            callback(null, results);
        });
    }

    create(description, callback) {
        // Write code and query to create a new TODO item
      //  const createTodo = `INSERT INTO todo_items(text, user_id) VALUES (${description}, 1);`
        const createTodo = `INSERT INTO todo_items (text, user_id) VALUES ('${description}', 1);`
        this.dbConnection.query(createTodo, function(err, results, fields){
          if (err){
            callback(err);
            return;
          }
          callback(null);
        });
    }

    update(id, description, callback) {
        // Write code and query to update and existing TODO item
    }

    delete(id, callback) {
        // Write code and query to delete an existing TODO item
    }

    tagTodoItem(todoItemId, tagId, callback) {
        // Write code and query add a tag to a TODO item
    }

    untagTodoItem(todoItemId, tagId, callback) {
        // Write code and query remove a tag from a TODO item
    }

    markCompleted(todoItemId, callback) {
        // Write code to mark a TODO item as completed
    }
}

const dbConnection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'admin',
    database : 'todo_app'
});

dbConnection.connect(function(err) {
    if (err != null) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected as id ' + dbConnection.threadId);

    const todoModel = new TodoModel(dbConnection);
    // todoModel.load(function(err, todoItems) {
    //     if(err) {
    //         console.log("error loading TODO items:", err);
    //     }
    //
    //     console.log("existing todo items:", todoItems);
    // });

    todoModel.create('work ', function(err){
      if(err){
        console.log("error creating TODO item:", err);
        return;
      }
      console.log("new todo is created");
    });
});
