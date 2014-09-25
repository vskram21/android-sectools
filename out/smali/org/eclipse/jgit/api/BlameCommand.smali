.class public Lorg/eclipse/jgit/api/BlameCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "BlameCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/BlameCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/blame/BlameResult;",
        ">;"
    }
.end annotation


# instance fields
.field private diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

.field private followFileRenames:Ljava/lang/Boolean;

.field private path:Ljava/lang/String;

.field private reverseEndCommits:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;"
        }
    .end annotation
.end field

.field private startCommit:Lorg/eclipse/jgit/lib/ObjectId;

.field private textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 92
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 93
    return-void
.end method

.method private getRawText(Ljava/io/File;)Lorg/eclipse/jgit/diff/RawText;
    .locals 7
    .parameter "inTree"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 243
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/BlameCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v4

    invoke-virtual {v4}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v4

    sget-object v5, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v4, v5}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;

    .line 245
    .local v3, workingTreeOptions:Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;
    invoke-virtual {v3}, Lorg/eclipse/jgit/treewalk/WorkingTreeOptions;->getAutoCRLF()Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;

    move-result-object v0

    .line 246
    .local v0, autoCRLF:Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;
    sget-object v4, Lorg/eclipse/jgit/api/BlameCommand$1;->$SwitchMap$org$eclipse$jgit$lib$CoreConfig$AutoCRLF:[I

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/CoreConfig$AutoCRLF;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 261
    new-instance v4, Ljava/lang/IllegalArgumentException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unknown autocrlf option "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 251
    :pswitch_0
    new-instance v2, Lorg/eclipse/jgit/diff/RawText;

    invoke-direct {v2, p1}, Lorg/eclipse/jgit/diff/RawText;-><init>(Ljava/io/File;)V

    .line 264
    .local v2, rawText:Lorg/eclipse/jgit/diff/RawText;
    :goto_0
    return-object v2

    .line 254
    .end local v2           #rawText:Lorg/eclipse/jgit/diff/RawText;
    :pswitch_1
    new-instance v1, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;

    new-instance v4, Ljava/io/FileInputStream;

    invoke-direct {v4, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/4 v5, 0x1

    invoke-direct {v1, v4, v5}, Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;-><init>(Ljava/io/InputStream;Z)V

    .line 258
    .local v1, in:Lorg/eclipse/jgit/util/io/EolCanonicalizingInputStream;
    new-instance v2, Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v1, v4}, Lorg/eclipse/jgit/api/BlameCommand;->toByteArray(Ljava/io/InputStream;I)[B

    move-result-object v4

    invoke-direct {v2, v4}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    .line 259
    .restart local v2       #rawText:Lorg/eclipse/jgit/diff/RawText;
    goto :goto_0

    .line 246
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static toByteArray(Ljava/io/InputStream;I)[B
    .locals 5
    .parameter "source"
    .parameter "upperSizeLimit"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 269
    new-array v0, p1, [B

    .line 271
    .local v0, buffer:[B
    const/4 v3, 0x0

    :try_start_0
    invoke-static {p0, v0, v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BI)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    .line 272
    .local v2, read:I
    if-ne v2, p1, :cond_0

    .line 280
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .end local v0           #buffer:[B
    :goto_0
    return-object v0

    .line 275
    .restart local v0       #buffer:[B
    :cond_0
    :try_start_1
    new-array v1, v2, [B

    .line 276
    .local v1, copy:[B
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-static {v0, v3, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 280
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    move-object v0, v1

    goto :goto_0

    .end local v1           #copy:[B
    .end local v2           #read:I
    :catchall_0
    move-exception v3

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    throw v3
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/BlameCommand;->call()Lorg/eclipse/jgit/blame/BlameResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/blame/BlameResult;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/BlameCommand;->checkCallable()V

    .line 203
    new-instance v3, Lorg/eclipse/jgit/blame/BlameGenerator;

    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    iget-object v7, p0, Lorg/eclipse/jgit/api/BlameCommand;->path:Ljava/lang/String;

    invoke-direct {v3, v6, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;-><init>(Lorg/eclipse/jgit/lib/Repository;Ljava/lang/String;)V

    .line 205
    .local v3, gen:Lorg/eclipse/jgit/blame/BlameGenerator;
    :try_start_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    if-eqz v6, :cond_0

    .line 206
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/blame/BlameGenerator;->setDiffAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm;)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 207
    :cond_0
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    if-eqz v6, :cond_1

    .line 208
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/blame/BlameGenerator;->setTextComparator(Lorg/eclipse/jgit/diff/RawTextComparator;)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 209
    :cond_1
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->followFileRenames:Ljava/lang/Boolean;

    if-eqz v6, :cond_2

    .line 210
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->followFileRenames:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-virtual {v3, v6}, Lorg/eclipse/jgit/blame/BlameGenerator;->setFollowFileRenames(Z)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 212
    :cond_2
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->reverseEndCommits:Ljava/util/Collection;

    if-eqz v6, :cond_4

    .line 213
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->startCommit:Lorg/eclipse/jgit/lib/ObjectId;

    iget-object v7, p0, Lorg/eclipse/jgit/api/BlameCommand;->reverseEndCommits:Ljava/util/Collection;

    invoke-virtual {v3, v6, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Collection;)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 231
    :cond_3
    :goto_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/blame/BlameGenerator;->computeBlameResult()Lorg/eclipse/jgit/blame/BlameResult;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 235
    invoke-virtual {v3}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    return-object v6

    .line 214
    :cond_4
    :try_start_1
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->startCommit:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v6, :cond_5

    .line 215
    const/4 v6, 0x0

    iget-object v7, p0, Lorg/eclipse/jgit/api/BlameCommand;->startCommit:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v3, v6, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/blame/BlameGenerator;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 232
    :catch_0
    move-exception v1

    .line 233
    .local v1, e:Ljava/io/IOException;
    :try_start_2
    new-instance v6, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 235
    .end local v1           #e:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    invoke-virtual {v3}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    throw v6

    .line 217
    :cond_5
    const/4 v6, 0x0

    :try_start_3
    iget-object v7, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v8, "HEAD"

    invoke-virtual {v7, v8}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 218
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->isBare()Z

    move-result v6

    if-nez v6, :cond_3

    .line 219
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->readDirCache()Lorg/eclipse/jgit/dircache/DirCache;

    move-result-object v0

    .line 220
    .local v0, dc:Lorg/eclipse/jgit/dircache/DirCache;
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->path:Ljava/lang/String;

    invoke-virtual {v0, v6}, Lorg/eclipse/jgit/dircache/DirCache;->findEntry(Ljava/lang/String;)I

    move-result v2

    .line 221
    .local v2, entry:I
    if-ltz v2, :cond_6

    .line 222
    const/4 v6, 0x0

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/dircache/DirCache;->getEntry(I)Lorg/eclipse/jgit/dircache/DirCacheEntry;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/dircache/DirCacheEntry;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Ljava/lang/String;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 224
    :cond_6
    new-instance v4, Ljava/io/File;

    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v6

    iget-object v7, p0, Lorg/eclipse/jgit/api/BlameCommand;->path:Ljava/lang/String;

    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 225
    .local v4, inTree:Ljava/io/File;
    iget-object v6, p0, Lorg/eclipse/jgit/api/BlameCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v6}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v6

    invoke-virtual {v6, v4}, Lorg/eclipse/jgit/util/FS;->isFile(Ljava/io/File;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 226
    invoke-direct {p0, v4}, Lorg/eclipse/jgit/api/BlameCommand;->getRawText(Ljava/io/File;)Lorg/eclipse/jgit/diff/RawText;

    move-result-object v5

    .line 227
    .local v5, rawText:Lorg/eclipse/jgit/diff/RawText;
    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Lorg/eclipse/jgit/blame/BlameGenerator;->push(Ljava/lang/String;Lorg/eclipse/jgit/diff/RawText;)Lorg/eclipse/jgit/blame/BlameGenerator;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0
.end method

.method public reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Collection;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 1
    .parameter "start"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;)",
            "Lorg/eclipse/jgit/api/BlameCommand;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 190
    .local p2, end:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/lib/ObjectId;>;"
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/BlameCommand;->startCommit:Lorg/eclipse/jgit/lib/ObjectId;

    .line 191
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/BlameCommand;->reverseEndCommits:Ljava/util/Collection;

    .line 192
    return-object p0
.end method

.method public reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 1
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 172
    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/api/BlameCommand;->reverse(Lorg/eclipse/jgit/lib/AnyObjectId;Ljava/util/Collection;)Lorg/eclipse/jgit/api/BlameCommand;

    move-result-object v0

    return-object v0
.end method

.method public setDiffAlgorithm(Lorg/eclipse/jgit/diff/DiffAlgorithm;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 0
    .parameter "diffAlgorithm"

    .prologue
    .line 114
    iput-object p1, p0, Lorg/eclipse/jgit/api/BlameCommand;->diffAlgorithm:Lorg/eclipse/jgit/diff/DiffAlgorithm;

    .line 115
    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 0
    .parameter "filePath"

    .prologue
    .line 103
    iput-object p1, p0, Lorg/eclipse/jgit/api/BlameCommand;->path:Ljava/lang/String;

    .line 104
    return-object p0
.end method

.method public setFollowFileRenames(Z)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 1
    .parameter "follow"

    .prologue
    .line 153
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/BlameCommand;->followFileRenames:Ljava/lang/Boolean;

    .line 154
    return-object p0
.end method

.method public setStartCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 1
    .parameter "commit"

    .prologue
    .line 136
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->toObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/api/BlameCommand;->startCommit:Lorg/eclipse/jgit/lib/ObjectId;

    .line 137
    return-object p0
.end method

.method public setTextComparator(Lorg/eclipse/jgit/diff/RawTextComparator;)Lorg/eclipse/jgit/api/BlameCommand;
    .locals 0
    .parameter "textComparator"

    .prologue
    .line 125
    iput-object p1, p0, Lorg/eclipse/jgit/api/BlameCommand;->textComparator:Lorg/eclipse/jgit/diff/RawTextComparator;

    .line 126
    return-object p0
.end method
