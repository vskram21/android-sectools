.class Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;
.super Ljava/lang/Object;
.source "RebaseCommand.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/api/RebaseCommand;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RebaseState"
.end annotation


# instance fields
.field private dir:Ljava/io/File;

.field private final repoDirectory:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0
    .parameter "repoDirectory"

    .prologue
    .line 1394
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1395
    iput-object p1, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->repoDirectory:Ljava/io/File;

    .line 1396
    return-void
.end method

.method private static createFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "parentDir"
    .parameter "name"
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1438
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1439
    .local v0, file:Ljava/io/File;
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 1441
    .local v1, fos:Ljava/io/FileOutputStream;
    :try_start_0
    const-string v2, "UTF-8"

    invoke-virtual {p2, v2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write([B)V

    .line 1442
    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Ljava/io/FileOutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1444
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 1446
    return-void

    .line 1444
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    throw v2
.end method

.method private static readFile(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "directory"
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1429
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v2}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v0

    .line 1431
    .local v0, content:[B
    array-length v2, v0

    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->prevLF([BI)I

    move-result v1

    .line 1432
    .local v1, end:I
    const/4 v2, 0x0

    add-int/lit8 v3, v1, 0x1

    invoke-static {v0, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public createFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "name"
    .parameter "content"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1416
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->createFile(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 1417
    return-void
.end method

.method public getDir()Ljava/io/File;
    .locals 4

    .prologue
    .line 1399
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->dir:Ljava/io/File;

    if-nez v2, :cond_0

    .line 1400
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->repoDirectory:Ljava/io/File;

    const-string v3, "rebase-apply"

    invoke-direct {v0, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1401
    .local v0, rebaseApply:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1402
    iput-object v0, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->dir:Ljava/io/File;

    .line 1408
    .end local v0           #rebaseApply:Ljava/io/File;
    :cond_0
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->dir:Ljava/io/File;

    return-object v2

    .line 1404
    .restart local v0       #rebaseApply:Ljava/io/File;
    :cond_1
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->repoDirectory:Ljava/io/File;

    const-string v3, "rebase-merge"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1405
    .local v1, rebaseMerge:Ljava/io/File;
    iput-object v1, p0, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->dir:Ljava/io/File;

    goto :goto_0
.end method

.method public getFile(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "name"

    .prologue
    .line 1420
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method public getPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "name"

    .prologue
    .line 1424
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readFile(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "name"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1412
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->getDir()Ljava/io/File;

    move-result-object v0

    invoke-static {v0, p1}, Lorg/eclipse/jgit/api/RebaseCommand$RebaseState;->readFile(Ljava/io/File;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
