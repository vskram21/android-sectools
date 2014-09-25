.class public Lorg/eclipse/jgit/revwalk/RevTag;
.super Lorg/eclipse/jgit/revwalk/RevObject;
.source "RevTag.java"


# instance fields
.field private buffer:[B

.field private object:Lorg/eclipse/jgit/revwalk/RevObject;

.field private tagName:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V
    .locals 0
    .parameter "id"

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/RevObject;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 130
    return-void
.end method

.method public static parse(Lorg/eclipse/jgit/revwalk/RevWalk;[B)Lorg/eclipse/jgit/revwalk/RevTag;
    .locals 4
    .parameter "rw"
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 107
    new-instance v0, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;

    invoke-direct {v0}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;-><init>()V

    .line 108
    .local v0, fmt:Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isRetainBody()Z

    move-result v2

    .line 109
    .local v2, retain:Z
    const/4 v3, 0x1

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 110
    const/4 v3, 0x4

    invoke-virtual {v0, v3, p1}, Lorg/eclipse/jgit/lib/ObjectInserter$Formatter;->idFor(I[B)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {p0, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupTag(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevTag;

    move-result-object v1

    .line 111
    .local v1, r:Lorg/eclipse/jgit/revwalk/RevTag;
    invoke-virtual {v1, p0, p1}, Lorg/eclipse/jgit/revwalk/RevTag;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 112
    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRetainBody(Z)V

    .line 113
    return-object v1
.end method

.method public static parse([B)Lorg/eclipse/jgit/revwalk/RevTag;
    .locals 2
    .parameter "raw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 85
    new-instance v1, Lorg/eclipse/jgit/revwalk/RevWalk;

    const/4 v0, 0x0

    check-cast v0, Lorg/eclipse/jgit/lib/ObjectReader;

    invoke-direct {v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    invoke-static {v1, p0}, Lorg/eclipse/jgit/revwalk/RevTag;->parse(Lorg/eclipse/jgit/revwalk/RevWalk;[B)Lorg/eclipse/jgit/revwalk/RevTag;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method final disposeBody()V
    .locals 1

    .prologue
    .line 269
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 270
    return-void
.end method

.method public final getFullMessage()Ljava/lang/String;
    .locals 4

    .prologue
    .line 205
    iget-object v2, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 206
    .local v2, raw:[B
    const/4 v3, 0x0

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->tagMessage([BI)I

    move-result v1

    .line 207
    .local v1, msgB:I
    if-gez v1, :cond_0

    .line 208
    const-string v3, ""

    .line 210
    :goto_0
    return-object v3

    .line 209
    :cond_0
    invoke-static {v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 210
    .local v0, enc:Ljava/nio/charset/Charset;
    array-length v3, v2

    invoke-static {v0, v2, v1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public final getObject()Lorg/eclipse/jgit/revwalk/RevObject;
    .locals 1

    .prologue
    .line 256
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->object:Lorg/eclipse/jgit/revwalk/RevObject;

    return-object v0
.end method

.method public final getShortMessage()Ljava/lang/String;
    .locals 6

    .prologue
    .line 229
    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 230
    .local v3, raw:[B
    const/4 v5, 0x0

    invoke-static {v3, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->tagMessage([BI)I

    move-result v1

    .line 231
    .local v1, msgB:I
    if-gez v1, :cond_1

    .line 232
    const-string v4, ""

    .line 239
    :cond_0
    :goto_0
    return-object v4

    .line 234
    :cond_1
    invoke-static {v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseEncoding([B)Ljava/nio/charset/Charset;

    move-result-object v0

    .line 235
    .local v0, enc:Ljava/nio/charset/Charset;
    invoke-static {v3, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->endOfParagraph([BI)I

    move-result v2

    .line 236
    .local v2, msgE:I
    invoke-static {v0, v3, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v4

    .line 237
    .local v4, str:Ljava/lang/String;
    invoke-static {v3, v1, v2}, Lorg/eclipse/jgit/revwalk/RevCommit;->hasLF([BII)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 238
    invoke-static {v4}, Lorg/eclipse/jgit/util/StringUtils;->replaceLineBreaksWithSpace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public final getTagName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->tagName:Ljava/lang/String;

    return-object v0
.end method

.method public final getTaggerIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 3

    .prologue
    .line 187
    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 188
    .local v1, raw:[B
    const/4 v2, 0x0

    invoke-static {v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->tagger([BI)I

    move-result v0

    .line 189
    .local v0, nameB:I
    if-gez v0, :cond_0

    .line 190
    const/4 v2, 0x0

    .line 191
    :goto_0
    return-object v2

    :cond_0
    invoke-static {v1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->parsePersonIdent([BI)Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    goto :goto_0
.end method

.method public final getType()I
    .locals 1

    .prologue
    .line 169
    const/4 v0, 0x4

    return v0
.end method

.method parseBody(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 141
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    if-nez v0, :cond_0

    .line 142
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;)[B

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 143
    iget v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->flags:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevTag;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 146
    :cond_0
    return-void
.end method

.method parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V
    .locals 6
    .parameter "walk"
    .parameter "rawTag"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/CorruptObjectException;
        }
    .end annotation

    .prologue
    .line 150
    new-instance v3, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v3}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 153
    .local v3, pos:Lorg/eclipse/jgit/util/MutableInteger;
    const/16 v4, 0x35

    iput v4, v3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 154
    const/16 v4, 0xa

    invoke-static {p0, p2, v4, v3}, Lorg/eclipse/jgit/lib/Constants;->decodeTypeString(Lorg/eclipse/jgit/lib/AnyObjectId;[BBLorg/eclipse/jgit/util/MutableInteger;)I

    move-result v1

    .line 155
    .local v1, oType:I
    iget-object v4, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    const/4 v5, 0x7

    invoke-virtual {v4, p2, v5}, Lorg/eclipse/jgit/lib/MutableObjectId;->fromString([BI)V

    .line 156
    iget-object v4, p1, Lorg/eclipse/jgit/revwalk/RevWalk;->idBuffer:Lorg/eclipse/jgit/lib/MutableObjectId;

    invoke-virtual {p1, v4, v1}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupAny(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/revwalk/RevTag;->object:Lorg/eclipse/jgit/revwalk/RevObject;

    .line 158
    iget v4, v3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v2, v4, 0x4

    iput v2, v3, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 159
    .local v2, p:I
    invoke-static {p2, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v4

    add-int/lit8 v0, v4, -0x1

    .line 160
    .local v0, nameEnd:I
    sget-object v4, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    invoke-static {v4, p2, v2, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/revwalk/RevTag;->tagName:Ljava/lang/String;

    .line 162
    invoke-virtual {p1}, Lorg/eclipse/jgit/revwalk/RevWalk;->isRetainBody()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 163
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/RevTag;->buffer:[B

    .line 164
    :cond_0
    iget v4, p0, Lorg/eclipse/jgit/revwalk/RevTag;->flags:I

    or-int/lit8 v4, v4, 0x1

    iput v4, p0, Lorg/eclipse/jgit/revwalk/RevTag;->flags:I

    .line 165
    return-void
.end method

.method parseHeaders(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p1, p0}, Lorg/eclipse/jgit/revwalk/RevWalk;->getCachedBytes(Lorg/eclipse/jgit/revwalk/RevObject;)[B

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/revwalk/RevTag;->parseCanonical(Lorg/eclipse/jgit/revwalk/RevWalk;[B)V

    .line 136
    return-void
.end method
