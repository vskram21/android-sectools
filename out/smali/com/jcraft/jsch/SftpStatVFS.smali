.class public Lcom/jcraft/jsch/SftpStatVFS;
.super Ljava/lang/Object;
.source "SftpStatVFS.java"


# instance fields
.field atime:I

.field private bavail:J

.field private bfree:J

.field private blocks:J

.field private bsize:J

.field extended:[Ljava/lang/String;

.field private favail:J

.field private ffree:J

.field private files:J

.field private flag:J

.field flags:I

.field private frsize:J

.field private fsid:J

.field gid:I

.field mtime:I

.field private namemax:J

.field permissions:I

.field size:J

.field uid:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    const/4 v0, 0x0

    iput v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->flags:I

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->extended:[Ljava/lang/String;

    .line 76
    return-void
.end method

.method static getStatVFS(Lcom/jcraft/jsch/Buffer;)Lcom/jcraft/jsch/SftpStatVFS;
    .locals 7
    .parameter "buf"

    .prologue
    const-wide/16 v4, 0x0

    .line 79
    new-instance v1, Lcom/jcraft/jsch/SftpStatVFS;

    invoke-direct {v1}, Lcom/jcraft/jsch/SftpStatVFS;-><init>()V

    .line 81
    .local v1, statvfs:Lcom/jcraft/jsch/SftpStatVFS;
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bsize:J

    .line 82
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->frsize:J

    .line 83
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->blocks:J

    .line 84
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bfree:J

    .line 85
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->bavail:J

    .line 86
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->files:J

    .line 87
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->ffree:J

    .line 88
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->favail:J

    .line 89
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->fsid:J

    .line 90
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    long-to-int v0, v2

    .line 91
    .local v0, flag:I
    invoke-virtual {p0}, Lcom/jcraft/jsch/Buffer;->getLong()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->namemax:J

    .line 93
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x1

    :goto_0
    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    .line 95
    iget-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    and-int/lit8 v6, v0, 0x2

    if-eqz v6, :cond_0

    const-wide/16 v4, 0x2

    :cond_0
    or-long/2addr v2, v4

    iput-wide v2, v1, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    .line 98
    return-object v1

    :cond_1
    move-wide v2, v4

    .line 93
    goto :goto_0
.end method


# virtual methods
.method public getAvail()J
    .locals 4

    .prologue
    .line 126
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getAvailBlocks()J
    .locals 2

    .prologue
    .line 105
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bavail:J

    return-wide v0
.end method

.method public getAvailForNonRoot()J
    .locals 4

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getAvailBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getAvailINodes()J
    .locals 2

    .prologue
    .line 108
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->favail:J

    return-wide v0
.end method

.method public getBlockSize()J
    .locals 2

    .prologue
    .line 101
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bsize:J

    return-wide v0
.end method

.method public getBlocks()J
    .locals 2

    .prologue
    .line 103
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->blocks:J

    return-wide v0
.end method

.method public getCapacity()I
    .locals 6

    .prologue
    .line 130
    const-wide/16 v0, 0x64

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v4

    sub-long/2addr v2, v4

    mul-long/2addr v0, v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public getFileSystemID()J
    .locals 2

    .prologue
    .line 109
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->fsid:J

    return-wide v0
.end method

.method public getFragmentSize()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->frsize:J

    return-wide v0
.end method

.method public getFreeBlocks()J
    .locals 2

    .prologue
    .line 104
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->bfree:J

    return-wide v0
.end method

.method public getFreeINodes()J
    .locals 2

    .prologue
    .line 107
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->ffree:J

    return-wide v0
.end method

.method public getINodes()J
    .locals 2

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->files:J

    return-wide v0
.end method

.method public getMaximumFilenameLength()J
    .locals 2

    .prologue
    .line 111
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->namemax:J

    return-wide v0
.end method

.method public getMountFlag()J
    .locals 2

    .prologue
    .line 110
    iget-wide v0, p0, Lcom/jcraft/jsch/SftpStatVFS;->flag:J

    return-wide v0
.end method

.method public getSize()J
    .locals 4

    .prologue
    .line 114
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method

.method public getUsed()J
    .locals 6

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFragmentSize()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getBlocks()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/jcraft/jsch/SftpStatVFS;->getFreeBlocks()J

    move-result-wide v4

    sub-long/2addr v2, v4

    mul-long/2addr v0, v2

    const-wide/16 v2, 0x400

    div-long/2addr v0, v2

    return-wide v0
.end method
