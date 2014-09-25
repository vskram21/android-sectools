.class public Lorg/eclipse/jgit/diff/RawText;
.super Lorg/eclipse/jgit/diff/Sequence;
.source "RawText.java"


# static fields
.field public static final EMPTY_TEXT:Lorg/eclipse/jgit/diff/RawText; = null

.field private static final FIRST_FEW_BYTES:I = 0x1f40


# instance fields
.field protected final content:[B

.field protected final lines:Lorg/eclipse/jgit/util/IntList;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 70
    new-instance v0, Lorg/eclipse/jgit/diff/RawText;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    sput-object v0, Lorg/eclipse/jgit/diff/RawText;->EMPTY_TEXT:Lorg/eclipse/jgit/diff/RawText;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .parameter "file"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {p1}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    .line 107
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3
    .parameter "input"

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/Sequence;-><init>()V

    .line 91
    iput-object p1, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    .line 92
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    const/4 v1, 0x0

    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    array-length v2, v2

    invoke-static {v0, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->lineMap([BII)Lorg/eclipse/jgit/util/IntList;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    .line 93
    return-void
.end method

.method private getEnd(I)I
    .locals 2
    .parameter "i"

    .prologue
    .line 215
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v1, p1, 0x2

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    return v0
.end method

.method private getStart(I)I
    .locals 2
    .parameter "i"

    .prologue
    .line 211
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    add-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    return v0
.end method

.method public static isBinary(Ljava/io/InputStream;)Z
    .locals 4
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 246
    const/16 v3, 0x1f40

    new-array v0, v3, [B

    .line 247
    .local v0, buffer:[B
    const/4 v1, 0x0

    .line 248
    .local v1, cnt:I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 249
    array-length v3, v0

    sub-int/2addr v3, v1

    invoke-virtual {p0, v0, v1, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    .line 250
    .local v2, n:I
    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    .line 254
    .end local v2           #n:I
    :cond_0
    invoke-static {v0, v1}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v3

    return v3

    .line 252
    .restart local v2       #n:I
    :cond_1
    add-int/2addr v1, v2

    .line 253
    goto :goto_0
.end method

.method public static isBinary([B)Z
    .locals 1
    .parameter "raw"

    .prologue
    .line 227
    array-length v0, p0

    invoke-static {p0, v0}, Lorg/eclipse/jgit/diff/RawText;->isBinary([BI)Z

    move-result v0

    return v0
.end method

.method public static isBinary([BI)Z
    .locals 2
    .parameter "raw"
    .parameter "length"

    .prologue
    .line 271
    const/16 v1, 0x1f40

    if-le p1, v1, :cond_0

    .line 272
    const/16 p1, 0x1f40

    .line 273
    :cond_0
    const/4 v0, 0x0

    .local v0, ptr:I
    :goto_0
    if-ge v0, p1, :cond_2

    .line 274
    aget-byte v1, p0, v0

    if-nez v1, :cond_1

    .line 275
    const/4 v1, 0x1

    .line 277
    :goto_1
    return v1

    .line 273
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 277
    :cond_2
    const/4 v1, 0x0

    goto :goto_1
.end method


# virtual methods
.method protected decode(II)Ljava/lang/String;
    .locals 1
    .parameter "start"
    .parameter "end"

    .prologue
    .line 207
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    invoke-static {v0, p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLineDelimiter()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 287
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v2

    if-nez v2, :cond_1

    .line 295
    :cond_0
    :goto_0
    return-object v1

    .line 289
    :cond_1
    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/diff/RawText;->getEnd(I)I

    move-result v0

    .line 290
    .local v0, e:I
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v3, v0, -0x1

    aget-byte v2, v2, v3

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 292
    iget-object v1, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    array-length v1, v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_2

    iget-object v1, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v2, v0, -0x2

    aget-byte v1, v1, v2

    const/16 v2, 0xd

    if-ne v1, v2, :cond_2

    .line 293
    const-string v1, "\r\n"

    goto :goto_0

    .line 295
    :cond_2
    const-string v1, "\n"

    goto :goto_0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2
    .parameter "i"

    .prologue
    .line 166
    add-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lorg/eclipse/jgit/diff/RawText;->getString(IIZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString(IIZ)Ljava/lang/String;
    .locals 4
    .parameter "begin"
    .parameter "end"
    .parameter "dropLF"

    .prologue
    .line 183
    if-ne p1, p2, :cond_0

    .line 184
    const-string v2, ""

    .line 190
    :goto_0
    return-object v2

    .line 186
    :cond_0
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/diff/RawText;->getStart(I)I

    move-result v1

    .line 187
    .local v1, s:I
    add-int/lit8 v2, p2, -0x1

    invoke-direct {p0, v2}, Lorg/eclipse/jgit/diff/RawText;->getEnd(I)I

    move-result v0

    .line 188
    .local v0, e:I
    if-eqz p3, :cond_1

    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v3, v0, -0x1

    aget-byte v2, v2, v3

    const/16 v3, 0xa

    if-ne v2, v3, :cond_1

    .line 189
    add-int/lit8 v0, v0, -0x1

    .line 190
    :cond_1
    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/diff/RawText;->decode(II)Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public isMissingNewlineAtEnd()Z
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 151
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    iget-object v3, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v3}, Lorg/eclipse/jgit/util/IntList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/util/IntList;->get(I)I

    move-result v0

    .line 152
    .local v0, end:I
    if-nez v0, :cond_1

    .line 154
    :cond_0
    :goto_0
    return v1

    :cond_1
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v3, v0, -0x1

    aget-byte v2, v2, v3

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/diff/RawText;->lines:Lorg/eclipse/jgit/util/IntList;

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/IntList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    return v0
.end method

.method public writeLine(Ljava/io/OutputStream;I)V
    .locals 4
    .parameter "out"
    .parameter "i"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 138
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/RawText;->getStart(I)I

    move-result v1

    .line 139
    .local v1, start:I
    invoke-direct {p0, p2}, Lorg/eclipse/jgit/diff/RawText;->getEnd(I)I

    move-result v0

    .line 140
    .local v0, end:I
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    add-int/lit8 v3, v0, -0x1

    aget-byte v2, v2, v3

    const/16 v3, 0xa

    if-ne v2, v3, :cond_0

    .line 141
    add-int/lit8 v0, v0, -0x1

    .line 142
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/diff/RawText;->content:[B

    sub-int v3, v0, v1

    invoke-virtual {p1, v2, v1, v3}, Ljava/io/OutputStream;->write([BII)V

    .line 143
    return-void
.end method
