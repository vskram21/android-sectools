.class public Lorg/eclipse/jgit/patch/Patch;
.super Ljava/lang/Object;
.source "Patch.java"


# static fields
.field private static final BIN_HEADERS:[[B

.field private static final BIN_TRAILER:[B

.field private static final DIFF_CC:[B

.field private static final DIFF_COMBINED:[B

.field static final DIFF_GIT:[B

.field private static final GIT_BINARY:[B

.field static final SIG_FOOTER:[B


# instance fields
.field private final errors:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FormatError;",
            ">;"
        }
    .end annotation
.end field

.field private final files:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FileHeader;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 63
    const-string v0, "diff --git "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->DIFF_GIT:[B

    .line 65
    const-string v0, "diff --cc "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->DIFF_CC:[B

    .line 67
    const-string v0, "diff --combined "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->DIFF_COMBINED:[B

    .line 69
    const/4 v0, 0x2

    new-array v0, v0, [[B

    const/4 v1, 0x0

    const-string v2, "Binary files "

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Files "

    invoke-static {v2}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->BIN_HEADERS:[[B

    .line 72
    const-string v0, " differ\n"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->BIN_TRAILER:[B

    .line 74
    const-string v0, "GIT binary patch\n"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->GIT_BINARY:[B

    .line 76
    const-string v0, "-- \n"

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/Patch;->SIG_FOOTER:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->files:Ljava/util/List;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->errors:Ljava/util/List;

    .line 88
    return-void
.end method

.method private static matchAny([BI[[B)Z
    .locals 5
    .parameter "buf"
    .parameter "c"
    .parameter "srcs"

    .prologue
    .line 377
    move-object v0, p2

    .local v0, arr$:[[B
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 378
    .local v3, s:[B
    invoke-static {p0, p1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v4

    if-ltz v4, :cond_0

    .line 379
    const/4 v4, 0x1

    .line 381
    .end local v3           #s:[B
    :goto_1
    return v4

    .line 377
    .restart local v3       #s:[B
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 381
    .end local v3           #s:[B
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private parseDiffCombined([B[BII)I
    .locals 3
    .parameter "hdr"
    .parameter "buf"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 243
    new-instance v0, Lorg/eclipse/jgit/patch/CombinedFileHeader;

    invoke-direct {v0, p2, p3}, Lorg/eclipse/jgit/patch/CombinedFileHeader;-><init>([BI)V

    .line 244
    .local v0, fh:Lorg/eclipse/jgit/patch/CombinedFileHeader;
    array-length v2, p1

    add-int/2addr v2, p3

    invoke-virtual {v0, v2, p4}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseGitFileName(II)I

    move-result v1

    .line 245
    .local v1, ptr:I
    if-gez v1, :cond_0

    .line 246
    invoke-static {p2, p3}, Lorg/eclipse/jgit/patch/Patch;->skipFile([BI)I

    move-result v2

    .line 252
    :goto_0
    return v2

    .line 248
    :cond_0
    invoke-virtual {v0, v1, p4}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->parseGitHeaders(II)I

    move-result v1

    .line 249
    invoke-direct {p0, v0, v1, p4}, Lorg/eclipse/jgit/patch/Patch;->parseHunks(Lorg/eclipse/jgit/patch/FileHeader;II)I

    move-result v1

    .line 250
    iput v1, v0, Lorg/eclipse/jgit/patch/CombinedFileHeader;->endOffset:I

    .line 251
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/Patch;->addFile(Lorg/eclipse/jgit/patch/FileHeader;)V

    move v2, v1

    .line 252
    goto :goto_0
.end method

.method private parseDiffGit([BII)I
    .locals 3
    .parameter "buf"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 229
    new-instance v0, Lorg/eclipse/jgit/patch/FileHeader;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/patch/FileHeader;-><init>([BI)V

    .line 230
    .local v0, fh:Lorg/eclipse/jgit/patch/FileHeader;
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_GIT:[B

    array-length v2, v2

    add-int/2addr v2, p2

    invoke-virtual {v0, v2, p3}, Lorg/eclipse/jgit/patch/FileHeader;->parseGitFileName(II)I

    move-result v1

    .line 231
    .local v1, ptr:I
    if-gez v1, :cond_0

    .line 232
    invoke-static {p1, p2}, Lorg/eclipse/jgit/patch/Patch;->skipFile([BI)I

    move-result v2

    .line 238
    :goto_0
    return v2

    .line 234
    :cond_0
    invoke-virtual {v0, v1, p3}, Lorg/eclipse/jgit/patch/FileHeader;->parseGitHeaders(II)I

    move-result v1

    .line 235
    invoke-direct {p0, v0, v1, p3}, Lorg/eclipse/jgit/patch/Patch;->parseHunks(Lorg/eclipse/jgit/patch/FileHeader;II)I

    move-result v1

    .line 236
    iput v1, v0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    .line 237
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/Patch;->addFile(Lorg/eclipse/jgit/patch/FileHeader;)V

    move v2, v1

    .line 238
    goto :goto_0
.end method

.method private parseFile([BII)I
    .locals 5
    .parameter "buf"
    .parameter "c"
    .parameter "end"

    .prologue
    const/4 v4, 0x1

    .line 173
    :goto_0
    if-ge p2, p3, :cond_7

    .line 174
    invoke-static {p1, p2, p3}, Lorg/eclipse/jgit/patch/FileHeader;->isHunkHdr([BII)I

    move-result v2

    if-lt v2, v4, :cond_0

    .line 179
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->hunkDisconnectedFromFile:Ljava/lang/String;

    invoke-virtual {p0, p1, p2, v2}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    .line 180
    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p2

    .line 181
    goto :goto_0

    .line 186
    :cond_0
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_GIT:[B

    invoke-static {p1, p2, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_2

    .line 187
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/patch/Patch;->parseDiffGit([BII)I

    move-result p3

    .line 225
    .end local p3
    :cond_1
    :goto_1
    return p3

    .line 188
    .restart local p3
    :cond_2
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_CC:[B

    invoke-static {p1, p2, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_3

    .line 189
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_CC:[B

    invoke-direct {p0, v2, p1, p2, p3}, Lorg/eclipse/jgit/patch/Patch;->parseDiffCombined([B[BII)I

    move-result p3

    goto :goto_1

    .line 190
    :cond_3
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_COMBINED:[B

    invoke-static {p1, p2, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_4

    .line 191
    sget-object v2, Lorg/eclipse/jgit/patch/Patch;->DIFF_COMBINED:[B

    invoke-direct {p0, v2, p1, p2, p3}, Lorg/eclipse/jgit/patch/Patch;->parseDiffCombined([B[BII)I

    move-result p3

    goto :goto_1

    .line 196
    :cond_4
    invoke-static {p1, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 197
    .local v1, n:I
    if-ge v1, p3, :cond_1

    .line 204
    sub-int v2, v1, p2

    const/4 v3, 0x6

    if-ge v2, v3, :cond_5

    .line 208
    move p2, v1

    .line 209
    goto :goto_0

    .line 212
    :cond_5
    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    invoke-static {p1, p2, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_6

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    invoke-static {p1, v1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v2

    if-ltz v2, :cond_6

    .line 216
    invoke-static {p1, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 217
    .local v0, f:I
    if-ge v0, p3, :cond_1

    .line 219
    invoke-static {p1, v0, p3}, Lorg/eclipse/jgit/patch/FileHeader;->isHunkHdr([BII)I

    move-result v2

    if-ne v2, v4, :cond_6

    .line 220
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/patch/Patch;->parseTraditionalPatch([BII)I

    move-result p3

    goto :goto_1

    .line 223
    .end local v0           #f:I
    :cond_6
    move p2, v1

    .line 224
    goto :goto_0

    .end local v1           #n:I
    :cond_7
    move p3, p2

    .line 225
    goto :goto_1
.end method

.method private parseGitBinary(Lorg/eclipse/jgit/patch/FileHeader;II)I
    .locals 7
    .parameter "fh"
    .parameter "c"
    .parameter "end"

    .prologue
    .line 344
    new-instance v3, Lorg/eclipse/jgit/patch/BinaryHunk;

    invoke-direct {v3, p1, p2}, Lorg/eclipse/jgit/patch/BinaryHunk;-><init>(Lorg/eclipse/jgit/patch/FileHeader;I)V

    .line 345
    .local v3, postImage:Lorg/eclipse/jgit/patch/BinaryHunk;
    invoke-virtual {v3, p2, p3}, Lorg/eclipse/jgit/patch/BinaryHunk;->parseHunk(II)I

    move-result v1

    .line 346
    .local v1, nEnd:I
    if-gez v1, :cond_0

    .line 349
    iget-object v5, p1, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v6

    iget-object v6, v6, Lorg/eclipse/jgit/internal/JGitText;->missingForwardImageInGITBinaryPatch:Ljava/lang/String;

    invoke-virtual {p0, v5, p2, v6}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    move v0, p2

    .line 364
    .end local p2
    .local v0, c:I
    :goto_0
    return v0

    .line 352
    .end local v0           #c:I
    .restart local p2
    :cond_0
    move p2, v1

    .line 353
    iput p2, v3, Lorg/eclipse/jgit/patch/BinaryHunk;->endOffset:I

    .line 354
    iput-object v3, p1, Lorg/eclipse/jgit/patch/FileHeader;->forwardBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

    .line 356
    new-instance v4, Lorg/eclipse/jgit/patch/BinaryHunk;

    invoke-direct {v4, p1, p2}, Lorg/eclipse/jgit/patch/BinaryHunk;-><init>(Lorg/eclipse/jgit/patch/FileHeader;I)V

    .line 357
    .local v4, preImage:Lorg/eclipse/jgit/patch/BinaryHunk;
    invoke-virtual {v4, p2, p3}, Lorg/eclipse/jgit/patch/BinaryHunk;->parseHunk(II)I

    move-result v2

    .line 358
    .local v2, oEnd:I
    if-ltz v2, :cond_1

    .line 359
    move p2, v2

    .line 360
    iput p2, v4, Lorg/eclipse/jgit/patch/BinaryHunk;->endOffset:I

    .line 361
    iput-object v4, p1, Lorg/eclipse/jgit/patch/FileHeader;->reverseBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

    :cond_1
    move v0, p2

    .line 364
    .end local p2
    .restart local v0       #c:I
    goto :goto_0
.end method

.method private parseHunks(Lorg/eclipse/jgit/patch/FileHeader;II)I
    .locals 5
    .parameter "fh"
    .parameter "c"
    .parameter "end"

    .prologue
    .line 273
    iget-object v0, p1, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 274
    .local v0, buf:[B
    :cond_0
    :goto_0
    :sswitch_0
    if-ge p2, p3, :cond_1

    .line 279
    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->DIFF_GIT:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-ltz v3, :cond_3

    .line 331
    :cond_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getPatchType()Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    if-ne v3, v4, :cond_2

    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->hasMetaDataChanges()Z

    move-result v3

    if-nez v3, :cond_2

    .line 337
    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    iput-object v3, p1, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    :cond_2
    move v1, p2

    .line 340
    :goto_1
    return v1

    .line 281
    :cond_3
    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->DIFF_CC:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-gez v3, :cond_1

    .line 283
    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->DIFF_COMBINED:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-gez v3, :cond_1

    .line 285
    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-gez v3, :cond_1

    .line 287
    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-gez v3, :cond_1

    .line 290
    invoke-static {v0, p2, p3}, Lorg/eclipse/jgit/patch/FileHeader;->isHunkHdr([BII)I

    move-result v3

    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getParentCount()I

    move-result v4

    if-ne v3, v4, :cond_4

    .line 291
    invoke-virtual {p1, p2}, Lorg/eclipse/jgit/patch/FileHeader;->newHunkHeader(I)Lorg/eclipse/jgit/patch/HunkHeader;

    move-result-object v2

    .line 292
    .local v2, h:Lorg/eclipse/jgit/patch/HunkHeader;
    invoke-virtual {v2}, Lorg/eclipse/jgit/patch/HunkHeader;->parseHeader()V

    .line 293
    invoke-virtual {v2, p0, p3}, Lorg/eclipse/jgit/patch/HunkHeader;->parseBody(Lorg/eclipse/jgit/patch/Patch;I)I

    move-result p2

    .line 294
    iput p2, v2, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    .line 295
    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/patch/FileHeader;->addHunk(Lorg/eclipse/jgit/patch/HunkHeader;)V

    .line 296
    if-ge p2, p3, :cond_0

    .line 297
    aget-byte v3, v0, p2

    sparse-switch v3, :sswitch_data_0

    .line 303
    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->SIG_FOOTER:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-gez v3, :cond_0

    .line 304
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->unexpectedHunkTrailer:Ljava/lang/String;

    invoke-virtual {p0, v0, p2, v3}, Lorg/eclipse/jgit/patch/Patch;->warn([BILjava/lang/String;)V

    goto :goto_0

    .line 310
    .end local v2           #h:Lorg/eclipse/jgit/patch/HunkHeader;
    :cond_4
    invoke-static {v0, p2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 311
    .local v1, eol:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_5

    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->GIT_BINARY:[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-ltz v3, :cond_5

    .line 312
    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->GIT_BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    iput-object v3, p1, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 313
    invoke-direct {p0, p1, v1, p3}, Lorg/eclipse/jgit/patch/Patch;->parseGitBinary(Lorg/eclipse/jgit/patch/FileHeader;II)I

    move-result v1

    goto :goto_1

    .line 316
    :cond_5
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_6

    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->BIN_TRAILER:[B

    array-length v3, v3

    sub-int v4, v1, p2

    if-ge v3, v4, :cond_6

    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->BIN_TRAILER:[B

    array-length v3, v3

    sub-int v3, v1, v3

    sget-object v4, Lorg/eclipse/jgit/patch/Patch;->BIN_TRAILER:[B

    invoke-static {v0, v3, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v3

    if-ltz v3, :cond_6

    sget-object v3, Lorg/eclipse/jgit/patch/Patch;->BIN_HEADERS:[[B

    invoke-static {v0, p2, v3}, Lorg/eclipse/jgit/patch/Patch;->matchAny([BI[[B)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 321
    sget-object v3, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->BINARY:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    iput-object v3, p1, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    goto/16 :goto_1

    .line 328
    :cond_6
    move p2, v1

    .line 329
    goto/16 :goto_0

    .line 297
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x40 -> :sswitch_0
        0x64 -> :sswitch_0
    .end sparse-switch
.end method

.method private parseTraditionalPatch([BII)I
    .locals 2
    .parameter "buf"
    .parameter "start"
    .parameter "end"

    .prologue
    .line 257
    new-instance v0, Lorg/eclipse/jgit/patch/FileHeader;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/patch/FileHeader;-><init>([BI)V

    .line 258
    .local v0, fh:Lorg/eclipse/jgit/patch/FileHeader;
    invoke-virtual {v0, p2, p3}, Lorg/eclipse/jgit/patch/FileHeader;->parseTraditionalHeaders(II)I

    move-result v1

    .line 259
    .local v1, ptr:I
    invoke-direct {p0, v0, v1, p3}, Lorg/eclipse/jgit/patch/Patch;->parseHunks(Lorg/eclipse/jgit/patch/FileHeader;II)I

    move-result v1

    .line 260
    iput v1, v0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    .line 261
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/Patch;->addFile(Lorg/eclipse/jgit/patch/FileHeader;)V

    .line 262
    return v1
.end method

.method private static readFully(Ljava/io/InputStream;)[B
    .locals 2
    .parameter "is"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    new-instance v0, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;

    invoke-direct {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>()V

    .line 144
    .local v0, b:Lorg/eclipse/jgit/util/TemporaryBuffer;
    :try_start_0
    invoke-virtual {v0, p0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->copy(Ljava/io/InputStream;)V

    .line 145
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->close()V

    .line 146
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->toByteArray()[B
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 148
    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    throw v1
.end method

.method private static skipFile([BI)I
    .locals 1
    .parameter "buf"
    .parameter "ptr"

    .prologue
    .line 266
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 267
    sget-object v0, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v0

    if-ltz v0, :cond_0

    .line 268
    invoke-static {p0, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result p1

    .line 269
    :cond_0
    return p1
.end method


# virtual methods
.method public addError(Lorg/eclipse/jgit/patch/FormatError;)V
    .locals 1
    .parameter "err"

    .prologue
    .line 115
    iget-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->errors:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 116
    return-void
.end method

.method public addFile(Lorg/eclipse/jgit/patch/FileHeader;)V
    .locals 1
    .parameter "fh"

    .prologue
    .line 100
    iget-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->files:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    return-void
.end method

.method error([BILjava/lang/String;)V
    .locals 2
    .parameter "buf"
    .parameter "ptr"
    .parameter "msg"

    .prologue
    .line 372
    new-instance v0, Lorg/eclipse/jgit/patch/FormatError;

    sget-object v1, Lorg/eclipse/jgit/patch/FormatError$Severity;->ERROR:Lorg/eclipse/jgit/patch/FormatError$Severity;

    invoke-direct {v0, p1, p2, v1, p3}, Lorg/eclipse/jgit/patch/FormatError;-><init>([BILorg/eclipse/jgit/patch/FormatError$Severity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/Patch;->addError(Lorg/eclipse/jgit/patch/FormatError;)V

    .line 373
    return-void
.end method

.method public getErrors()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/FormatError;",
            ">;"
        }
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->errors:Ljava/util/List;

    return-object v0
.end method

.method public getFiles()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/patch/FileHeader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lorg/eclipse/jgit/patch/Patch;->files:Ljava/util/List;

    return-object v0
.end method

.method public parse(Ljava/io/InputStream;)V
    .locals 3
    .parameter "is"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 137
    invoke-static {p1}, Lorg/eclipse/jgit/patch/Patch;->readFully(Ljava/io/InputStream;)[B

    move-result-object v0

    .line 138
    .local v0, buf:[B
    const/4 v1, 0x0

    array-length v2, v0

    invoke-virtual {p0, v0, v1, v2}, Lorg/eclipse/jgit/patch/Patch;->parse([BII)V

    .line 139
    return-void
.end method

.method public parse([BII)V
    .locals 0
    .parameter "buf"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 168
    :goto_0
    if-ge p2, p3, :cond_0

    .line 169
    invoke-direct {p0, p1, p2, p3}, Lorg/eclipse/jgit/patch/Patch;->parseFile([BII)I

    move-result p2

    goto :goto_0

    .line 170
    :cond_0
    return-void
.end method

.method warn([BILjava/lang/String;)V
    .locals 2
    .parameter "buf"
    .parameter "ptr"
    .parameter "msg"

    .prologue
    .line 368
    new-instance v0, Lorg/eclipse/jgit/patch/FormatError;

    sget-object v1, Lorg/eclipse/jgit/patch/FormatError$Severity;->WARNING:Lorg/eclipse/jgit/patch/FormatError$Severity;

    invoke-direct {v0, p1, p2, v1, p3}, Lorg/eclipse/jgit/patch/FormatError;-><init>([BILorg/eclipse/jgit/patch/FormatError$Severity;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/Patch;->addError(Lorg/eclipse/jgit/patch/FormatError;)V

    .line 369
    return-void
.end method
