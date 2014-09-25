.class public Lorg/eclipse/jgit/patch/BinaryHunk;
.super Ljava/lang/Object;
.source "BinaryHunk.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/patch/BinaryHunk$Type;
    }
.end annotation


# static fields
.field private static final DELTA:[B

.field private static final LITERAL:[B


# instance fields
.field endOffset:I

.field private final file:Lorg/eclipse/jgit/patch/FileHeader;

.field private length:I

.field final startOffset:I

.field private type:Lorg/eclipse/jgit/patch/BinaryHunk$Type;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 54
    const-string v0, "literal "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/BinaryHunk;->LITERAL:[B

    .line 56
    const-string v0, "delta "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/BinaryHunk;->DELTA:[B

    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/patch/FileHeader;I)V
    .locals 0
    .parameter "fh"
    .parameter "offset"

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    iput-object p1, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->file:Lorg/eclipse/jgit/patch/FileHeader;

    .line 83
    iput p2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->startOffset:I

    .line 84
    return-void
.end method


# virtual methods
.method public getBuffer()[B
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .prologue
    .line 103
    iget v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->endOffset:I

    return v0
.end method

.method public getFileHeader()Lorg/eclipse/jgit/patch/FileHeader;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->file:Lorg/eclipse/jgit/patch/FileHeader;

    return-object v0
.end method

.method public getSize()I
    .locals 1

    .prologue
    .line 113
    iget v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->length:I

    return v0
.end method

.method public getStartOffset()I
    .locals 1

    .prologue
    .line 98
    iget v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->startOffset:I

    return v0
.end method

.method public getType()Lorg/eclipse/jgit/patch/BinaryHunk$Type;
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->type:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    return-object v0
.end method

.method parseHunk(II)I
    .locals 4
    .parameter "ptr"
    .parameter "end"

    .prologue
    const/4 v3, 0x0

    .line 117
    iget-object v2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v2, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 119
    .local v0, buf:[B
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk;->LITERAL:[B

    invoke-static {v0, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_2

    .line 120
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->LITERAL_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    iput-object v2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->type:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    .line 121
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk;->LITERAL:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-static {v0, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->length:I

    .line 134
    :goto_0
    invoke-static {v0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 140
    :cond_0
    if-ge p1, p2, :cond_1

    .line 141
    aget-byte v2, v0, p1

    const/16 v3, 0xa

    if-ne v2, v3, :cond_4

    const/4 v1, 0x1

    .line 142
    .local v1, empty:Z
    :goto_1
    invoke-static {v0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 143
    if-eqz v1, :cond_0

    .end local v1           #empty:Z
    :cond_1
    move v2, p1

    .line 147
    :goto_2
    return v2

    .line 123
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk;->DELTA:[B

    invoke-static {v0, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_3

    .line 124
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk$Type;->DELTA_DEFLATED:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    iput-object v2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->type:Lorg/eclipse/jgit/patch/BinaryHunk$Type;

    .line 125
    sget-object v2, Lorg/eclipse/jgit/patch/BinaryHunk;->DELTA:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-static {v0, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/patch/BinaryHunk;->length:I

    goto :goto_0

    .line 132
    :cond_3
    const/4 v2, -0x1

    goto :goto_2

    .line 141
    :cond_4
    const/4 v1, 0x0

    goto :goto_1
.end method
