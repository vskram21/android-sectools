.class public Lorg/eclipse/jgit/storage/file/FileBasedConfig;
.super Lorg/eclipse/jgit/lib/StoredConfig;
.source "FileBasedConfig.java"


# instance fields
.field private final configFile:Ljava/io/File;

.field private final fs:Lorg/eclipse/jgit/util/FS;

.field private volatile hash:Lorg/eclipse/jgit/lib/ObjectId;

.field private volatile snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

.field private utf8Bom:Z


# direct methods
.method public constructor <init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "cfgLocation"
    .parameter "fs"

    .prologue
    .line 95
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;-><init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 96
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Config;Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V
    .locals 1
    .parameter "base"
    .parameter "cfgLocation"
    .parameter "fs"

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/lib/StoredConfig;-><init>(Lorg/eclipse/jgit/lib/Config;)V

    .line 111
    iput-object p2, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->configFile:Ljava/io/File;

    .line 112
    iput-object p3, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->fs:Lorg/eclipse/jgit/util/FS;

    .line 113
    sget-object v0, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->DIRTY:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    iput-object v0, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 114
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash:Lorg/eclipse/jgit/lib/ObjectId;

    .line 115
    return-void
.end method

.method private static hash([B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "rawText"

    .prologue
    .line 227
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 222
    const/4 v0, 0x0

    new-array v0, v0, [B

    invoke-static {v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash:Lorg/eclipse/jgit/lib/ObjectId;

    .line 223
    invoke-super {p0}, Lorg/eclipse/jgit/lib/StoredConfig;->clear()V

    .line 224
    return-void
.end method

.method public final getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 125
    iget-object v0, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->configFile:Ljava/io/File;

    return-object v0
.end method

.method public isOutdated()Z
    .locals 2

    .prologue
    .line 241
    iget-object v0, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->isModified(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public load()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/ConfigInvalidException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x3

    const/4 v12, 0x0

    const/4 v11, 0x1

    .line 141
    iget-object v7, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 142
    .local v7, oldSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->save(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v5

    .line 144
    .local v5, newSnapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    :try_start_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v8

    invoke-static {v8}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v3

    .line 145
    .local v3, in:[B
    invoke-static {v3}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    .line 146
    .local v4, newHash:Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v8, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v8, v4}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 147
    invoke-virtual {v7, v5}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->equals(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 148
    invoke-virtual {v7, v5}, Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;->setClean(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;)V

    .line 175
    .end local v3           #in:[B
    .end local v4           #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :goto_0
    return-void

    .line 150
    .restart local v3       #in:[B
    .restart local v4       #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    iput-object v5, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 165
    .end local v3           #in:[B
    .end local v4           #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v6

    .line 166
    .local v6, noFile:Ljava/io/FileNotFoundException;
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->clear()V

    .line 167
    iput-object v5, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    goto :goto_0

    .line 153
    .end local v6           #noFile:Ljava/io/FileNotFoundException;
    .restart local v3       #in:[B
    .restart local v4       #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_1
    :try_start_1
    array-length v8, v3

    if-lt v8, v9, :cond_2

    const/4 v8, 0x0

    aget-byte v8, v3, v8

    const/16 v9, -0x11

    if-ne v8, v9, :cond_2

    const/4 v8, 0x1

    aget-byte v8, v3, v8

    const/16 v9, -0x45

    if-ne v8, v9, :cond_2

    const/4 v8, 0x2

    aget-byte v8, v3, v8

    const/16 v9, -0x41

    if-ne v8, v9, :cond_2

    .line 155
    sget-object v8, Lorg/eclipse/jgit/util/RawParseUtils;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    const/4 v9, 0x3

    array-length v10, v3

    invoke-static {v8, v3, v9, v10}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    .line 157
    .local v0, decoded:Ljava/lang/String;
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->utf8Bom:Z

    .line 161
    :goto_1
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->fromText(Ljava/lang/String;)V

    .line 162
    iput-object v5, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 163
    iput-object v4, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash:Lorg/eclipse/jgit/lib/ObjectId;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_1 .. :try_end_1} :catch_2

    goto :goto_0

    .line 168
    .end local v0           #decoded:Ljava/lang/String;
    .end local v3           #in:[B
    .end local v4           #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_1
    move-exception v1

    .line 169
    .local v1, e:Ljava/io/IOException;
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v8

    iget-object v8, v8, Lorg/eclipse/jgit/internal/JGitText;->cannotReadFile:Ljava/lang/String;

    new-array v9, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v10

    aput-object v10, v9, v12

    invoke-static {v8, v9}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v2, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 170
    .local v2, e2:Ljava/io/IOException;
    invoke-virtual {v2, v1}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 171
    throw v2

    .line 159
    .end local v1           #e:Ljava/io/IOException;
    .end local v2           #e2:Ljava/io/IOException;
    .restart local v3       #in:[B
    .restart local v4       #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_2
    :try_start_2
    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([B)Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/eclipse/jgit/errors/ConfigInvalidException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v0

    .restart local v0       #decoded:Ljava/lang/String;
    goto :goto_1

    .line 172
    .end local v0           #decoded:Ljava/lang/String;
    .end local v3           #in:[B
    .end local v4           #newHash:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_2
    move-exception v1

    .line 173
    .local v1, e:Lorg/eclipse/jgit/errors/ConfigInvalidException;
    new-instance v8, Lorg/eclipse/jgit/errors/ConfigInvalidException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v9

    iget-object v9, v9, Lorg/eclipse/jgit/internal/JGitText;->cannotReadFile:Ljava/lang/String;

    new-array v10, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v9, v10}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9, v1}, Lorg/eclipse/jgit/errors/ConfigInvalidException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v8
.end method

.method protected notifyUponTransientChanges()Z
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return v0
.end method

.method public save()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 191
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->toText()Ljava/lang/String;

    move-result-object v3

    .line 192
    .local v3, text:Ljava/lang/String;
    iget-boolean v4, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->utf8Bom:Z

    if-eqz v4, :cond_0

    .line 193
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 194
    .local v0, bos:Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0xef

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 195
    const/16 v4, 0xbb

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 196
    const/16 v4, 0xbf

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 197
    sget-object v4, Lorg/eclipse/jgit/util/RawParseUtils;->UTF8_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v4}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 198
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    .line 203
    .end local v0           #bos:Ljava/io/ByteArrayOutputStream;
    .local v2, out:[B
    :goto_0
    new-instance v1, Lorg/eclipse/jgit/internal/storage/file/LockFile;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v4

    iget-object v5, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->fs:Lorg/eclipse/jgit/util/FS;

    invoke-direct {v1, v4, v5}, Lorg/eclipse/jgit/internal/storage/file/LockFile;-><init>(Ljava/io/File;Lorg/eclipse/jgit/util/FS;)V

    .line 204
    .local v1, lf:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->lock()Z

    move-result v4

    if-nez v4, :cond_1

    .line 205
    new-instance v4, Lorg/eclipse/jgit/errors/LockFailedException;

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/eclipse/jgit/errors/LockFailedException;-><init>(Ljava/io/File;)V

    throw v4

    .line 200
    .end local v1           #lf:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    .end local v2           #out:[B
    :cond_0
    invoke-static {v3}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v2

    .restart local v2       #out:[B
    goto :goto_0

    .line 207
    .restart local v1       #lf:Lorg/eclipse/jgit/internal/storage/file/LockFile;
    :cond_1
    const/4 v4, 0x1

    :try_start_0
    invoke-virtual {v1, v4}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->setNeedSnapshot(Z)V

    .line 208
    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->write([B)V

    .line 209
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->commit()Z

    move-result v4

    if-nez v4, :cond_2

    .line 210
    new-instance v4, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->cannotCommitWriteTo:Ljava/lang/String;

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    :catchall_0
    move-exception v4

    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    throw v4

    :cond_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->unlock()V

    .line 214
    invoke-virtual {v1}, Lorg/eclipse/jgit/internal/storage/file/LockFile;->getCommitSnapshot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->snapshot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 215
    invoke-static {v2}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->hash:Lorg/eclipse/jgit/lib/ObjectId;

    .line 217
    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->fireConfigChangedEvent()V

    .line 218
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 233
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/storage/file/FileBasedConfig;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
