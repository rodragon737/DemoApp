Use master
CREATE LOGIN todoapp WITH PASSWORD = 'todo123'
GO  

CREATE DATABASE ToDo;
Use ToDo;

CREATE USER todoapp FOR LOGIN todoapp
WITH DEFAULT_SCHEMA =[dbo]   
GO

exec sp_addrolemember 'db_datareader', 'todoapp'
GRANT EXECUTE TO [todoapp]
GRANT SELECT TO [todoapp]
GRANT VIEW DEFINITION TO [todoapp]
GRANT SHOWPLAN TO [todoapp]
GRANT SELECT ON OBJECT::sys.sql_expression_dependencies TO [todoapp]
GO

CREATE ROLE ReadExecute AUTHORIZATION dbo
GRANT CREATE TABLE TO [ReadExecute]
GRANT CREATE SCHEMA TO [ReadExecute]
GRANT CREATE FUNCTION TO [ReadExecute]
GRANT CREATE PROCEDURE TO [ReadExecute]
GRANT EXECUTE ON SCHEMA::[dbo] TO [ReadExecute]
GRANT ALTER ON SCHEMA::[dbo] TO [ReadExecute]
GRANT SELECT ON SCHEMA::[dbo] TO [ReadExecute]
GRANT CONTROL ON SCHEMA::[dbo] TO [ReadExecute]
GRANT CREATE TYPE TO [ReadExecute]
GRANT CREATE VIEW TO [ReadExecute]
GRANT CREATE EXTERNAL LIBRARY TO [ReadExecute]
GRANT SHOWPLAN TO [ReadExecute]
GRANT VIEW DEFINITION TO [ReadExecute]
GRANT SELECT ON OBJECT::sys.sql_expression_dependencies TO [ReadExecute];
-- Se asigna los permisos
exec sp_addrolemember 'ReadExecute', 'todoapp'


CREATE TABLE userTodo (
	userId int IDENTITY(1, 1),
	todoId int ,
	userName nvarchar(500),
	userPass nvarchar(500),
	nombre nvarchar(500),
	inicio TIMESTAMP,
	nacimiento DATE,
	userMail nvarchar(500),
	userPhoto nvarchar(500),
	site nvarchar(500),
	PRIMARY KEY(userId, todoId)
);

CREATE TABLE tareas (
	idTask int IDENTITY(1, 1),
	todoId int,
	todoDetail nvarchar(500),
	creado TIMESTAMP,
	inicio DATETIME,
	tLimit DATETIME,
	PRIMARY KEY(idTask, todoId)
);

INSERT INTO dbo.userTodo (todoId, userName, userPass, nombre, nacimiento, userMail, userPhoto)
VALUES ('1','rrosales','123456','Rodrigo Rosales', '1978-02-25','rosales.rodrigo.martin@gmail.com','anonymous.png');

INSERT INTO dbo.tareas (todoId, todoDetail, inicio, tLimit)
VALUES ('1','Implementar Esta App','2023-08-14 23:05:40:00','2023-08-18 23:05:40:00');
