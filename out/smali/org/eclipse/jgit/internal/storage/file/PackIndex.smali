.class public abstract Lorg/eclipse/jgit/internal/storage/file/PackIndex;
.super Ljava/lang/Object;
.source "PackIndex.java"

# interfaces
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/internal/storage/file/PackIndex$EntriesIterator;,
        Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;",
        ">;"
    }
.end annotation


# instance fields
.field protected packChecksum:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 355
    return-void
.end method

.method private static isTOC([B)Z
    .locals 4
    .parameter "h"

    .prologue
    .line 148
    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/PackIndexWriter;->TOC:[B

    .line 149
    .local v1, toc:[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_1

    .line 150
    aget-byte v2, p0, v0

    aget-byte v3, v1, v0

    if-eq v2, v3, :cond_0

    .line 151
    const/4 v2, 0x0

    .line 152
    :goto_1
    return v2

    .line 149
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 152
    :cond_1
    const/4 v2, 0x1

    goto :goto_1
.end method

.method public static open(Ljava/io/File;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 7
    .parameter "idxFile"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 96
    .local v1, fd:Ljava/io/FileInputStream;
    :try_start_0
    invoke-static {v1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->read(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 105
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 108
    :goto_0
    return-object v4

    .line 97
    :catch_0
    move-exception v2

    .line 98
    .local v2, ioe:Ljava/io/IOException;
    :try_start_2
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 100
    .local v3, path:Ljava/lang/String;
    new-instance v0, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->unreadablePackIndex:Ljava/lang/String;

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v3, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 101
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {v0, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 102
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 104
    .end local v0           #err:Ljava/io/IOException;
    .end local v2           #ioe:Ljava/io/IOException;
    .end local v3           #path:Ljava/lang/String;
    :catchall_0
    move-exception v4

    .line 105
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 108
    :goto_1
    throw v4

    .line 106
    :catch_1
    move-exception v5

    goto :goto_0

    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method public static read(Ljava/io/InputStream;)Lorg/eclipse/jgit/internal/storage/file/PackIndex;
    .locals 7
    .parameter "fd"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 131
    const/16 v2, 0x8

    new-array v0, v2, [B

    .line 132
    .local v0, hdr:[B
    array-length v2, v0

    invoke-static {p0, v0, v6, v2}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/InputStream;[BII)V

    .line 133
    invoke-static {v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->isTOC([B)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 134
    const/4 v2, 0x4

    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/NB;->decodeInt32([BI)I

    move-result v1

    .line 135
    .local v1, v:I
    packed-switch v1, :pswitch_data_0

    .line 139
    new-instance v2, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unsupportedPackIndexVersion:Ljava/lang/String;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 137
    :pswitch_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;

    invoke-direct {v2, p0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV2;-><init>(Ljava/io/InputStream;)V

    .line 144
    .end local v1           #v:I
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;

    invoke-direct {v2, p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackIndexV1;-><init>(Ljava/io/InputStream;[B)V

    goto :goto_0

    .line 135
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public abstract findCRC32(Lorg/eclipse/jgit/lib/AnyObjectId;)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/lang/UnsupportedOperationException;
        }
    .end annotation
.end method

.method public abstract findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J
.end method

.method public abstract getObjectCount()J
.end method

.method public final getObjectId(I)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "nthPosition"

    .prologue
    .line 240
    if-ltz p1, :cond_0

    .line 241
    int-to-long v2, p1

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectId(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 244
    :goto_0
    return-object v2

    .line 242
    :cond_0
    ushr-int/lit8 v1, p1, 0x1

    .line 243
    .local v1, u31:I
    and-int/lit8 v0, p1, 0x1

    .line 244
    .local v0, one:I
    int-to-long v2, v1

    const/4 v4, 0x1

    shl-long/2addr v2, v4

    int-to-long v4, v0

    or-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->getObjectId(J)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    goto :goto_0
.end method

.method public abstract getObjectId(J)Lorg/eclipse/jgit/lib/ObjectId;
.end method

.method abstract getOffset(J)J
.end method

.method public abstract getOffset64Count()J
.end method

.method public abstract hasCRC32Support()Z
.end method

.method public hasObject(Lorg/eclipse/jgit/lib/AnyObjectId;)Z
    .locals 4
    .parameter "id"

    .prologue
    .line 166
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackIndex;->findOffset(Lorg/eclipse/jgit/lib/AnyObjectId;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public abstract iterator()Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/eclipse/jgit/internal/storage/file/PackIndex$MutableEntry;",
            ">;"
        }
    .end annotation
.end method

.method public abstract resolve(Ljava/util/Set;Lorg/eclipse/jgit/lib/AbbreviatedObjectId;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/eclipse/jgit/lib/ObjectId;",
            ">;",
            "Lorg/eclipse/jgit/lib/AbbreviatedObjectId;",
            "I)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
