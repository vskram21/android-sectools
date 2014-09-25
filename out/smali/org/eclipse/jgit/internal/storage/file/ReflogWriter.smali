.class public Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
.super Ljava/lang/Object;
.source "ReflogWriter.java"


# instance fields
.field private final forceWrite:Z

.field private final logsDir:Ljava/io/File;

.field private final logsRefsDir:Ljava/io/File;

.field private final parent:Lorg/eclipse/jgit/lib/Repository;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 1
    .parameter "repository"

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;-><init>(Lorg/eclipse/jgit/lib/Repository;Z)V

    .line 109
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;Z)V
    .locals 3
    .parameter "repository"
    .parameter "forceWrite"

    .prologue
    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getFS()Lorg/eclipse/jgit/util/FS;

    move-result-object v0

    .line 121
    .local v0, fs:Lorg/eclipse/jgit/util/FS;
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->parent:Lorg/eclipse/jgit/lib/Repository;

    .line 122
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/Repository;->getDirectory()Ljava/io/File;

    move-result-object v1

    .line 123
    .local v1, gitDir:Ljava/io/File;
    const-string v2, "logs"

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsDir:Ljava/io/File;

    .line 124
    const-string v2, "logs/refs/"

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/util/FS;->resolve(Ljava/io/File;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsRefsDir:Ljava/io/File;

    .line 125
    iput-boolean p2, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->forceWrite:Z

    .line 126
    return-void
.end method

.method private encode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)[B
    .locals 4
    .parameter "oldId"
    .parameter "newId"
    .parameter "ident"
    .parameter "message"

    .prologue
    const/16 v2, 0x20

    .line 233
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 234
    .local v0, r:Ljava/lang/StringBuilder;
    invoke-static {p1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 236
    invoke-static {p2}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 238
    invoke-virtual {p3}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    const/16 v1, 0x9

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 240
    const-string v1, "\r\n"

    const-string v2, " "

    invoke-virtual {p4, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "\n"

    const-string v3, " "

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 242
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v1

    return-object v1
.end method

.method private isLogAllRefUpdates()Z
    .locals 2

    .prologue
    .line 283
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->parent:Lorg/eclipse/jgit/lib/Repository;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v0

    sget-object v1, Lorg/eclipse/jgit/lib/CoreConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/lib/CoreConfig;

    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/CoreConfig;->isLogAllRefUpdates()Z

    move-result v0

    return v0
.end method

.method private log(Ljava/lang/String;[B)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 12
    .parameter "refName"
    .parameter "rec"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x0

    const/4 v9, 0x1

    .line 247
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logFor(Ljava/lang/String;)Ljava/io/File;

    move-result-object v4

    .line 248
    .local v4, log:Ljava/io/File;
    iget-boolean v10, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->forceWrite:Z

    if-nez v10, :cond_1

    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->isLogAllRefUpdates()Z

    move-result v10

    if-eqz v10, :cond_0

    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->shouldAutoCreateLog(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    :cond_0
    invoke-virtual {v4}, Ljava/io/File;->isFile()Z

    move-result v10

    if-eqz v10, :cond_2

    :cond_1
    move v7, v9

    .line 251
    .local v7, write:Z
    :goto_0
    if-nez v7, :cond_3

    .line 279
    :goto_1
    return-object p0

    .end local v7           #write:Z
    :cond_2
    move v7, v8

    .line 248
    goto :goto_0

    .line 254
    .restart local v7       #write:Z
    :cond_3
    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v10

    invoke-virtual {v10}, Lorg/eclipse/jgit/lib/Repository;->getConfig()Lorg/eclipse/jgit/lib/StoredConfig;

    move-result-object v10

    sget-object v11, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->KEY:Lorg/eclipse/jgit/lib/Config$SectionParser;

    invoke-virtual {v10, v11}, Lorg/eclipse/jgit/lib/StoredConfig;->get(Lorg/eclipse/jgit/lib/Config$SectionParser;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;

    .line 257
    .local v6, wc:Lorg/eclipse/jgit/internal/storage/file/WriteConfig;
    :try_start_0
    new-instance v5, Ljava/io/FileOutputStream;

    const/4 v10, 0x1

    invoke-direct {v5, v4, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    .local v5, out:Ljava/io/FileOutputStream;
    :goto_2
    :try_start_1
    invoke-virtual {v6}, Lorg/eclipse/jgit/internal/storage/file/WriteConfig;->getFSyncRefFiles()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 269
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    .line 270
    .local v3, fc:Ljava/nio/channels/FileChannel;
    invoke-static {p2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 271
    .local v0, buf:Ljava/nio/ByteBuffer;
    :goto_3
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v8

    if-lez v8, :cond_6

    .line 272
    invoke-virtual {v3, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    .line 277
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v3           #fc:Ljava/nio/channels/FileChannel;
    :catchall_0
    move-exception v8

    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    throw v8

    .line 258
    .end local v5           #out:Ljava/io/FileOutputStream;
    :catch_0
    move-exception v2

    .line 259
    .local v2, err:Ljava/io/FileNotFoundException;
    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    .line 260
    .local v1, dir:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v10

    if-eqz v10, :cond_4

    .line 261
    throw v2

    .line 262
    :cond_4
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v10

    if-nez v10, :cond_5

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v10

    if-nez v10, :cond_5

    .line 263
    new-instance v10, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateDirectory:Ljava/lang/String;

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v1, v9, v8

    invoke-static {v11, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v10, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 265
    :cond_5
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-direct {v5, v4, v9}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .restart local v5       #out:Ljava/io/FileOutputStream;
    goto :goto_2

    .line 273
    .end local v1           #dir:Ljava/io/File;
    .end local v2           #err:Ljava/io/FileNotFoundException;
    .restart local v0       #buf:Ljava/nio/ByteBuffer;
    .restart local v3       #fc:Ljava/nio/channels/FileChannel;
    :cond_6
    const/4 v8, 0x1

    :try_start_2
    invoke-virtual {v3, v8}, Ljava/nio/channels/FileChannel;->force(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 277
    .end local v0           #buf:Ljava/nio/ByteBuffer;
    .end local v3           #fc:Ljava/nio/channels/FileChannel;
    :goto_4
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    goto :goto_1

    .line 275
    :cond_7
    :try_start_3
    invoke-virtual {v5, p2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_4
.end method

.method public static refLockFor(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "name"

    .prologue
    .line 91
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".lock"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private shouldAutoCreateLog(Ljava/lang/String;)Z
    .locals 1
    .parameter "refName"

    .prologue
    .line 287
    const-string v0, "HEAD"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "refs/heads/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "refs/remotes/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "refs/stash"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public create()Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsDir:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsRefsDir:Ljava/io/File;

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 146
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsRefsDir:Ljava/io/File;

    const-string v2, "refs/heads/"

    const-string v3, "refs/"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-static {v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;)V

    .line 148
    return-object p0
.end method

.method public getRepository()Lorg/eclipse/jgit/lib/Repository;
    .locals 1

    .prologue
    .line 134
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->parent:Lorg/eclipse/jgit/lib/Repository;

    return-object v0
.end method

.method public log(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 2
    .parameter "refName"
    .parameter "oldId"
    .parameter "newId"
    .parameter "ident"
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 196
    invoke-direct {p0, p2, p3, p4, p5}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->encode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)[B

    move-result-object v0

    .line 197
    .local v0, encoded:[B
    invoke-direct {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;[B)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    move-result-object v1

    return-object v1
.end method

.method public log(Ljava/lang/String;Lorg/eclipse/jgit/lib/ReflogEntry;)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 6
    .parameter "refName"
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 178
    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ReflogEntry;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ReflogEntry;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ReflogEntry;->getWho()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v4

    invoke-interface {p2}, Lorg/eclipse/jgit/lib/ReflogEntry;->getComment()Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    move-result-object v0

    return-object v0
.end method

.method public log(Lorg/eclipse/jgit/lib/RefUpdate;Ljava/lang/String;Z)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;
    .locals 7
    .parameter "update"
    .parameter "msg"
    .parameter "deref"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 211
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getOldObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    .line 212
    .local v3, oldId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getNewObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 213
    .local v2, newId:Lorg/eclipse/jgit/lib/ObjectId;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRef()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v5

    .line 215
    .local v5, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    .line 216
    .local v0, ident:Lorg/eclipse/jgit/lib/PersonIdent;
    if-nez v0, :cond_0

    .line 217
    new-instance v0, Lorg/eclipse/jgit/lib/PersonIdent;

    .end local v0           #ident:Lorg/eclipse/jgit/lib/PersonIdent;
    iget-object v6, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->parent:Lorg/eclipse/jgit/lib/Repository;

    invoke-direct {v0, v6}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 221
    .restart local v0       #ident:Lorg/eclipse/jgit/lib/PersonIdent;
    :goto_0
    invoke-direct {p0, v3, v2, v0, p2}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->encode(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/PersonIdent;Ljava/lang/String;)[B

    move-result-object v4

    .line 222
    .local v4, rec:[B
    if-eqz p3, :cond_1

    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 223
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;[B)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 224
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v6

    invoke-interface {v6}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;[B)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    .line 228
    :goto_1
    return-object p0

    .line 219
    .end local v4           #rec:[B
    :cond_0
    new-instance v1, Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/lib/PersonIdent;-><init>(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .end local v0           #ident:Lorg/eclipse/jgit/lib/PersonIdent;
    .local v1, ident:Lorg/eclipse/jgit/lib/PersonIdent;
    move-object v0, v1

    .end local v1           #ident:Lorg/eclipse/jgit/lib/PersonIdent;
    .restart local v0       #ident:Lorg/eclipse/jgit/lib/PersonIdent;
    goto :goto_0

    .line 226
    .restart local v4       #rec:[B
    :cond_1
    invoke-interface {v5}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v4}, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->log(Ljava/lang/String;[B)Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;

    goto :goto_1
.end method

.method public logFor(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .parameter "name"

    .prologue
    .line 160
    const-string v0, "refs/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    const-string v0, "refs/"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 162
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsRefsDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 164
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/ReflogWriter;->logsDir:Ljava/io/File;

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    goto :goto_0
.end method
