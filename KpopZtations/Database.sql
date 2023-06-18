CREATE TABLE [dbo].[Customer] (
    [CustomerID]       INT          IDENTITY (1, 1) NOT NULL,
    [CustomerName]     VARCHAR (50) NULL,
    [CustomerEmail]    VARCHAR (50) NULL,
    [CustomerPassword] VARCHAR (50) NULL,
    [CustomerGender]   VARCHAR (15)  NULL,
    [CustomerAddress]  VARCHAR (50) NULL,
    [CustomerRole]     VARCHAR (10) NULL,
    PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

CREATE TABLE [dbo].[Artist] (
    [ArtistID]    INT          IDENTITY (1, 1) NOT NULL,
    [ArtistName]  VARCHAR (50) NULL,
    [ArtistImage] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([ArtistID] ASC)
);

CREATE TABLE [dbo].[Album] (
    [AlbumID]          INT          IDENTITY (1, 1) NOT NULL,
    [ArtistID]         INT          NOT NULL,
    [AlbumName]        VARCHAR (50) NULL,
    [AlbumImage]       VARCHAR (50) NULL,
    [AlbumPrice]       INT          NULL,
    [AlbumStock]       INT          NULL,
    [AlbumDescription] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([AlbumID] ASC),
    FOREIGN KEY ([ArtistID]) REFERENCES [dbo].[Artist] ([ArtistID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[TransactionHeader] (
    [TransactionID]   INT  IDENTITY (1, 1) NOT NULL,
    [TransactionDate] DATE NULL,
    [CustomerID]      INT  NOT NULL,
    PRIMARY KEY CLUSTERED ([TransactionID] ASC),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[TransactionDetail] (
    [TransactionID] INT NOT NULL,
    [AlbumID]       INT NOT NULL,
    [Qty]           INT NULL,
	PRIMARY KEY (TransactionID, AlbumID),
    FOREIGN KEY ([TransactionID]) REFERENCES [dbo].[TransactionHeader] ([TransactionID]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([AlbumID]) REFERENCES [dbo].[Album] ([AlbumID]) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE [dbo].[Cart] (
    [CustomerID] INT NOT NULL,
    [AlbumID]    INT NOT NULL,
    [Qty]        INT NULL,
	PRIMARY KEY (CustomerID, AlbumID),
    FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customer] ([CustomerID]) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY ([AlbumID]) REFERENCES [dbo].[Album] ([AlbumID]) ON DELETE CASCADE ON UPDATE CASCADE
);