.class public abstract Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
.super Ljava/lang/Object;
.source "PackBitmapIndex.java"


# static fields
.field public static final FLAG_REUSE:I = 0x1


# instance fields
.field packChecksum:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static open(Ljava/io/File;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 7
    .parameter "idxFile"
    .parameter "packIndex"
    .parameter "reverseIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 96
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 98
    .local v1, fd:Ljava/io/FileInputStream;
    :try_start_0
    invoke-static {v1, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;->read(Ljava/io/InputStream;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 108
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 111
    :goto_0
    return-object v4

    .line 99
    :catch_0
    move-exception v2

    .line 100
    .local v2, ioe:Ljava/io/IOException;
    :try_start_2
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 102
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

    .line 104
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {v0, v2}, Ljava/io/IOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 105
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 107
    .end local v0           #err:Ljava/io/IOException;
    .end local v2           #ioe:Ljava/io/IOException;
    .end local v3           #path:Ljava/lang/String;
    :catchall_0
    move-exception v4

    .line 108
    :try_start_3
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 111
    :goto_1
    throw v4

    .line 109
    :catch_1
    move-exception v5

    goto :goto_0

    :catch_2
    move-exception v5

    goto :goto_1
.end method

.method public static read(Ljava/io/InputStream;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndex;
    .locals 1
    .parameter "fd"
    .parameter "packIndex"
    .parameter "reverseIndex"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 139
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;

    invoke-direct {v0, p0, p1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;-><init>(Ljava/io/InputStream;Lorg/eclipse/jgit/internal/storage/file/PackIndex;Lorg/eclipse/jgit/internal/storage/file/PackReverseIndex;)V

    return-object v0
.end method


# virtual methods
.method public abstract findPosition(Lorg/eclipse/jgit/lib/AnyObjectId;)I
.end method

.method public abstract getBitmap(Lorg/eclipse/jgit/lib/AnyObjectId;)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
.end method

.method public abstract getObject(I)Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation
.end method

.method public abstract getObjectCount()I
.end method

.method public abstract ofObjectType(Lcom/googlecode/javaewah/EWAHCompressedBitmap;I)Lcom/googlecode/javaewah/EWAHCompressedBitmap;
.end method
