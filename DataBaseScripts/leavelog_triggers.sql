ALTER TRIGGER amec_trg_aftinsrt_leave ON [dbo].[amec_leaves]
FOR INSERT
AS

INSERT INTO [dbo].[amec_leaves_log]
           ([leave_id]
		   ,[action]
           ,[nt_id]
           ,[leave_type]
           ,[leave_type_desc]
           ,[leave_date_type]
           ,[leave_date]
           ,[leave_remarks]
           ,[created_date]
           ,[created_by])
     
	 SELECT i.id 
		   ,'INSERT'
		   ,i.nt_id
		   ,i.leave_type
		   ,i.leave_type_desc
		   ,i.leave_date_type
		   ,i.leave_date
		   ,i.leave_remarks
		   ,GETDATE()
		   ,i.created_by
		   From inserted i
GO

CREATE TRIGGER amec_trg_aftupdate_leave ON [dbo].[amec_leaves]
FOR UPDATE
AS
INSERT INTO [dbo].[amec_leaves_log]
           ([leave_id]
		   ,[action]
           ,[nt_id]
           ,[leave_type]
           ,[leave_type_desc]
           ,[leave_date_type]
           ,[leave_date]
           ,[leave_remarks]
           ,[created_date]
           ,[created_by])
     
	 SELECT i.id 
		   ,'UPDATE'
		   ,i.nt_id
		   ,i.leave_type
		   ,i.leave_type_desc
		   ,i.leave_date_type
		   ,i.leave_date
		   ,i.leave_remarks
		   ,GETDATE()
		   ,i.created_by
		   From inserted i
GO

CREATE TRIGGER amec_trg_aftdel_leave ON [dbo].[amec_leaves]
FOR DELETE
AS
INSERT INTO [dbo].[amec_leaves_log]
           ([leave_id]
		   ,[action]
           ,[nt_id]
           ,[leave_type]
           ,[leave_type_desc]
           ,[leave_date_type]
           ,[leave_date]
           ,[leave_remarks]
           ,[created_date]
           ,[created_by])
     
	 SELECT d.id 
		   ,'DELETE'
		   ,d.nt_id
		   ,d.leave_type
		   ,d.leave_type_desc
		   ,d.leave_date_type
		   ,d.leave_date
		   ,d.leave_remarks
		   ,GETDATE()
		   ,d.created_by
		   From deleted d
GO