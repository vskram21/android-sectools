.class public abstract Lorg/eclipse/jgit/lib/ObjectInserter;
.super Ljava/lang/Object;
.source "ObjectInserter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectInserter$Filter;,
        Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;
    }
.end annotation


# instance fields
.field private final digest:Ljava/security/MessageDigest;

.field private tempBuffer:[B


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    invoke-static {}, Lorg/eclipse/jgit/lib/Constants;->newMessageDigest()Ljava/security/MessageDigest;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectInserter;->digest:Ljava/security/MessageDigest;

    .line 157
    return-void
.end method


# virtual methods
.method protected buffer()[B
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectInserter;->tempBuffer:[B

    .line 185
    .local v0, b:[B
    if-nez v0, :cond_0

    .line 186
    const/16 v1, 0x2000

    new-array v0, v1, [B

    iput-object v0, p0, Lorg/eclipse/jgit/lib/ObjectInserter;->tempBuffer:[B

    .line 187
    :cond_0
    return-object v0
.end method

.method protected digest()Ljava/security/MessageDigest;
    .locals 1

    .prologue
    .line 192
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectInserter;->digest:Ljava/security/MessageDigest;

    invoke-virtual {v0}, Ljava/security/MessageDigest;->reset()V

    .line 193
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectInserter;->digest:Ljava/security/MessageDigest;

    return-object v0
.end method

.method public abstract flush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public idFor(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 6
    .parameter "objectType"
    .parameter "length"
    .parameter "in"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 248
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;->digest()Ljava/security/MessageDigest;

    move-result-object v1

    .line 249
    .local v1, md:Ljava/security/MessageDigest;
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 250
    const/16 v3, 0x20

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update(B)V

    .line 251
    invoke-static {p2, p3}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 252
    invoke-virtual {v1, v5}, Ljava/security/MessageDigest;->update(B)V

    .line 253
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;->buffer()[B

    move-result-object v0

    .line 254
    .local v0, buf:[B
    :goto_0
    const-wide/16 v3, 0x0

    cmp-long v3, p2, v3

    if-lez v3, :cond_1

    .line 255
    array-length v3, v0

    int-to-long v3, v3

    invoke-static {p2, p3, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-virtual {p4, v0, v5, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 256
    .local v2, n:I
    if-gez v2, :cond_0

    .line 257
    new-instance v3, Ljava/io/EOFException;

    const-string v4, "Unexpected end of input"

    invoke-direct {v3, v4}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 258
    :cond_0
    invoke-virtual {v1, v0, v5, v2}, Ljava/security/MessageDigest;->update([BII)V

    .line 259
    int-to-long v3, v2

    sub-long/2addr p2, v3

    .line 260
    goto :goto_0

    .line 261
    .end local v2           #n:I
    :cond_1
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    return-object v3
.end method

.method public idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "type"
    .parameter "data"

    .prologue
    .line 206
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public idFor(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"

    .prologue
    .line 223
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectInserter;->digest()Ljava/security/MessageDigest;

    move-result-object v0

    .line 224
    .local v0, md:Ljava/security/MessageDigest;
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encodedTypeString(I)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 225
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 226
    int-to-long v1, p4

    invoke-static {v1, v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(J)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update([B)V

    .line 227
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/security/MessageDigest;->update(B)V

    .line 228
    invoke-virtual {v0, p2, p3, p4}, Ljava/security/MessageDigest;->update([BII)V

    .line 229
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->fromRaw([B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    return-object v1
.end method

.method public idFor(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "formatter"

    .prologue
    .line 271
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/lib/TreeFormatter;->computeId(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public abstract insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "type"
    .parameter "data"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 329
    const/4 v0, 0x0

    array-length v1, p2

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public insert(I[BII)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 3
    .parameter "type"
    .parameter "data"
    .parameter "off"
    .parameter "len"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 349
    int-to-long v0, p4

    new-instance v2, Ljava/io/ByteArrayInputStream;

    invoke-direct {v2, p2, p3, p4}, Ljava/io/ByteArrayInputStream;-><init>([BII)V

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(IJLjava/io/InputStream;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public final insert(Lorg/eclipse/jgit/lib/CommitBuilder;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "builder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 300
    const/4 v0, 0x1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/CommitBuilder;->build()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public final insert(Lorg/eclipse/jgit/lib/TagBuilder;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 2
    .parameter "builder"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 313
    const/4 v0, 0x4

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/TagBuilder;->build()[B

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/lib/ObjectInserter;->insert(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public final insert(Lorg/eclipse/jgit/lib/TreeFormatter;)Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1
    .parameter "formatter"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 287
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/lib/TreeFormatter;->insertTo(Lorg/eclipse/jgit/lib/ObjectInserter;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public abstract newPackParser(Ljava/io/InputStream;)Lorg/eclipse/jgit/transport/PackParser;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract release()V
.end method
