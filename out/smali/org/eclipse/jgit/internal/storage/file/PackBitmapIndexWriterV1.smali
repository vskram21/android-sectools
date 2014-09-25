.class public Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;
.super Ljava/lang/Object;
.source "PackBitmapIndexWriterV1.java"


# instance fields
.field private final dataOutput:Ljava/io/DataOutput;

.field private final out:Ljava/security/DigestOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .parameter "dst"

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    new-instance v1, Ljava/security/DigestOutputStream;

    instance-of v0, p1, Ljava/io/BufferedOutputStream;

    if-eqz v0, :cond_0

    .end local p1
    :goto_0
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    invoke-direct {v1, p1, v0}, Ljava/security/DigestOutputStream;-><init>(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V

    iput-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    .line 79
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/internal/storage/file/SimpleDataOutput;-><init>(Ljava/io/OutputStream;)V

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    .line 80
    return-void

    .line 76
    .restart local p1
    :cond_0
    new-instance v0, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/util/io/SafeBufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object p1, v0

    goto :goto_0
.end method

.method private writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V
    .locals 1
    .parameter "bitmap"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    invoke-virtual {p1, v0}, Lcom/googlecode/javaewah/EWAHCompressedBitmap;->serialize(Ljava/io/DataOutput;)V

    .line 130
    return-void
.end method

.method private writeBitmapEntry(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;)V
    .locals 3
    .parameter "entry"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->getObjectId()J

    move-result-wide v1

    long-to-int v1, v1

    invoke-interface {v0, v1}, Ljava/io/DataOutput;->writeInt(I)V

    .line 151
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->getXorOffset()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write(I)V

    .line 152
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->getFlags()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write(I)V

    .line 153
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;->getBitmap()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 154
    return-void
.end method

.method private writeBitmaps(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V
    .locals 9
    .parameter "bitmaps"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    const/4 v0, 0x0

    .line 135
    .local v0, bitmapCount:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getCompressedBitmaps()Ljava/lang/Iterable;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;

    .line 136
    .local v1, entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;
    invoke-direct {p0, v1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmapEntry(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;)V

    .line 137
    add-int/lit8 v0, v0, 0x1

    .line 138
    goto :goto_0

    .line 140
    .end local v1           #entry:Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder$StoredEntry;
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBitmapCount()I

    move-result v2

    .line 141
    .local v2, expectedBitmapCount:I
    if-eq v2, v0, :cond_1

    .line 142
    new-instance v4, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v5

    iget-object v5, v5, Lorg/eclipse/jgit/internal/JGitText;->expectedGot:Ljava/lang/String;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 146
    :cond_1
    return-void
.end method

.method private writeBody(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V
    .locals 1
    .parameter "bitmaps"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 121
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getCommits()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 122
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getTrees()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 123
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBlobs()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 124
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getTags()Lcom/googlecode/javaewah/EWAHCompressedBitmap;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmap(Lcom/googlecode/javaewah/EWAHCompressedBitmap;)V

    .line 125
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBitmaps(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V

    .line 126
    return-void
.end method

.method private writeFooter()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->on(Z)V

    .line 158
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v1}, Ljava/security/DigestOutputStream;->getMessageDigest()Ljava/security/MessageDigest;

    move-result-object v1

    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 159
    return-void
.end method

.method private writeHeader(II[B)V
    .locals 2
    .parameter "options"
    .parameter "bitmapCount"
    .parameter "packDataChecksum"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    sget-object v1, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexV1;->MAGIC:[B

    invoke-virtual {v0, v1}, Ljava/security/DigestOutputStream;->write([B)V

    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Ljava/io/DataOutput;->writeShort(I)V

    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v0, p1}, Ljava/io/DataOutput;->writeShort(I)V

    .line 116
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->dataOutput:Ljava/io/DataOutput;

    invoke-interface {v0, p2}, Ljava/io/DataOutput;->writeInt(I)V

    .line 117
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v0, p3}, Ljava/security/DigestOutputStream;->write([B)V

    .line 118
    return-void
.end method


# virtual methods
.method public write(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;[B)V
    .locals 2
    .parameter "bitmaps"
    .parameter "packDataChecksum"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 99
    if-eqz p1, :cond_0

    array-length v0, p2

    const/16 v1, 0x14

    if-eq v0, v1, :cond_1

    .line 100
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 102
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getOptions()I

    move-result v0

    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;->getBitmapCount()I

    move-result v1

    invoke-direct {p0, v0, v1, p2}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeHeader(II[B)V

    .line 104
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeBody(Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexBuilder;)V

    .line 105
    invoke-direct {p0}, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->writeFooter()V

    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/PackBitmapIndexWriterV1;->out:Ljava/security/DigestOutputStream;

    invoke-virtual {v0}, Ljava/security/DigestOutputStream;->flush()V

    .line 108
    return-void
.end method
