.class public final Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;
.super Ljava/io/OutputStream;
.source "PackOutputStream.java"


# static fields
.field private static final BYTES_TO_WRITE_BEFORE_CANCEL_CHECK:I = 0x20000


# instance fields
.field private checkCancelAt:J

.field private final copyBuffer:[B

.field private count:J

.field private final headerBuffer:[B

.field private final md:Ljava/security/MessageDigest;

.field private ofsDelta:Z

.field private final out:Ljava/io/OutputStream;

.field private final packWriter:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

.field private final writeMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ProgressMonitor;Ljava/io/OutputStream;Lorg/eclipse/jgit/internal/storage/pack/PackWriter;)V
    .locals 2
    .parameter "writeMonitor"
    .parameter "out"
    .parameter "pw"

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 70
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->md:Ljava/security/MessageDigest;

    .line 74
    const/16 v0, 0x20

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    .line 76
    const/high16 v0, 0x1

    new-array v0, v0, [B

    iput-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->copyBuffer:[B

    .line 98
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    .line 99
    iput-object p2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->out:Ljava/io/OutputStream;

    .line 100
    iput-object p3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->packWriter:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    .line 101
    const-wide/32 v0, 0x20000

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->checkCancelAt:J

    .line 102
    return-void
.end method

.method private static final objectHeader(JI[B)I
    .locals 7
    .parameter "len"
    .parameter "type"
    .parameter "buf"

    .prologue
    .line 201
    shl-int/lit8 v3, p2, 0x4

    int-to-long v3, v3

    const-wide/16 v5, 0xf

    and-long/2addr v5, p0

    or-long/2addr v3, v5

    long-to-int v3, v3

    int-to-byte v0, v3

    .line 202
    .local v0, b:B
    const/4 v1, 0x0

    .line 203
    .local v1, n:I
    const/4 v3, 0x4

    ushr-long/2addr p0, v3

    move v2, v1

    .end local v1           #n:I
    .local v2, n:I
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, p0, v3

    if-eqz v3, :cond_0

    .line 204
    add-int/lit8 v1, v2, 0x1

    .end local v2           #n:I
    .restart local v1       #n:I
    or-int/lit16 v3, v0, 0x80

    int-to-byte v3, v3

    aput-byte v3, p3, v2

    .line 205
    const-wide/16 v3, 0x7f

    and-long/2addr v3, p0

    long-to-int v3, v3

    int-to-byte v0, v3

    .line 203
    const/4 v3, 0x7

    ushr-long/2addr p0, v3

    move v2, v1

    .end local v1           #n:I
    .restart local v2       #n:I
    goto :goto_0

    .line 207
    :cond_0
    add-int/lit8 v1, v2, 0x1

    .end local v2           #n:I
    .restart local v1       #n:I
    aput-byte v0, p3, v2

    .line 208
    return v1
.end method

.method private static final ofsDelta(J[BI)I
    .locals 7
    .parameter "diff"
    .parameter "buf"
    .parameter "p"

    .prologue
    const-wide/16 v5, 0x7f

    .line 212
    invoke-static {p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->ofsDeltaVarIntLength(J)I

    move-result v1

    add-int/2addr p3, v1

    .line 213
    move v0, p3

    .line 214
    .local v0, n:I
    add-int/lit8 v0, v0, -0x1

    and-long v1, p0, v5

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    .line 215
    :goto_0
    const/4 v1, 0x7

    ushr-long/2addr p0, v1

    const-wide/16 v1, 0x0

    cmp-long v1, p0, v1

    if-eqz v1, :cond_0

    .line 216
    add-int/lit8 v0, v0, -0x1

    const-wide/16 v1, 0x80

    const-wide/16 v3, 0x1

    sub-long/2addr p0, v3

    and-long v3, p0, v5

    or-long/2addr v1, v3

    long-to-int v1, v1

    int-to-byte v1, v1

    aput-byte v1, p2, v0

    goto :goto_0

    .line 217
    :cond_0
    return p3
.end method

.method private static final ofsDeltaVarIntLength(J)I
    .locals 3
    .parameter "v"

    .prologue
    .line 221
    const/4 v0, 0x1

    .line 222
    .local v0, n:I
    :goto_0
    const/4 v1, 0x7

    ushr-long/2addr p0, v1

    const-wide/16 v1, 0x0

    cmp-long v1, p0, v1

    if-eqz v1, :cond_0

    .line 223
    const-wide/16 v1, 0x1

    sub-long/2addr p0, v1

    .line 222
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 224
    :cond_0
    return v0
.end method


# virtual methods
.method endObject()V
    .locals 2

    .prologue
    .line 233
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 234
    return-void
.end method

.method public flush()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 136
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    .line 137
    return-void
.end method

.method public final getCopyBuffer()[B
    .locals 1

    .prologue
    .line 229
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->copyBuffer:[B

    return-object v0
.end method

.method final getDigest()[B
    .locals 1

    .prologue
    .line 243
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->md:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v0

    return-object v0
.end method

.method public final length()J
    .locals 2

    .prologue
    .line 238
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    return-wide v0
.end method

.method public final write(I)V
    .locals 4
    .parameter "b"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    .line 107
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->md:Ljava/security/MessageDigest;

    int-to-byte v1, p1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 109
    return-void
.end method

.method public final write([BII)V
    .locals 5
    .parameter "b"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 114
    :goto_0
    if-lez p3, :cond_2

    .line 115
    const/high16 v1, 0x2

    invoke-static {p3, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 116
    .local v0, n:I
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    .line 118
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->checkCancelAt:J

    iget-wide v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    cmp-long v1, v1, v3

    if-gtz v1, :cond_1

    .line 119
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->writeMonitor:Lorg/eclipse/jgit/lib/ProgressMonitor;

    invoke-interface {v1}, Lorg/eclipse/jgit/lib/ProgressMonitor;->isCancelled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 120
    new-instance v1, Ljava/io/IOException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->packingCancelledDuringObjectsWriting:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 123
    :cond_0
    iget-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    const-wide/32 v3, 0x20000

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->checkCancelAt:J

    .line 126
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->out:Ljava/io/OutputStream;

    invoke-virtual {v1, p1, p2, v0}, Ljava/io/OutputStream;->write([BII)V

    .line 127
    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->md:Ljava/security/MessageDigest;

    invoke-virtual {v1, p1, p2, v0}, Ljava/security/MessageDigest;->update([BII)V

    .line 129
    add-int/2addr p2, v0

    .line 130
    sub-int/2addr p3, v0

    .line 131
    goto :goto_0

    .line 132
    .end local v0           #n:I
    :cond_2
    return-void
.end method

.method final writeFileHeader(IJ)V
    .locals 4
    .parameter "version"
    .parameter "objectCount"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x4

    const/4 v3, 0x0

    .line 141
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->PACK_SIGNATURE:[B

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {v0, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {v0, v2, p1}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 143
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    const/16 v1, 0x8

    long-to-int v2, p2

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/NB;->encodeInt32([BII)V

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    const/16 v1, 0xc

    invoke-virtual {p0, v0, v3, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 145
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->packWriter:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->isDeltaBaseAsOffset()Z

    move-result v0

    iput-boolean v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->ofsDelta:Z

    .line 146
    return-void
.end method

.method public final writeHeader(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;J)V
    .locals 7
    .parameter "otp"
    .parameter "rawLength"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 185
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBase()Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;

    move-result-object v0

    .line 186
    .local v0, b:Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isWritten()Z

    move-result v2

    iget-boolean v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->ofsDelta:Z

    and-int/2addr v2, v3

    if-eqz v2, :cond_0

    .line 187
    const/4 v2, 0x6

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {p2, p3, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->objectHeader(JI[B)I

    move-result v1

    .line 188
    .local v1, n:I
    iget-wide v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->count:J

    invoke-virtual {v0}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getOffset()J

    move-result-wide v4

    sub-long/2addr v2, v4

    iget-object v4, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {v2, v3, v4, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->ofsDelta(J[BI)I

    move-result v1

    .line 189
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-virtual {p0, v2, v6, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    .line 198
    :goto_0
    return-void

    .line 190
    .end local v1           #n:I
    :cond_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->isDeltaRepresentation()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 191
    const/4 v2, 0x7

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {p2, p3, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->objectHeader(JI[B)I

    move-result v1

    .line 192
    .restart local v1       #n:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getDeltaBaseId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-virtual {v2, v3, v1}, Lorg/eclipse/jgit/lib/ObjectId;->copyRawTo([BI)V

    .line 193
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    add-int/lit8 v3, v1, 0x14

    invoke-virtual {p0, v2, v6, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    goto :goto_0

    .line 195
    .end local v1           #n:I
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;->getType()I

    move-result v2

    iget-object v3, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-static {p2, p3, v2, v3}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->objectHeader(JI[B)I

    move-result v1

    .line 196
    .restart local v1       #n:I
    iget-object v2, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->headerBuffer:[B

    invoke-virtual {p0, v2, v6, v1}, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->write([BII)V

    goto :goto_0
.end method

.method public final writeObject(Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V
    .locals 1
    .parameter "otp"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 164
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;->packWriter:Lorg/eclipse/jgit/internal/storage/pack/PackWriter;

    invoke-virtual {v0, p0, p1}, Lorg/eclipse/jgit/internal/storage/pack/PackWriter;->writeObject(Lorg/eclipse/jgit/internal/storage/pack/PackOutputStream;Lorg/eclipse/jgit/internal/storage/pack/ObjectToPack;)V

    .line 165
    return-void
.end method
