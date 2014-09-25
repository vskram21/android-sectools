.class public final Lorg/eclipse/jgit/revwalk/FooterLine;
.super Ljava/lang/Object;
.source "FooterLine.java"


# instance fields
.field private final buffer:[B

.field private final enc:Ljava/nio/charset/Charset;

.field private final keyEnd:I

.field private final keyStart:I

.field private final valEnd:I

.field private final valStart:I


# direct methods
.method constructor <init>([BLjava/nio/charset/Charset;IIII)V
    .locals 0
    .parameter "b"
    .parameter "e"
    .parameter "ks"
    .parameter "ke"
    .parameter "vs"
    .parameter "ve"

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    .line 75
    iput-object p2, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->enc:Ljava/nio/charset/Charset;

    .line 76
    iput p3, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyStart:I

    .line 77
    iput p4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyEnd:I

    .line 78
    iput p5, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valStart:I

    .line 79
    iput p6, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valEnd:I

    .line 80
    return-void
.end method


# virtual methods
.method public getEmailAddress()Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 134
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    iget v5, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valStart:I

    const/16 v6, 0x3c

    invoke-static {v4, v5, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v2

    .line 135
    .local v2, lt:I
    iget v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valEnd:I

    if-gt v4, v2, :cond_1

    .line 136
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    iget v5, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valStart:I

    const/16 v6, 0x40

    invoke-static {v4, v5, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 137
    .local v0, at:I
    iget v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valStart:I

    if-ge v4, v0, :cond_0

    iget v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valEnd:I

    if-ge v0, v4, :cond_0

    .line 138
    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/FooterLine;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 144
    .end local v0           #at:I
    :cond_0
    :goto_0
    return-object v3

    .line 141
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    const/16 v5, 0x3e

    invoke-static {v4, v2, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 142
    .local v1, gt:I
    iget v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valEnd:I

    if-lt v4, v1, :cond_0

    .line 144
    iget-object v3, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->enc:Ljava/nio/charset/Charset;

    iget-object v4, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    add-int/lit8 v5, v1, -0x1

    invoke-static {v3, v4, v2, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public getKey()Ljava/lang/String;
    .locals 4

    .prologue
    .line 109
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->enc:Ljava/nio/charset/Charset;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    iget v2, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyStart:I

    iget v3, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyEnd:I

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 4

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->enc:Ljava/nio/charset/Charset;

    iget-object v1, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    iget v2, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valStart:I

    iget v3, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->valEnd:I

    invoke-static {v0, v1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public matches(Lorg/eclipse/jgit/revwalk/FooterKey;)Z
    .locals 9
    .parameter "key"

    .prologue
    const/4 v7, 0x0

    .line 88
    iget-object v5, p1, Lorg/eclipse/jgit/revwalk/FooterKey;->raw:[B

    .line 89
    .local v5, kRaw:[B
    array-length v6, v5

    .line 90
    .local v6, len:I
    iget v1, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyStart:I

    .line 91
    .local v1, bPtr:I
    iget v8, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->keyEnd:I

    sub-int/2addr v8, v1

    if-eq v8, v6, :cond_1

    .line 100
    :cond_0
    :goto_0
    return v7

    .line 93
    :cond_1
    const/4 v3, 0x0

    .local v3, kPtr:I
    move v4, v3

    .end local v3           #kPtr:I
    .local v4, kPtr:I
    move v2, v1

    .end local v1           #bPtr:I
    .local v2, bPtr:I
    :goto_1
    if-ge v4, v6, :cond_3

    .line 94
    iget-object v8, p0, Lorg/eclipse/jgit/revwalk/FooterLine;->buffer:[B

    add-int/lit8 v1, v2, 0x1

    .end local v2           #bPtr:I
    .restart local v1       #bPtr:I
    aget-byte v0, v8, v2

    .line 95
    .local v0, b:B
    const/16 v8, 0x41

    if-gt v8, v0, :cond_2

    const/16 v8, 0x5a

    if-gt v0, v8, :cond_2

    .line 96
    add-int/lit8 v8, v0, 0x20

    int-to-byte v0, v8

    .line 97
    :cond_2
    add-int/lit8 v3, v4, 0x1

    .end local v4           #kPtr:I
    .restart local v3       #kPtr:I
    aget-byte v8, v5, v4

    if-ne v0, v8, :cond_0

    move v4, v3

    .end local v3           #kPtr:I
    .restart local v4       #kPtr:I
    move v2, v1

    .line 99
    .end local v1           #bPtr:I
    .restart local v2       #bPtr:I
    goto :goto_1

    .line 100
    .end local v0           #b:B
    :cond_3
    const/4 v7, 0x1

    move v1, v2

    .end local v2           #bPtr:I
    .restart local v1       #bPtr:I
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/FooterLine;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/revwalk/FooterLine;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
