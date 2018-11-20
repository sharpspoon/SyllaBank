CREATE TABLE [dbo].[faculty]
(
	[facultyID] INT NOT NULL PRIMARY KEY, 
    [name] NCHAR(10) NULL, 
    CONSTRAINT [FK_faculty_ToTable] FOREIGN KEY ([schoolID]) REFERENCES [school]([schoolID]) 
)
