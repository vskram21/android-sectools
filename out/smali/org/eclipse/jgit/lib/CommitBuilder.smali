.class public Lorg/eclipse/jgit/lib/CommitBuilder;
.super Ljava/lang/Object;
.source "CommitBuilder.java"


# static fields
.field private static final EMPTY_OBJECTID_LIST:[Lorg/eclipse/jgit/lib/ObjectId;

.field private static final hauthor:[B

.field private static final hcommitter:[B

.field private static final hencoding:[B

.field private static final hparent:[B

.field private static final htree:[B


# instance fields
.field private author:Lorg/eclipse/jgit/lib/PersonIdent;

.field private committer:Lorg/eclipse/jgit/lib/PersonIdent;

.field private encoding:Ljava/nio/charset/Charset;

.field private message:Ljava/lang/String;

.field private parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

.field private treeId:Lorg/eclipse/jgit/lib/ObjectId;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x0

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->EMPTY_OBJECTID_LIST:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 69
    const-string v0, "tree"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->htree:[B

    .line 71
    const-string v0, "parent"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->hparent:[B

    .line 73
    const-string v0, "author"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->hauthor:[B

    .line 75
    const-string v0, "committer"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->hcommitter:[B

    .line 77
    const-string v0, "encoding"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->hencoding:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    sget-object v0, Lorg/eclipse/jgit/lib/CommitBuilder;->EMPTY_OBJECTID_LIST:[Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 94
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    .line 95
    return-void
.end method


# virtual methods
.method public addParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 4
    .parameter "additionalParent"

    .prologue
    const/4 v3, 0x0

    .line 203
    iget-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v1, v1

    if-nez v1, :cond_0

    .line 204
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/lib/CommitBuilder;->setParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 211
    :goto_0
    return-void

    .line 206
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v1, v1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Lorg/eclipse/jgit/lib/ObjectId;

    .line 207
    .local v0, newParents:[Lorg/eclipse/jgit/lib/ObjectId;
    iget-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    iget-object v2, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v2, v2

    invoke-static {v1, v3, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 208
    iget-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    array-length v1, v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    aput-object v2, v0, v1

    .line 209
    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    goto :goto_0
.end method

.method public build()[B
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 263
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 264
    .local v4, os:Ljava/io/ByteArrayOutputStream;
    new-instance v6, Ljava/io/OutputStreamWriter;

    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-direct {v6, v4, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V

    .line 266
    .local v6, w:Ljava/io/OutputStreamWriter;
    :try_start_0
    sget-object v7, Lorg/eclipse/jgit/lib/CommitBuilder;->htree:[B

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 267
    const/16 v7, 0x20

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 268
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getTreeId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v7

    invoke-virtual {v7, v4}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo(Ljava/io/OutputStream;)V

    .line 269
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 271
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getParentIds()[Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    .local v0, arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v0, v2

    .line 272
    .local v5, p:Lorg/eclipse/jgit/lib/ObjectId;
    sget-object v7, Lorg/eclipse/jgit/lib/CommitBuilder;->hparent:[B

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 273
    const/16 v7, 0x20

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 274
    invoke-virtual {v5, v4}, Lorg/eclipse/jgit/lib/ObjectId;->copyTo(Ljava/io/OutputStream;)V

    .line 275
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 271
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 278
    .end local v5           #p:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    sget-object v7, Lorg/eclipse/jgit/lib/CommitBuilder;->hauthor:[B

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 279
    const/16 v7, 0x20

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 280
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 281
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->flush()V

    .line 282
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 284
    sget-object v7, Lorg/eclipse/jgit/lib/CommitBuilder;->hcommitter:[B

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 285
    const/16 v7, 0x20

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 286
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getCommitter()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v7

    invoke-virtual {v7}, Lorg/eclipse/jgit/lib/PersonIdent;->toExternalString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 287
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->flush()V

    .line 288
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 290
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v7

    sget-object v8, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    if-eq v7, v8, :cond_1

    .line 291
    sget-object v7, Lorg/eclipse/jgit/lib/CommitBuilder;->hencoding:[B

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 292
    const/16 v7, 0x20

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 293
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getEncoding()Ljava/nio/charset/Charset;

    move-result-object v7

    invoke-virtual {v7}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 294
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 297
    :cond_1
    const/16 v7, 0xa

    invoke-virtual {v4, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 299
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getMessage()Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 300
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 301
    invoke-virtual {v6}, Ljava/io/OutputStreamWriter;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 309
    :cond_2
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    return-object v7

    .line 303
    .end local v0           #arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :catch_0
    move-exception v1

    .line 307
    .local v1, err:Ljava/io/IOException;
    new-instance v7, Ljava/lang/RuntimeException;

    invoke-direct {v7, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method public getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getCommitter()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getEncoding()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 250
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getParentIds()[Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getTreeId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public setAuthor(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 0
    .parameter "newAuthor"

    .prologue
    .line 124
    iput-object p1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 125
    return-void
.end method

.method public setCommitter(Lorg/eclipse/jgit/lib/PersonIdent;)V
    .locals 0
    .parameter "newCommitter"

    .prologue
    .line 139
    iput-object p1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 140
    return-void
.end method

.method public setEncoding(Ljava/lang/String;)V
    .locals 1
    .parameter "encodingName"

    .prologue
    .line 235
    invoke-static {p1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    .line 236
    return-void
.end method

.method public setEncoding(Ljava/nio/charset/Charset;)V
    .locals 0
    .parameter "enc"

    .prologue
    .line 245
    iput-object p1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    .line 246
    return-void
.end method

.method public setMessage(Ljava/lang/String;)V
    .locals 0
    .parameter "newMessage"

    .prologue
    .line 225
    iput-object p1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->message:Ljava/lang/String;

    .line 226
    return-void
.end method

.method public setParentId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 3
    .parameter "newParent"

    .prologue
    .line 154
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 155
    return-void
.end method

.method public setParentIds(Ljava/util/List;)V
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/lib/AnyObjectId;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 191
    .local p1, newParents:Ljava/util/List;,"Ljava/util/List<+Lorg/eclipse/jgit/lib/AnyObjectId;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 192
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 193
    iget-object v2, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/lib/AnyObjectId;

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    aput-object v1, v2, v0

    .line 192
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 194
    :cond_0
    return-void
.end method

.method public setParentIds(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 3
    .parameter "parent1"
    .parameter "parent2"

    .prologue
    .line 169
    const/4 v0, 0x2

    new-array v0, v0, [Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p2}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    aput-object v2, v0, v1

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 170
    return-void
.end method

.method public varargs setParentIds([Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 3
    .parameter "newParents"

    .prologue
    .line 179
    array-length v1, p1

    new-array v1, v1, [Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .line 180
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 181
    iget-object v1, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    aget-object v2, p1, v0

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/ObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    aput-object v2, v1, v0

    .line 180
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 182
    :cond_0
    return-void
.end method

.method public setTreeId(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 1
    .parameter "id"

    .prologue
    .line 109
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/AnyObjectId;->copy()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 110
    return-void
.end method

.method public toByteArray()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 322
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/CommitBuilder;->build()[B

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 328
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .local v4, r:Ljava/lang/StringBuilder;
    const-string v5, "Commit"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    const-string v5, "={\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    const-string v5, "tree "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    if-eqz v5, :cond_0

    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->treeId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v5

    :goto_0
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    iget-object v0, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->parentIds:[Lorg/eclipse/jgit/lib/ObjectId;

    .local v0, arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_1
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 337
    .local v3, p:Lorg/eclipse/jgit/lib/ObjectId;
    const-string v5, "parent "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 333
    .end local v0           #arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #p:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_0
    const-string v5, "NOT_SET"

    goto :goto_0

    .line 342
    .restart local v0       #arr$:[Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v1       #i$:I
    .restart local v2       #len$:I
    :cond_1
    const-string v5, "author "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    if-eqz v5, :cond_3

    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->author:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/PersonIdent;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    const-string v5, "committer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->committer:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/PersonIdent;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 348
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    if-eqz v5, :cond_2

    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    sget-object v6, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    if-eq v5, v6, :cond_2

    .line 351
    const-string v5, "encoding "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->encoding:Ljava/nio/charset/Charset;

    invoke-virtual {v5}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 353
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 356
    :cond_2
    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->message:Ljava/lang/String;

    if-eqz v5, :cond_5

    iget-object v5, p0, Lorg/eclipse/jgit/lib/CommitBuilder;->message:Ljava/lang/String;

    :goto_4
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 358
    const-string v5, "}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    .line 343
    :cond_3
    const-string v5, "NOT_SET"

    goto :goto_2

    .line 347
    :cond_4
    const-string v5, "NOT_SET"

    goto :goto_3

    .line 357
    :cond_5
    const-string v5, ""

    goto :goto_4
.end method
