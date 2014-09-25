.class public Lorg/eclipse/jgit/util/FileUtils;
.super Ljava/lang/Object;
.source "FileUtils.java"


# static fields
.field public static final EMPTY_DIRECTORIES_ONLY:I = 0x10

.field public static final IGNORE_ERRORS:I = 0x8

.field public static final NONE:I = 0x0

.field public static final RECURSIVE:I = 0x1

.field public static final RETRY:I = 0x2

.field public static final SKIP_MISSING:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createNewFile(Ljava/io/File;)V
    .locals 4
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    move-result v0

    if-nez v0, :cond_0

    .line 338
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->createNewFileFailed:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_0
    return-void
.end method

.method public static createSymLink(Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .parameter "path"
    .parameter "target"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 352
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v0, p0, p1}, Lorg/eclipse/jgit/util/FS;->createSymLink(Ljava/io/File;Ljava/lang/String;)V

    .line 353
    return-void
.end method

.method public static createTempDir(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;
    .locals 5
    .parameter "prefix"
    .parameter "suffix"
    .parameter "dir"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 379
    const/4 v0, 0x1

    .line 380
    .local v0, RETRY:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    const/4 v3, 0x1

    if-ge v1, v3, :cond_2

    .line 381
    invoke-static {p0, p1, p2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .line 382
    .local v2, tmp:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_1

    .line 380
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 384
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->mkdir()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 386
    return-object v2

    .line 388
    .end local v2           #tmp:Ljava/io/File;
    :cond_2
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->cannotCreateTempDir:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static delete(Ljava/io/File;)V
    .locals 1
    .parameter "f"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 109
    return-void
.end method

.method public static delete(Ljava/io/File;I)V
    .locals 18
    .parameter "f"
    .parameter "options"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    sget-object v8, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    .line 130
    .local v8, fs:Lorg/eclipse/jgit/util/FS;
    and-int/lit8 v13, p1, 0x4

    if-eqz v13, :cond_1

    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v13

    if-nez v13, :cond_1

    .line 183
    :cond_0
    return-void

    .line 133
    :cond_1
    and-int/lit8 v13, p1, 0x1

    if-eqz v13, :cond_5

    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/util/FS;->isDirectory(Ljava/io/File;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 134
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v11

    .line 135
    .local v11, items:[Ljava/io/File;
    if-eqz v11, :cond_5

    .line 136
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .local v7, files:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 138
    .local v5, dirs:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    move-object v1, v11

    .local v1, arr$:[Ljava/io/File;
    array-length v12, v1

    .local v12, len$:I
    const/4 v10, 0x0

    .local v10, i$:I
    :goto_0
    if-ge v10, v12, :cond_3

    aget-object v2, v1, v10

    .line 139
    .local v2, c:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isFile()Z

    move-result v13

    if-eqz v13, :cond_2

    .line 140
    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 138
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 142
    :cond_2
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 146
    .end local v2           #c:Ljava/io/File;
    :cond_3
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/io/File;

    .line 147
    .local v6, file:Ljava/io/File;
    move/from16 v0, p1

    invoke-static {v6, v0}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    goto :goto_2

    .line 148
    .end local v6           #file:Ljava/io/File;
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    .line 149
    .local v3, d:Ljava/io/File;
    move/from16 v0, p1

    invoke-static {v3, v0}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    goto :goto_3

    .line 153
    .end local v1           #arr$:[Ljava/io/File;
    .end local v3           #d:Ljava/io/File;
    .end local v5           #dirs:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    .end local v7           #files:Ljava/util/List;,"Ljava/util/List<Ljava/io/File;>;"
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v11           #items:[Ljava/io/File;
    .end local v12           #len$:I
    :cond_5
    const/4 v4, 0x0

    .line 154
    .local v4, delete:Z
    and-int/lit8 v13, p1, 0x10

    if-eqz v13, :cond_8

    .line 155
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->isDirectory()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 156
    const/4 v4, 0x1

    .line 167
    :cond_6
    :goto_4
    if-eqz v4, :cond_0

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->delete()Z

    move-result v13

    if-nez v13, :cond_0

    .line 168
    and-int/lit8 v13, p1, 0x2

    if-eqz v13, :cond_9

    move-object/from16 v0, p0

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/util/FS;->exists(Ljava/io/File;)Z

    move-result v13

    if-eqz v13, :cond_9

    .line 169
    const/4 v9, 0x1

    .local v9, i:I
    :goto_5
    const/16 v13, 0xa

    if-ge v9, v13, :cond_9

    .line 171
    const-wide/16 v13, 0x64

    :try_start_0
    invoke-static {v13, v14}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    :goto_6
    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->delete()Z

    move-result v13

    if-nez v13, :cond_0

    .line 169
    add-int/lit8 v9, v9, 0x1

    goto :goto_5

    .line 158
    .end local v9           #i:I
    :cond_7
    and-int/lit8 v13, p1, 0x8

    if-nez v13, :cond_6

    .line 159
    new-instance v13, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->deleteFileFailed:Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 164
    :cond_8
    const/4 v4, 0x1

    goto :goto_4

    .line 179
    :cond_9
    and-int/lit8 v13, p1, 0x8

    if-nez v13, :cond_0

    .line 180
    new-instance v13, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->deleteFileFailed:Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-direct {v13, v14}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v13

    .line 172
    .restart local v9       #i:I
    :catch_0
    move-exception v13

    goto :goto_6
.end method

.method public static mkdir(Ljava/io/File;)V
    .locals 1
    .parameter "d"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 248
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdir(Ljava/io/File;Z)V

    .line 249
    return-void
.end method

.method public static mkdir(Ljava/io/File;Z)V
    .locals 5
    .parameter "d"
    .parameter "skipExisting"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 267
    invoke-virtual {p0}, Ljava/io/File;->mkdir()Z

    move-result v0

    if-nez v0, :cond_0

    .line 268
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 273
    :cond_0
    return-void

    .line 270
    :cond_1
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->mkDirFailed:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static mkdirs(Ljava/io/File;)V
    .locals 1
    .parameter "d"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;Z)V

    .line 291
    return-void
.end method

.method public static mkdirs(Ljava/io/File;Z)V
    .locals 5
    .parameter "d"
    .parameter "skipExisting"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_0

    .line 313
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 318
    :cond_0
    return-void

    .line 315
    :cond_1
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->mkDirsFailed:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readSymLink(Ljava/io/File;)Ljava/lang/String;
    .locals 1
    .parameter "path"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 363
    sget-object v0, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/util/FS;->readSymLink(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static rename(Ljava/io/File;Ljava/io/File;)V
    .locals 8
    .parameter "src"
    .parameter "dst"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x2

    const/4 v7, 0x0

    const/4 v2, 0x1

    .line 209
    sget-object v3, Lorg/eclipse/jgit/util/FS;->DETECTED:Lorg/eclipse/jgit/util/FS;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/FS;->retryFailedLockFileCommit()Z

    move-result v3

    if-eqz v3, :cond_1

    const/16 v0, 0xa

    .line 210
    .local v0, attempts:I
    :goto_0
    add-int/lit8 v0, v0, -0x1

    if-ltz v0, :cond_4

    .line 211
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 218
    :cond_0
    return-void

    .end local v0           #attempts:I
    :cond_1
    move v0, v2

    .line 209
    goto :goto_0

    .line 214
    .restart local v0       #attempts:I
    :cond_2
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result v3

    if-nez v3, :cond_3

    .line 215
    const/16 v3, 0x11

    invoke-static {p1, v3}, Lorg/eclipse/jgit/util/FileUtils;->delete(Ljava/io/File;I)V

    .line 217
    :cond_3
    invoke-virtual {p0, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result v3

    if-nez v3, :cond_0

    .line 223
    :goto_1
    const-wide/16 v3, 0x64

    :try_start_1
    invoke-static {v3, v4}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 224
    :catch_0
    move-exception v1

    .line 225
    .local v1, e:Ljava/lang/InterruptedException;
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->renameFileFailed:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 230
    .end local v1           #e:Ljava/lang/InterruptedException;
    :cond_4
    new-instance v3, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->renameFileFailed:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 219
    :catch_1
    move-exception v3

    goto :goto_1
.end method
