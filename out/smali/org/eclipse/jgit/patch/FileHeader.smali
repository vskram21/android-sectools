.class public Lorg/eclipse/jgit/patch/FileHeader;
.super Lorg/eclipse/jgit/diff/DiffEntry;
.source "FileHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    }
.end annotation


# static fields
.field private static final COPY_FROM:[B

.field private static final COPY_TO:[B

.field static final DELETED_FILE_MODE:[B

.field private static final DISSIMILARITY_INDEX:[B

.field static final INDEX:[B

.field static final NEW_FILE_MODE:[B

.field private static final NEW_MODE:[B

.field static final NEW_NAME:[B

.field private static final OLD_MODE:[B

.field static final OLD_NAME:[B

.field private static final RENAME_FROM:[B

.field private static final RENAME_NEW:[B

.field private static final RENAME_OLD:[B

.field private static final RENAME_TO:[B

.field private static final SIMILARITY_INDEX:[B


# instance fields
.field final buf:[B

.field endOffset:I

.field forwardBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

.field private hunks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/patch/HunkHeader;",
            ">;"
        }
    .end annotation
.end field

.field patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

.field reverseBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

.field final startOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 74
    const-string v0, "old mode "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->OLD_MODE:[B

    .line 76
    const-string v0, "new mode "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->NEW_MODE:[B

    .line 78
    const-string v0, "deleted file mode "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->DELETED_FILE_MODE:[B

    .line 80
    const-string v0, "new file mode "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->NEW_FILE_MODE:[B

    .line 82
    const-string v0, "copy from "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->COPY_FROM:[B

    .line 84
    const-string v0, "copy to "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->COPY_TO:[B

    .line 86
    const-string v0, "rename old "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_OLD:[B

    .line 88
    const-string v0, "rename new "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_NEW:[B

    .line 90
    const-string v0, "rename from "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_FROM:[B

    .line 92
    const-string v0, "rename to "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_TO:[B

    .line 94
    const-string v0, "similarity index "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->SIMILARITY_INDEX:[B

    .line 96
    const-string v0, "dissimilarity index "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->DISSIMILARITY_INDEX:[B

    .line 98
    const-string v0, "index "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->INDEX:[B

    .line 100
    const-string v0, "--- "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    .line 102
    const-string v0, "+++ "

    invoke-static {v0}, Lorg/eclipse/jgit/lib/Constants;->encodeASCII(Ljava/lang/String;)[B

    move-result-object v0

    sput-object v0, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    return-void
.end method

.method constructor <init>([BI)V
    .locals 1
    .parameter "b"
    .parameter "offset"

    .prologue
    .line 156
    invoke-direct {p0}, Lorg/eclipse/jgit/diff/DiffEntry;-><init>()V

    .line 157
    iput-object p1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 158
    iput p2, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    .line 159
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 160
    sget-object v0, Lorg/eclipse/jgit/patch/FileHeader$PatchType;->UNIFIED:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 161
    return-void
.end method

.method public constructor <init>([BLorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/patch/FileHeader$PatchType;)V
    .locals 3
    .parameter "headerLines"
    .parameter "edits"
    .parameter "type"

    .prologue
    .line 148
    const/4 v1, 0x0

    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/patch/FileHeader;-><init>([BI)V

    .line 149
    array-length v1, p1

    iput v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    .line 150
    sget-object v1, Lorg/eclipse/jgit/patch/Patch;->DIFF_GIT:[B

    array-length v1, v1

    array-length v2, p1

    invoke-virtual {p0, v1, v2}, Lorg/eclipse/jgit/patch/FileHeader;->parseGitFileName(II)I

    move-result v0

    .line 151
    .local v0, ptr:I
    array-length v1, p1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/patch/FileHeader;->parseGitHeaders(II)I

    .line 152
    iput-object p3, p0, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    .line 153
    new-instance v1, Lorg/eclipse/jgit/patch/HunkHeader;

    invoke-direct {v1, p0, p2}, Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;Lorg/eclipse/jgit/diff/EditList;)V

    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/patch/FileHeader;->addHunk(Lorg/eclipse/jgit/patch/HunkHeader;)V

    .line 154
    return-void
.end method

.method private eq(IIII)Z
    .locals 5
    .parameter "aPtr"
    .parameter "aEnd"
    .parameter "bPtr"
    .parameter "bEnd"

    .prologue
    const/4 v2, 0x0

    .line 573
    sub-int v3, p2, p1

    sub-int v4, p4, p3

    if-eq v3, v4, :cond_0

    .line 580
    :goto_0
    return v2

    :cond_0
    move v1, p3

    .end local p3
    .local v1, bPtr:I
    move v0, p1

    .line 576
    .end local p1
    .local v0, aPtr:I
    if-ge v0, p2, :cond_1

    .line 577
    iget-object v3, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 p1, v0, 0x1

    .end local v0           #aPtr:I
    .restart local p1
    aget-byte v3, v3, v0

    iget-object v4, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 p3, v1, 0x1

    .end local v1           #bPtr:I
    .restart local p3
    aget-byte v4, v4, v1

    if-eq v3, v4, :cond_0

    goto :goto_0

    .line 580
    .end local p1
    .end local p3
    .restart local v0       #aPtr:I
    .restart local v1       #bPtr:I
    :cond_1
    const/4 v2, 0x1

    move p3, v1

    .end local v1           #bPtr:I
    .restart local p3
    move p1, v0

    .end local v0           #aPtr:I
    .restart local p1
    goto :goto_0
.end method

.method private extractFileLines([Ljava/nio/charset/Charset;)[Ljava/lang/String;
    .locals 12
    .parameter "csGuess"

    .prologue
    .line 267
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getParentCount()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    new-array v9, v10, [Lorg/eclipse/jgit/util/TemporaryBuffer;

    .line 269
    .local v9, tmp:[Lorg/eclipse/jgit/util/TemporaryBuffer;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_0
    :try_start_0
    array-length v10, v9

    if-ge v4, v10, :cond_0

    .line 270
    new-instance v10, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;

    invoke-direct {v10}, Lorg/eclipse/jgit/util/TemporaryBuffer$LocalFile;-><init>()V

    aput-object v10, v9, v4

    .line 269
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 271
    :cond_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/patch/HunkHeader;

    .line 272
    .local v3, h:Lorg/eclipse/jgit/patch/HunkHeader;
    invoke-virtual {v3, v9}, Lorg/eclipse/jgit/patch/HunkHeader;->extractFileLines([Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 282
    .end local v3           #h:Lorg/eclipse/jgit/patch/HunkHeader;
    .end local v5           #i$:Ljava/util/Iterator;
    :catch_0
    move-exception v6

    .line 283
    .local v6, ioe:Ljava/io/IOException;
    :try_start_1
    new-instance v10, Ljava/lang/RuntimeException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->cannotConvertScriptToText:Ljava/lang/String;

    invoke-direct {v10, v11, v6}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 285
    .end local v6           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v10

    move-object v0, v9

    .local v0, arr$:[Lorg/eclipse/jgit/util/TemporaryBuffer;
    array-length v7, v0

    .local v7, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_2
    if-ge v5, v7, :cond_7

    aget-object v1, v0, v5

    .line 286
    .local v1, b:Lorg/eclipse/jgit/util/TemporaryBuffer;
    if-eqz v1, :cond_1

    .line 287
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    .line 285
    :cond_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 274
    .end local v0           #arr$:[Lorg/eclipse/jgit/util/TemporaryBuffer;
    .end local v1           #b:Lorg/eclipse/jgit/util/TemporaryBuffer;
    .end local v7           #len$:I
    .local v5, i$:Ljava/util/Iterator;
    :cond_2
    :try_start_2
    array-length v10, v9

    new-array v8, v10, [Ljava/lang/String;

    .line 275
    .local v8, r:[Ljava/lang/String;
    const/4 v4, 0x0

    :goto_3
    array-length v10, v9

    if-ge v4, v10, :cond_5

    .line 276
    if-eqz p1, :cond_4

    aget-object v2, p1, v4

    .line 277
    .local v2, cs:Ljava/nio/charset/Charset;
    :goto_4
    if-nez v2, :cond_3

    .line 278
    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    .line 279
    :cond_3
    aget-object v10, v9, v4

    invoke-virtual {v10}, Lorg/eclipse/jgit/util/TemporaryBuffer;->toByteArray()[B

    move-result-object v10

    invoke-static {v2, v10}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[B)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 275
    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    .line 276
    .end local v2           #cs:Ljava/nio/charset/Charset;
    :cond_4
    const/4 v2, 0x0

    goto :goto_4

    .line 285
    :cond_5
    move-object v0, v9

    .restart local v0       #arr$:[Lorg/eclipse/jgit/util/TemporaryBuffer;
    array-length v7, v0

    .restart local v7       #len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_5
    if-ge v5, v7, :cond_8

    aget-object v1, v0, v5

    .line 286
    .restart local v1       #b:Lorg/eclipse/jgit/util/TemporaryBuffer;
    if-eqz v1, :cond_6

    .line 287
    invoke-virtual {v1}, Lorg/eclipse/jgit/util/TemporaryBuffer;->destroy()V

    .line 285
    :cond_6
    add-int/lit8 v5, v5, 0x1

    goto :goto_5

    .end local v1           #b:Lorg/eclipse/jgit/util/TemporaryBuffer;
    .end local v8           #r:[Ljava/lang/String;
    :cond_7
    throw v10

    .restart local v8       #r:[Ljava/lang/String;
    :cond_8
    return-object v8
.end method

.method static isHunkHdr([BII)I
    .locals 5
    .parameter "buf"
    .parameter "start"
    .parameter "end"

    .prologue
    const/4 v2, 0x0

    .line 601
    move v0, p1

    .local v0, ptr:I
    move v1, v0

    .line 602
    .end local v0           #ptr:I
    .local v1, ptr:I
    :goto_0
    if-ge v1, p2, :cond_0

    aget-byte v3, p0, v1

    const/16 v4, 0x40

    if-ne v3, v4, :cond_0

    .line 603
    add-int/lit8 v0, v1, 0x1

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    move v1, v0

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    goto :goto_0

    .line 604
    :cond_0
    sub-int v3, v1, p1

    const/4 v4, 0x2

    if-ge v3, v4, :cond_2

    move v0, v1

    .line 610
    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    :cond_1
    :goto_1
    return v2

    .line 606
    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_2
    if-eq v1, p2, :cond_3

    add-int/lit8 v0, v1, 0x1

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    aget-byte v3, p0, v1

    const/16 v4, 0x20

    if-ne v3, v4, :cond_1

    .line 608
    if-eq v0, p2, :cond_1

    add-int/lit8 v1, v0, 0x1

    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    aget-byte v3, p0, v0

    const/16 v4, 0x2d

    if-eq v3, v4, :cond_4

    :cond_3
    move v0, v1

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    goto :goto_1

    .line 610
    .end local v0           #ptr:I
    .restart local v1       #ptr:I
    :cond_4
    add-int/lit8 v2, v1, -0x3

    sub-int/2addr v2, p1

    move v0, v1

    .end local v1           #ptr:I
    .restart local v0       #ptr:I
    goto :goto_1
.end method

.method private static p1(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "r"

    .prologue
    .line 545
    const/16 v1, 0x2f

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 546
    .local v0, s:I
    if-lez v0, :cond_0

    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .end local p0
    :cond_0
    return-object p0
.end method

.method private parseName(Ljava/lang/String;II)Ljava/lang/String;
    .locals 5
    .parameter "expect"
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 520
    if-ne p2, p3, :cond_0

    .line 541
    .end local p1
    :goto_0
    return-object p1

    .line 524
    .restart local p1
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    aget-byte v2, v2, p2

    const/16 v3, 0x22

    if-ne v2, v3, :cond_2

    .line 527
    sget-object v2, Lorg/eclipse/jgit/util/QuotedString;->GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    iget-object v3, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v4, p3, -0x1

    invoke-virtual {v2, v3, p2, v4}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->dequote([BII)Ljava/lang/String;

    move-result-object v0

    .line 539
    .local v0, r:Ljava/lang/String;
    :goto_1
    const-string v2, "/dev/null"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 540
    const-string v0, "/dev/null"

    :cond_1
    move-object p1, v0

    .line 541
    goto :goto_0

    .line 531
    .end local v0           #r:Ljava/lang/String;
    :cond_2
    move v1, p3

    .line 532
    .local v1, tab:I
    :goto_2
    if-ge p2, v1, :cond_3

    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v3, v1, -0x1

    aget-byte v2, v2, v3

    const/16 v3, 0x9

    if-eq v2, v3, :cond_3

    .line 533
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    .line 534
    :cond_3
    if-ne p2, v1, :cond_4

    .line 535
    move v1, p3

    .line 536
    :cond_4
    sget-object v2, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iget-object v3, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v4, v1, -0x1

    invoke-static {v2, v3, p2, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v0

    .restart local v0       #r:Ljava/lang/String;
    goto :goto_1
.end method

.method private static trySimpleConversion([Ljava/nio/charset/Charset;)Z
    .locals 5
    .parameter "charsetGuess"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 257
    if-nez p0, :cond_1

    .line 263
    :cond_0
    :goto_0
    return v1

    .line 259
    :cond_1
    const/4 v0, 0x1

    .local v0, i:I
    :goto_1
    array-length v3, p0

    if-ge v0, v3, :cond_0

    .line 260
    aget-object v3, p0, v0

    aget-object v4, p0, v2

    if-eq v3, v4, :cond_2

    move v1, v2

    .line 261
    goto :goto_0

    .line 259
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method addHunk(Lorg/eclipse/jgit/patch/HunkHeader;)V
    .locals 2
    .parameter "h"

    .prologue
    .line 310
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/HunkHeader;->getFileHeader()Lorg/eclipse/jgit/patch/FileHeader;

    move-result-object v0

    if-eq v0, p0, :cond_0

    .line 311
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->hunkBelongsToAnotherFile:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 312
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    if-nez v0, :cond_1

    .line 313
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    .line 314
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 315
    return-void
.end method

.method public getBuffer()[B
    .locals 1

    .prologue
    .line 169
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    return v0
.end method

.method public getForwardBinaryHunk()Lorg/eclipse/jgit/patch/BinaryHunk;
    .locals 1

    .prologue
    .line 323
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->forwardBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

    return-object v0
.end method

.method public getHunks()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lorg/eclipse/jgit/patch/HunkHeader;",
            ">;"
        }
    .end annotation

    .prologue
    .line 304
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    if-nez v0, :cond_0

    .line 305
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    .line 306
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    goto :goto_0
.end method

.method getParentCount()I
    .locals 1

    .prologue
    .line 164
    const/4 v0, 0x1

    return v0
.end method

.method public getPatchType()Lorg/eclipse/jgit/patch/FileHeader$PatchType;
    .locals 1

    .prologue
    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->patchType:Lorg/eclipse/jgit/patch/FileHeader$PatchType;

    return-object v0
.end method

.method public getReverseBinaryHunk()Lorg/eclipse/jgit/patch/BinaryHunk;
    .locals 1

    .prologue
    .line 328
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->reverseBinaryHunk:Lorg/eclipse/jgit/patch/BinaryHunk;

    return-object v0
.end method

.method public getScriptText()Ljava/lang/String;
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 191
    invoke-virtual {p0, v0, v0}, Lorg/eclipse/jgit/patch/FileHeader;->getScriptText(Ljava/nio/charset/Charset;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScriptText(Ljava/nio/charset/Charset;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 2
    .parameter "oldCharset"
    .parameter "newCharset"

    .prologue
    .line 204
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/nio/charset/Charset;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/FileHeader;->getScriptText([Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getScriptText([Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 14
    .parameter "charsetGuess"

    .prologue
    const/4 v13, 0x0

    .line 208
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 217
    iget-object v9, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    iget v10, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    iget v11, p0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    invoke-static {v9, v10, v11}, Lorg/eclipse/jgit/util/RawParseUtils;->extractBinaryString([BII)Ljava/lang/String;

    move-result-object v9

    .line 253
    :goto_0
    return-object v9

    .line 220
    :cond_0
    if-eqz p1, :cond_1

    array-length v9, p1

    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getParentCount()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    if-eq v9, v10, :cond_1

    .line 221
    new-instance v9, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v10

    iget-object v10, v10, Lorg/eclipse/jgit/internal/JGitText;->expectedCharacterEncodingGuesses:Ljava/lang/String;

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getParentCount()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v13

    invoke-static {v10, v11}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 225
    :cond_1
    invoke-static {p1}, Lorg/eclipse/jgit/patch/FileHeader;->trySimpleConversion([Ljava/nio/charset/Charset;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 226
    if-eqz p1, :cond_3

    aget-object v0, p1, v13

    .line 227
    .local v0, cs:Ljava/nio/charset/Charset;
    :goto_1
    if-nez v0, :cond_2

    .line 228
    sget-object v0, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    .line 230
    :cond_2
    :try_start_0
    iget-object v9, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    iget v10, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    iget v11, p0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    invoke-static {v0, v9, v10, v11}, Lorg/eclipse/jgit/util/RawParseUtils;->decodeNoFallback(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;
    :try_end_0
    .catch Ljava/nio/charset/CharacterCodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v9

    goto :goto_0

    .line 226
    .end local v0           #cs:Ljava/nio/charset/Charset;
    :cond_3
    const/4 v0, 0x0

    goto :goto_1

    .line 231
    .restart local v0       #cs:Ljava/nio/charset/Charset;
    :catch_0
    move-exception v9

    .line 237
    .end local v0           #cs:Ljava/nio/charset/Charset;
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    iget v9, p0, Lorg/eclipse/jgit/patch/FileHeader;->endOffset:I

    iget v10, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    sub-int/2addr v9, v10

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 242
    .local v8, r:Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/eclipse/jgit/patch/HunkHeader;

    invoke-virtual {v9}, Lorg/eclipse/jgit/patch/HunkHeader;->getStartOffset()I

    move-result v4

    .line 243
    .local v4, hdrEnd:I
    iget v7, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    .local v7, ptr:I
    :goto_2
    if-ge v7, v4, :cond_5

    .line 244
    iget-object v9, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v9, v7}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v9

    invoke-static {v4, v9}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 245
    .local v1, eol:I
    iget-object v9, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v9, v7, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->extractBinaryString([BII)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    move v7, v1

    .line 247
    goto :goto_2

    .line 249
    .end local v1           #eol:I
    :cond_5
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/patch/FileHeader;->extractFileLines([Ljava/nio/charset/Charset;)[Ljava/lang/String;

    move-result-object v2

    .line 250
    .local v2, files:[Ljava/lang/String;
    array-length v9, v2

    new-array v6, v9, [I

    .line 251
    .local v6, offsets:[I
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/patch/HunkHeader;

    .line 252
    .local v3, h:Lorg/eclipse/jgit/patch/HunkHeader;
    invoke-virtual {v3, v8, v2, v6}, Lorg/eclipse/jgit/patch/HunkHeader;->extractFileLines(Ljava/lang/StringBuilder;[Ljava/lang/String;[I)V

    goto :goto_3

    .line 253
    .end local v3           #h:Lorg/eclipse/jgit/patch/HunkHeader;
    :cond_6
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_0
.end method

.method public getStartOffset()I
    .locals 1

    .prologue
    .line 174
    iget v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->startOffset:I

    return v0
.end method

.method public hasMetaDataChanges()Z
    .locals 2

    .prologue
    .line 299
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->MODIFY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method newHunkHeader(I)Lorg/eclipse/jgit/patch/HunkHeader;
    .locals 1
    .parameter "offset"

    .prologue
    .line 318
    new-instance v0, Lorg/eclipse/jgit/patch/HunkHeader;

    invoke-direct {v0, p0, p1}, Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;I)V

    return-object v0
.end method

.method parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;
    .locals 3
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 550
    const/4 v1, 0x0

    .local v1, tmp:I
    move v0, p1

    .line 551
    .end local p1
    .local v0, ptr:I
    :goto_0
    add-int/lit8 v2, p2, -0x1

    if-ge v0, v2, :cond_0

    .line 552
    shl-int/lit8 v1, v1, 0x3

    .line 553
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 p1, v0, 0x1

    .end local v0           #ptr:I
    .restart local p1
    aget-byte v2, v2, v0

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    move v0, p1

    .end local p1
    .restart local v0       #ptr:I
    goto :goto_0

    .line 555
    :cond_0
    invoke-static {v1}, Lorg/eclipse/jgit/lib/FileMode;->fromBits(I)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    return-object v2
.end method

.method parseGitFileName(II)I
    .locals 9
    .parameter "ptr"
    .parameter "end"

    .prologue
    const/16 v8, 0x2f

    const/16 v7, 0x22

    .line 349
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v5, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 350
    .local v3, eol:I
    move v2, p1

    .line 351
    .local v2, bol:I
    if-lt v3, p2, :cond_1

    .line 352
    const/4 v3, -0x1

    .line 405
    .end local v3           #eol:I
    :cond_0
    :goto_0
    return v3

    .line 362
    .restart local v3       #eol:I
    :cond_1
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v5, p1, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 363
    .local v0, aStart:I
    if-ge v0, v3, :cond_0

    .line 366
    :goto_1
    if-ge p1, v3, :cond_0

    .line 367
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    const/16 v6, 0x20

    invoke-static {v5, p1, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v4

    .line 368
    .local v4, sp:I
    if-ge v4, v3, :cond_0

    .line 374
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v5, v4, v8}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 375
    .local v1, bStart:I
    if-ge v1, v3, :cond_0

    .line 381
    add-int/lit8 v5, v4, -0x1

    add-int/lit8 v6, v3, -0x1

    invoke-direct {p0, v0, v5, v1, v6}, Lorg/eclipse/jgit/patch/FileHeader;->eq(IIII)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 382
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    aget-byte v5, v5, v2

    if-ne v5, v7, :cond_2

    .line 387
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v6, v4, -0x2

    aget-byte v5, v5, v6

    if-ne v5, v7, :cond_0

    .line 390
    sget-object v5, Lorg/eclipse/jgit/util/QuotedString;->GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    iget-object v6, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v7, v4, -0x1

    invoke-virtual {v5, v6, v2, v7}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->dequote([BII)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 391
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    invoke-static {v5}, Lorg/eclipse/jgit/patch/FileHeader;->p1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 395
    :goto_2
    iget-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    iput-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    goto :goto_0

    .line 393
    :cond_2
    sget-object v5, Lorg/eclipse/jgit/lib/Constants;->CHARSET:Ljava/nio/charset/Charset;

    iget-object v6, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v7, v4, -0x1

    invoke-static {v5, v6, v0, v7}, Lorg/eclipse/jgit/util/RawParseUtils;->decode(Ljava/nio/charset/Charset;[BII)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    goto :goto_2

    .line 402
    :cond_3
    move p1, v4

    .line 403
    goto :goto_1
.end method

.method parseGitHeaders(II)I
    .locals 4
    .parameter "ptr"
    .parameter "end"

    .prologue
    const/4 v3, 0x0

    .line 409
    :goto_0
    if-ge p1, p2, :cond_0

    .line 410
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v1, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 411
    .local v0, eol:I
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v1, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->isHunkHdr([BII)I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    .line 475
    .end local v0           #eol:I
    :cond_0
    return p1

    .line 415
    .restart local v0       #eol:I
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_2

    .line 416
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseOldName(II)V

    .line 473
    :goto_1
    move p1, v0

    .line 474
    goto :goto_0

    .line 418
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_3

    .line 419
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseNewName(II)V

    goto :goto_1

    .line 421
    :cond_3
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->OLD_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_4

    .line 422
    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->OLD_MODE:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_1

    .line 424
    :cond_4
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->NEW_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_5

    .line 425
    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->NEW_MODE:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    goto :goto_1

    .line 427
    :cond_5
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->DELETED_FILE_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_6

    .line 428
    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->DELETED_FILE_MODE:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 429
    sget-object v1, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 430
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto :goto_1

    .line 432
    :cond_6
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->NEW_FILE_MODE:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_7

    .line 433
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseNewFileMode(II)V

    goto :goto_1

    .line 435
    :cond_7
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->COPY_FROM:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_8

    .line 436
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->COPY_FROM:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 437
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto :goto_1

    .line 439
    :cond_8
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->COPY_TO:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_9

    .line 440
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->COPY_TO:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    .line 441
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->COPY:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto/16 :goto_1

    .line 443
    :cond_9
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_OLD:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_a

    .line 444
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_OLD:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 445
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto/16 :goto_1

    .line 447
    :cond_a
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_NEW:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_b

    .line 448
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_NEW:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    .line 449
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto/16 :goto_1

    .line 451
    :cond_b
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_FROM:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_c

    .line 452
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_FROM:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 453
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto/16 :goto_1

    .line 455
    :cond_c
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_TO:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_d

    .line 456
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->RENAME_TO:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-direct {p0, v1, v2, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    .line 457
    sget-object v1, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->RENAME:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    goto/16 :goto_1

    .line 459
    :cond_d
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->SIMILARITY_INDEX:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_e

    .line 460
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->SIMILARITY_INDEX:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->score:I

    goto/16 :goto_1

    .line 462
    :cond_e
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->DISSIMILARITY_INDEX:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_f

    .line 463
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->DISSIMILARITY_INDEX:[B

    array-length v2, v2

    add-int/2addr v2, p1

    invoke-static {v1, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->score:I

    goto/16 :goto_1

    .line 465
    :cond_f
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->INDEX:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_0

    .line 466
    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->INDEX:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-virtual {p0, v1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseIndexLine(II)V

    goto/16 :goto_1
.end method

.method parseIndexLine(II)V
    .locals 5
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 562
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    const/16 v3, 0x2e

    invoke-static {v2, p1, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v0

    .line 563
    .local v0, dot2:I
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    const/16 v3, 0x20

    invoke-static {v2, v0, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v1

    .line 565
    .local v1, mode:I
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v3, v0, -0x1

    invoke-static {v2, p1, v3}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 566
    iget-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    add-int/lit8 v3, v0, 0x1

    add-int/lit8 v4, v1, -0x1

    invoke-static {v2, v3, v4}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->fromString([BII)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->newId:Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    .line 568
    if-ge v1, p2, :cond_0

    .line 569
    invoke-virtual {p0, v1, p2}, Lorg/eclipse/jgit/patch/FileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v2

    iput-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v2, p0, Lorg/eclipse/jgit/patch/FileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 570
    :cond_0
    return-void
.end method

.method parseNewFileMode(II)V
    .locals 1
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 491
    sget-object v0, Lorg/eclipse/jgit/lib/FileMode;->MISSING:Lorg/eclipse/jgit/lib/FileMode;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 492
    sget-object v0, Lorg/eclipse/jgit/patch/FileHeader;->NEW_FILE_MODE:[B

    array-length v0, v0

    add-int/2addr v0, p1

    invoke-virtual {p0, v0, p2}, Lorg/eclipse/jgit/patch/FileHeader;->parseFileMode(II)Lorg/eclipse/jgit/lib/FileMode;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->newMode:Lorg/eclipse/jgit/lib/FileMode;

    .line 493
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 494
    return-void
.end method

.method parseNewName(II)V
    .locals 2
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 485
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-direct {p0, v0, v1, p2}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/patch/FileHeader;->p1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    .line 486
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->newPath:Ljava/lang/String;

    const-string v1, "/dev/null"

    if-ne v0, v1, :cond_0

    .line 487
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->DELETE:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 488
    :cond_0
    return-void
.end method

.method parseOldName(II)V
    .locals 2
    .parameter "ptr"
    .parameter "eol"

    .prologue
    .line 479
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    sget-object v1, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    array-length v1, v1

    add-int/2addr v1, p1

    invoke-direct {p0, v0, v1, p2}, Lorg/eclipse/jgit/patch/FileHeader;->parseName(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/eclipse/jgit/patch/FileHeader;->p1(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    .line 480
    iget-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->oldPath:Ljava/lang/String;

    const-string v1, "/dev/null"

    if-ne v0, v1, :cond_0

    .line 481
    sget-object v0, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ADD:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    iput-object v0, p0, Lorg/eclipse/jgit/patch/FileHeader;->changeType:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    .line 482
    :cond_0
    return-void
.end method

.method parseTraditionalHeaders(II)I
    .locals 3
    .parameter "ptr"
    .parameter "end"

    .prologue
    .line 497
    :goto_0
    if-ge p1, p2, :cond_0

    .line 498
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v1, p1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v0

    .line 499
    .local v0, eol:I
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    invoke-static {v1, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->isHunkHdr([BII)I

    move-result v1

    const/4 v2, 0x1

    if-lt v1, v2, :cond_1

    .line 516
    .end local v0           #eol:I
    :cond_0
    return p1

    .line 503
    .restart local v0       #eol:I
    :cond_1
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->OLD_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_2

    .line 504
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseOldName(II)V

    .line 514
    :goto_1
    move p1, v0

    .line 515
    goto :goto_0

    .line 506
    :cond_2
    iget-object v1, p0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    sget-object v2, Lorg/eclipse/jgit/patch/FileHeader;->NEW_NAME:[B

    invoke-static {v1, p1, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v1

    if-ltz v1, :cond_0

    .line 507
    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/patch/FileHeader;->parseNewName(II)V

    goto :goto_1
.end method

.method public toEditList()Lorg/eclipse/jgit/diff/EditList;
    .locals 4

    .prologue
    .line 333
    new-instance v2, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v2}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    .line 334
    .local v2, r:Lorg/eclipse/jgit/diff/EditList;
    iget-object v3, p0, Lorg/eclipse/jgit/patch/FileHeader;->hunks:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/HunkHeader;

    .line 335
    .local v0, hunk:Lorg/eclipse/jgit/patch/HunkHeader;
    invoke-virtual {v0}, Lorg/eclipse/jgit/patch/HunkHeader;->toEditList()Lorg/eclipse/jgit/diff/EditList;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/diff/EditList;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 336
    .end local v0           #hunk:Lorg/eclipse/jgit/patch/HunkHeader;
    :cond_0
    return-object v2
.end method
