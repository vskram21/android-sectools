.class public Lorg/eclipse/jgit/patch/CombinedFileHeader;
.super Lorg/eclipse/jgit/patch/FileHeader;
.source "CombinedFileHeader.java"


# static fields
.field private static final MODE:[B


# instance fields
.field private oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

.field private oldModes:[Lorg/eclipse/jgit/lib/FileMode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 66
    const-string v0, "mode "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->MODE:[B

    return-void
.end method

.method constructor <init>([BI)V
    .locals 0
    .parameter "b"
    .parameter "offset"

    .prologue
    .line 73
    invoke-direct {p0, p1, p2}, Lorg/eclipse/jgit/patch/FileHeader;-><init>([BI)V

    .line 74
    return-void
.end method

.method private parseDeletedFileMode(II)V
    .locals 5
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 234
    sget-object v3, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 235
    const/4 v1, 0x0

    .local v1, n:I
    move v2, v1

    .line 236
    .end local v1           #n:I
    .local v2, n:I
    :goto_0
    if-ge p1, p2, :cond_0

    .line 237
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    const/16 v4, 0x2c

    invoke-static {v3, p1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 238
    .local v0, comma:I
    if-gt p2, v0, :cond_1

    .line 243
    .end local v0           #comma:I
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    aput-object v4, v3, v2

    .line 244
    sget-object v3, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 245
    return-void

    .line 240
    .restart local v0       #comma:I
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    add-int/lit8 v1, v2, 0x1

    .end local v2           #n:I
    .restart local v1       #n:I
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    aput-object v4, v3, v2

    .line 241
    move p1, v0

    move v2, v1

    .line 242
    .end local v1           #n:I
    .restart local v2       #n:I
    goto :goto_0
.end method

.method private parseModeLine(II)V
    .locals 6
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 218
    const/4 v2, 0x0

    .local v2, n:I
    move v3, v2

    .line 219
    .end local v2           #n:I
    .local v3, n:I
    :goto_0
    if-ge p1, p2, :cond_0

    .line 220
    iget-object v4, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    const/16 v5, 0x2c

    invoke-static {v4, p1, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 221
    .local v0, comma:I
    if-gt p2, v0, :cond_1

    .line 226
    .end local v0           #comma:I
    :cond_0
    iget-object v4, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    const/16 v5, 0x2e

    invoke-static {v4, p1, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 227
    .local v1, dot2:I
    iget-object v4, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    aput-object v5, v4, v3

    .line 228
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p0, v4, p2}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v4

    iput-object v4, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 229
    return-void

    .line 223
    .end local v1           #dot2:I
    .restart local v0       #comma:I
    :cond_1
    iget-object v4, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    add-int/lit8 v2, v3, 0x1

    .end local v3           #n:I
    .restart local v2       #n:I
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v5

    aput-object v5, v4, v3

    .line 224
    move p1, v0

    move v3, v2

    .line 225
    .end local v2           #n:I
    .restart local v3       #n:I
    goto :goto_0
.end method


# virtual methods
.method public getHunks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/patch/CombinedHunkHeader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 79
    invoke-super {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getOldId()Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1

    .prologue
    .line 108
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getOldId(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getOldId(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;
    .locals 1
    .parameter "nthParent"

    .prologue
    .line 119
    iget-object v0, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getOldMode()Lorg/eclipse/jgit/lib/FileMode;
    .locals 1

    .prologue
    .line 91
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getOldMode(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    return-object v0
.end method

.method public getOldMode(I)Lorg/eclipse/jgit/lib/FileMode;
    .locals 1
    .parameter "nthParent"

    .prologue
    .line 102
    iget-object v0, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getParentCount()I
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    array-length v0, v0

    return v0
.end method

.method public getScriptText(Ljava/nio/charset/Charset;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .parameter "ocs"
    .parameter "ncs"

    .prologue
    .line 124
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getParentCount()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ljava/nio/charset/Charset;

    .line 125
    .local v0, cs:[Ljava/nio/charset/Charset;
    invoke-static {v0, p1}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    .line 126
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getParentCount()I

    move-result v1

    aput-object p2, v0, v1

    .line 127
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getScriptText([Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getScriptText([Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .parameter "charsetGuess"

    .prologue
    .line 143
    invoke-super {p0, p1}, Lorg/eclipse/jgit/patch/FileHeader;->getScriptText([Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method newHunkHeader(I)Lorg/eclipse/jgit/patch/HunkHeader;
    .locals 1
    .parameter "offset"

    .prologue
    .line 212
    new-instance v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;-><init>(Lorg/eclipse/jgit/patch/CombinedFileHeader;I)V

    return-object v0
.end method

.method parseGitHeaders(II)I
    .locals 3
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 148
    :goto_0
    if-ge p1, p2, :cond_0

    .line 149
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    invoke-static {v1, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 150
    .local v0, eol:I
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    invoke-static {v1, p1, p2}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->isHunkHdr([BII)I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    .line 179
    .end local v0           #eol:I
    :cond_0
    return p1

    .line 154
    .restart local v0       #eol:I
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->OLD_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_2

    .line 155
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseOldName(II)V

    .line 177
    :goto_1
    move p1, v0

    .line 178
    goto :goto_0

    .line 157
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->NEW_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_3

    .line 158
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseNewName(II)V

    goto :goto_1

    .line 160
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->INDEX:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_4

    .line 161
    sget-object v1, Lorg/eclipse/jgit/patch/CombinedFileHeader;->INDEX:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseIndexLine(II)V

    goto :goto_1

    .line 163
    :cond_4
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_5

    .line 164
    sget-object v1, Lorg/eclipse/jgit/patch/CombinedFileHeader;->MODE:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseModeLine(II)V

    goto :goto_1

    .line 166
    :cond_5
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->NEW_FILE_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_6

    .line 167
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseNewFileMode(II)V

    goto :goto_1

    .line 169
    :cond_6
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/CombinedFileHeader;->DELETED_FILE_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_0

    .line 170
    sget-object v1, Lorg/eclipse/jgit/patch/CombinedFileHeader;->DELETED_FILE_MODE:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-direct {p0, v1, v0}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseDeletedFileMode(II)V

    goto :goto_1
.end method

.method protected parseIndexLine(II)V
    .locals 7
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 186
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 187
    .local v2, ids:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/lib/AbbreviatedObjectId;>;"
    :goto_0
    if-ge p1, p2, :cond_0

    .line 188
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    const/16 v4, 0x2c

    invoke-static {v3, p1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 189
    .local v0, comma:I
    if-gt p2, v0, :cond_1

    .line 195
    .end local v0           #comma:I
    :cond_0
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    new-array v3, v3, [Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    iput-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 196
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-interface {v2, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 197
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    const/16 v4, 0x2e

    invoke-static {v3, p1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 198
    .local v1, dot2:I
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    add-int/lit8 v6, v1, -0x1

    invoke-static {v5, p1, v6}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v5

    aput-object v5, v3, v4

    .line 199
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    add-int/lit8 v4, v1, 0x1

    add-int/lit8 v5, p2, -0x1

    invoke-static {v3, v4, v5}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v3

    iput-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 200
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldIds:[Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    array-length v3, v3

    new-array v3, v3, [Lorg/eclipse/jgit/lib/FileMode;

    iput-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    .line 201
    return-void

    .line 191
    .end local v1           #dot2:I
    .restart local v0       #comma:I
    :cond_1
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->buf:[B

    add-int/lit8 v4, v0, -0x1

    invoke-static {v3, p1, v4}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 192
    move p1, v0

    .line 193
    goto :goto_0
.end method

.method protected parseNewFileMode(II)V
    .locals 3
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 205
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 206
    iget-object v1, p0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->oldModes:[Lorg/eclipse/jgit/lib/FileMode;

    sget-object v2, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    aput-object v2, v1, v0

    .line 205
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 207
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/eclipse/jgit/patch/FileHeader;->parseNewFileMode(II)V

    .line 208
    return-void
.end method
