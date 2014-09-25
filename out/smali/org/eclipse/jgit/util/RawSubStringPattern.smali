.class public Lorg/eclipse/jgit/util/RawSubStringPattern;
.super Ljava/lang/Object;
.source "RawSubStringPattern.java"


# instance fields
.field private final needle:[B

.field private final needleString:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .parameter "patternText"

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_0

    .line 71
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->cannotMatchOnEmptyString:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 72
    :cond_0
    iput-object p1, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needleString:Ljava/lang/String;

    .line 74
    invoke-static {p1}, Lorg/eclipse/jgit/lib/Constants;->encode(Ljava/lang/String;)[B

    move-result-object v0

    .line 75
    .local v0, b:[B
    array-length v2, v0

    new-array v2, v2, [B

    iput-object v2, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needle:[B

    .line 76
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 77
    iget-object v2, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needle:[B

    aget-byte v3, v0, v1

    invoke-static {v3}, Lorg/eclipse/jgit/util/RawSubStringPattern;->lc(B)B

    move-result v3

    aput-byte v3, v2, v1

    .line 76
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 78
    :cond_1
    return-void
.end method

.method private static final lc(B)B
    .locals 1
    .parameter "q"

    .prologue
    .line 122
    and-int/lit16 v0, p0, 0xff

    int-to-char v0, v0

    invoke-static {v0}, Lorg/eclipse/jgit/util/StringUtils;->toLowerCase(C)C

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method private static final neq(BB)Z
    .locals 1
    .parameter "a"
    .parameter "b"

    .prologue
    .line 118
    if-eq p0, p1, :cond_0

    invoke-static {p1}, Lorg/eclipse/jgit/util/RawSubStringPattern;->lc(B)B

    move-result v0

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public match(Lorg/eclipse/jgit/util/RawCharSequence;)I
    .locals 10
    .parameter "rcs"

    .prologue
    const/4 v7, -0x1

    .line 91
    iget-object v8, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needle:[B

    array-length v4, v8

    .line 92
    .local v4, needleLen:I
    iget-object v8, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needle:[B

    const/4 v9, 0x0

    aget-byte v0, v8, v9

    .line 94
    .local v0, first:B
    iget-object v6, p1, Lorg/eclipse/jgit/util/RawCharSequence;->buffer:[B

    .line 95
    .local v6, text:[B
    iget v2, p1, Lorg/eclipse/jgit/util/RawCharSequence;->startPtr:I

    .line 96
    .local v2, matchPos:I
    iget v8, p1, Lorg/eclipse/jgit/util/RawCharSequence;->endPtr:I

    sub-int v3, v8, v4

    .line 98
    .local v3, maxPos:I
    :goto_0
    if-gt v2, v3, :cond_2

    .line 99
    aget-byte v8, v6, v2

    invoke-static {v0, v8}, Lorg/eclipse/jgit/util/RawSubStringPattern;->neq(BB)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 100
    :cond_0
    add-int/lit8 v2, v2, 0x1

    if-gt v2, v3, :cond_1

    aget-byte v8, v6, v2

    invoke-static {v0, v8}, Lorg/eclipse/jgit/util/RawSubStringPattern;->neq(BB)Z

    move-result v8

    if-nez v8, :cond_0

    .line 103
    :cond_1
    if-le v2, v3, :cond_3

    .line 114
    :cond_2
    :goto_1
    return v7

    .line 107
    :cond_3
    add-int/lit8 v5, v2, 0x1

    .line 108
    .local v5, si:I
    const/4 v1, 0x1

    .local v1, j:I
    :goto_2
    if-ge v1, v4, :cond_5

    .line 109
    iget-object v8, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needle:[B

    aget-byte v8, v8, v1

    aget-byte v9, v6, v5

    invoke-static {v8, v9}, Lorg/eclipse/jgit/util/RawSubStringPattern;->neq(BB)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 98
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 108
    :cond_4
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    :cond_5
    move v7, v2

    .line 112
    goto :goto_1
.end method

.method public pattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/eclipse/jgit/util/RawSubStringPattern;->needleString:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/RawSubStringPattern;->pattern()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
