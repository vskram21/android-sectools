.class public Lorg/eclipse/jgit/patch/HunkHeader;
.super Ljava/lang/Object;
.source "HunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
    }
.end annotation


# instance fields
.field private editList:Lorg/eclipse/jgit/diff/EditList;

.field endOffset:I

.field final file:Lorg/eclipse/jgit/patch/FileHeader;

.field nContext:I

.field newLineCount:I

.field newStartLine:I

.field private final old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

.field final startOffset:I


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/patch/FileHeader;I)V
    .locals 1
    .parameter "fh"
    .parameter "offset"

    .prologue
    .line 122
    new-instance v0, Lorg/eclipse/jgit/patch/HunkHeader$1;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/patch/HunkHeader$1;-><init>(Lorg/eclipse/jgit/patch/FileHeader;)V

    invoke-direct {p0, p1, p2, v0}, Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;ILorg/eclipse/jgit/patch/HunkHeader$OldImage;)V

    .line 128
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/patch/FileHeader;ILorg/eclipse/jgit/patch/HunkHeader$OldImage;)V
    .locals 0
    .parameter "fh"
    .parameter "offset"
    .parameter "oi"

    .prologue
    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 131
    iput-object p1, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    .line 132
    iput p2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    .line 133
    iput-object p3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    .line 134
    return-void
.end method

.method constructor <init>(Lorg/eclipse/jgit/patch/FileHeader;Lorg/eclipse/jgit/diff/EditList;)V
    .locals 3
    .parameter "fh"
    .parameter "editList"

    .prologue
    const/4 v2, 0x0

    .line 137
    iget-object v1, p1, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    array-length v1, v1

    invoke-direct {p0, p1, v1}, Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;I)V

    .line 138
    iput-object p2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    .line 139
    iget v1, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    iput v1, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    .line 140
    iput v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    .line 141
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/EditList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 142
    iput v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    .line 143
    iput v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    .line 149
    :goto_0
    return-void

    .line 145
    :cond_0
    invoke-virtual {p2, v2}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/diff/Edit;

    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    .line 146
    invoke-virtual {p2}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p2, v1}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/diff/Edit;

    .line 147
    .local v0, last:Lorg/eclipse/jgit/diff/Edit;
    invoke-virtual {v0}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v1

    iget v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    sub-int/2addr v1, v2

    iput v1, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    goto :goto_0
.end method


# virtual methods
.method copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V
    .locals 4
    .parameter "sb"
    .parameter "text"
    .parameter "offsets"
    .parameter "fileIdx"

    .prologue
    .line 389
    aget-object v1, p2, p4

    .line 390
    .local v1, s:Ljava/lang/String;
    aget v2, p3, p4

    .line 391
    .local v2, start:I
    const/16 v3, 0xa

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 392
    .local v0, end:I
    if-gez v0, :cond_0

    .line 393
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 396
    :goto_0
    invoke-virtual {p1, v1, v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    .line 397
    aput v0, p3, p4

    .line 398
    return-void

    .line 395
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method extractFileLines(Ljava/lang/StringBuilder;[Ljava/lang/String;[I)V
    .locals 6
    .parameter "sb"
    .parameter "text"
    .parameter "offsets"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 360
    iget-object v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v3, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 361
    .local v0, buf:[B
    iget v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    .line 362
    .local v2, ptr:I
    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 363
    .local v1, eol:I
    iget v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    if-gt v3, v1, :cond_1

    .line 385
    :cond_0
    :goto_0
    return-void

    .line 365
    :cond_1
    invoke-virtual {p0, p1, p2, p3, v4}, Lorg/eclipse/jgit/patch/HunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    .line 366
    move v2, v1

    :goto_1
    iget v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    if-ge v2, v3, :cond_0

    .line 367
    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 368
    aget-byte v3, v0, v2

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 372
    :sswitch_0
    invoke-virtual {p0, p1, p2, p3, v4}, Lorg/eclipse/jgit/patch/HunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    .line 373
    invoke-virtual {p0, p2, p3, v5}, Lorg/eclipse/jgit/patch/HunkHeader;->skipLine([Ljava/lang/String;[II)V

    .line 366
    :goto_2
    move v2, v1

    goto :goto_1

    .line 376
    :sswitch_1
    invoke-virtual {p0, p1, p2, p3, v4}, Lorg/eclipse/jgit/patch/HunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    goto :goto_2

    .line 379
    :sswitch_2
    invoke-virtual {p0, p1, p2, p3, v5}, Lorg/eclipse/jgit/patch/HunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    goto :goto_2

    .line 368
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x20 -> :sswitch_0
        0x2b -> :sswitch_2
        0x2d -> :sswitch_1
        0x5c -> :sswitch_0
    .end sparse-switch
.end method

.method extractFileLines([Ljava/io/OutputStream;)V
    .locals 7
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 325
    iget-object v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v3, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 326
    .local v0, buf:[B
    iget v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    .line 327
    .local v2, ptr:I
    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 328
    .local v1, eol:I
    iget v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    if-gt v3, v1, :cond_1

    .line 356
    :cond_0
    :goto_0
    return-void

    .line 335
    :cond_1
    aget-object v3, p1, v5

    sub-int v4, v1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 337
    move v2, v1

    :goto_1
    iget v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    if-ge v2, v3, :cond_0

    .line 338
    invoke-static {v0, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 339
    aget-byte v3, v0, v2

    sparse-switch v3, :sswitch_data_0

    goto :goto_0

    .line 343
    :sswitch_0
    aget-object v3, p1, v5

    sub-int v4, v1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 344
    aget-object v3, p1, v6

    sub-int v4, v1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    .line 337
    :goto_2
    move v2, v1

    goto :goto_1

    .line 347
    :sswitch_1
    aget-object v3, p1, v5

    sub-int v4, v1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2

    .line 350
    :sswitch_2
    aget-object v3, p1, v6

    sub-int v4, v1, v2

    invoke-virtual {v3, v0, v2, v4}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_2

    .line 339
    nop

    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x20 -> :sswitch_0
        0x2b -> :sswitch_2
        0x2d -> :sswitch_1
        0x5c -> :sswitch_0
    .end sparse-switch
.end method

.method public getBuffer()[B
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v0, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    return-object v0
.end method

.method public getEndOffset()I
    .locals 1

    .prologue
    .line 168
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    return v0
.end method

.method public getFileHeader()Lorg/eclipse/jgit/patch/FileHeader;
    .locals 1

    .prologue
    .line 153
    iget-object v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    return-object v0
.end method

.method public getLinesContext()I
    .locals 1

    .prologue
    .line 188
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    return v0
.end method

.method public getNewLineCount()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    return v0
.end method

.method public getNewStartLine()I
    .locals 1

    .prologue
    .line 178
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    return v0
.end method

.method public getOldImage()Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    return-object v0
.end method

.method public getStartOffset()I
    .locals 1

    .prologue
    .line 163
    iget v0, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    return v0
.end method

.method parseBody(Lorg/eclipse/jgit/patch/Patch;I)I
    .locals 11
    .parameter "script"
    .parameter "end"

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 259
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v6, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 260
    .local v0, buf:[B
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    invoke-static {v0, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .local v1, c:I
    move v2, v1

    .line 262
    .local v2, last:I
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iput v10, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    .line 263
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iput v10, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    .line 265
    :goto_0
    if-ge v1, p2, :cond_0

    .line 266
    aget-byte v6, v0, v1

    sparse-switch v6, :sswitch_data_0

    .line 288
    :cond_0
    if-ge v2, p2, :cond_1

    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    if-ne v6, v7, :cond_1

    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/2addr v6, v7

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    if-ne v6, v7, :cond_1

    sget-object v6, Lorg/eclipse/jgit/patch/Patch;->SIG_FOOTER:[B

    invoke-static {v0, v2, v6}, Lorg/eclipse/jgit/util/RawParseUtils;->match([BI[B)I

    move-result v6

    if-ltz v6, :cond_1

    .line 296
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/lit8 v7, v7, -0x1

    iput v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    .line 321
    .end local v2           #last:I
    :goto_1
    return v2

    .line 269
    .restart local v2       #last:I
    :sswitch_0
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    add-int/lit8 v6, v6, 0x1

    iput v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    .line 265
    :goto_2
    :sswitch_1
    move v2, v1

    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    goto :goto_0

    .line 273
    :sswitch_2
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    goto :goto_2

    .line 277
    :sswitch_3
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/lit8 v7, v7, 0x1

    iput v7, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    goto :goto_2

    .line 300
    :cond_1
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/2addr v6, v7

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    if-ge v6, v7, :cond_3

    .line 301
    iget-object v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v6, v6, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v8, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v8, v8, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/2addr v7, v8

    sub-int v3, v6, v7

    .line 302
    .local v3, missingCount:I
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->truncatedHunkOldLinesMissing:Ljava/lang/String;

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v0, v6, v7}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    .end local v3           #missingCount:I
    :cond_2
    :goto_3
    move v2, v1

    .line 321
    goto :goto_1

    .line 306
    :cond_3
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/2addr v6, v7

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    if-ge v6, v7, :cond_4

    .line 307
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v8, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v8, v8, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/2addr v7, v8

    sub-int v3, v6, v7

    .line 308
    .restart local v3       #missingCount:I
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->truncatedHunkNewLinesMissing:Ljava/lang/String;

    new-array v8, v9, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v10

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v0, v6, v7}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    goto :goto_3

    .line 312
    .end local v3           #missingCount:I
    :cond_4
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/2addr v6, v7

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    if-gt v6, v7, :cond_5

    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/2addr v6, v7

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    if-le v6, v7, :cond_2

    .line 314
    :cond_5
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v7, v7, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 315
    .local v5, oldcnt:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v8, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v8, v8, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nDeleted:I

    add-int/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, p0, Lorg/eclipse/jgit/patch/HunkHeader;->nContext:I

    iget-object v8, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v8, v8, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->nAdded:I

    add-int/2addr v7, v8

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 317
    .local v4, newcnt:Ljava/lang/String;
    iget v6, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v7

    iget-object v7, v7, Lorg/eclipse/jgit/internal/JGitText;->hunkHeaderDoesNotMatchBodyLineCountOf:Ljava/lang/String;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v5, v8, v10

    aput-object v4, v8, v9

    invoke-static {v7, v8}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v0, v6, v7}, Lorg/eclipse/jgit/patch/Patch;->warn([BILjava/lang/String;)V

    goto/16 :goto_3

    .line 266
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x20 -> :sswitch_0
        0x2b -> :sswitch_3
        0x2d -> :sswitch_2
        0x5c -> :sswitch_1
    .end sparse-switch
.end method

.method parseHeader()V
    .locals 6

    .prologue
    const/16 v5, 0x2c

    const/4 v4, 0x1

    .line 242
    iget-object v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v2, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 243
    .local v0, buf:[B
    new-instance v1, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v1}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 244
    .local v1, ptr:Lorg/eclipse/jgit/util/MutableInteger;
    iget v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    const/16 v3, 0x20

    invoke-static {v0, v2, v3}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v2

    iput v2, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 245
    iget-object v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v3, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {v0, v3, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v3

    neg-int v3, v3

    iput v3, v2, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->startLine:I

    .line 246
    iget v2, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    aget-byte v2, v0, v2

    if-ne v2, v5, :cond_0

    .line 247
    iget-object v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v3, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v3

    iput v3, v2, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    .line 251
    :goto_0
    iget v2, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v0, v2, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    .line 252
    iget v2, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    aget-byte v2, v0, v2

    if-ne v2, v5, :cond_1

    .line 253
    iget v2, v1, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v2, v2, 0x1

    invoke-static {v0, v2, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v2

    iput v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    .line 256
    :goto_1
    return-void

    .line 249
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iput v4, v2, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->lineCount:I

    goto :goto_0

    .line 255
    :cond_1
    iput v4, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newLineCount:I

    goto :goto_1
.end method

.method skipLine([Ljava/lang/String;[II)V
    .locals 4
    .parameter "text"
    .parameter "offsets"
    .parameter "fileIdx"

    .prologue
    .line 402
    aget-object v1, p1, p3

    .line 403
    .local v1, s:Ljava/lang/String;
    const/16 v2, 0xa

    aget v3, p2, p3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 404
    .local v0, end:I
    if-gez v0, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    :goto_0
    aput v2, p2, p3

    .line 405
    return-void

    .line 404
    :cond_0
    add-int/lit8 v2, v0, 0x1

    goto :goto_0
.end method

.method public toEditList()Lorg/eclipse/jgit/diff/EditList;
    .locals 7

    .prologue
    .line 193
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    if-nez v5, :cond_0

    .line 194
    new-instance v5, Lorg/eclipse/jgit/diff/EditList;

    invoke-direct {v5}, Lorg/eclipse/jgit/diff/EditList;-><init>()V

    iput-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    .line 195
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v5, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 196
    .local v0, buf:[B
    iget v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->startOffset:I

    invoke-static {v0, v5}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    .line 197
    .local v1, c:I
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->old:Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    iget v4, v5, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->startLine:I

    .line 198
    .local v4, oLine:I
    iget v3, p0, Lorg/eclipse/jgit/patch/HunkHeader;->newStartLine:I

    .line 199
    .local v3, nLine:I
    const/4 v2, 0x0

    .line 201
    .local v2, in:Lorg/eclipse/jgit/diff/Edit;
    :goto_0
    iget v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->endOffset:I

    if-ge v1, v5, :cond_0

    .line 202
    aget-byte v5, v0, v1

    sparse-switch v5, :sswitch_data_0

    .line 236
    .end local v0           #buf:[B
    .end local v1           #c:I
    .end local v2           #in:Lorg/eclipse/jgit/diff/Edit;
    .end local v3           #nLine:I
    .end local v4           #oLine:I
    :cond_0
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    return-object v5

    .line 205
    .restart local v0       #buf:[B
    .restart local v1       #c:I
    .restart local v2       #in:Lorg/eclipse/jgit/diff/Edit;
    .restart local v3       #nLine:I
    .restart local v4       #oLine:I
    :sswitch_0
    const/4 v2, 0x0

    .line 206
    add-int/lit8 v4, v4, 0x1

    .line 207
    add-int/lit8 v3, v3, 0x1

    .line 201
    :goto_1
    :sswitch_1
    invoke-static {v0, v1}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v1

    goto :goto_0

    .line 211
    :sswitch_2
    if-nez v2, :cond_1

    .line 212
    new-instance v2, Lorg/eclipse/jgit/diff/Edit;

    .end local v2           #in:Lorg/eclipse/jgit/diff/Edit;
    add-int/lit8 v5, v4, -0x1

    add-int/lit8 v6, v3, -0x1

    invoke-direct {v2, v5, v6}, Lorg/eclipse/jgit/diff/Edit;-><init>(II)V

    .line 213
    .restart local v2       #in:Lorg/eclipse/jgit/diff/Edit;
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    .line 215
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 216
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/Edit;->extendA()V

    goto :goto_1

    .line 220
    :sswitch_3
    if-nez v2, :cond_2

    .line 221
    new-instance v2, Lorg/eclipse/jgit/diff/Edit;

    .end local v2           #in:Lorg/eclipse/jgit/diff/Edit;
    add-int/lit8 v5, v4, -0x1

    add-int/lit8 v6, v3, -0x1

    invoke-direct {v2, v5, v6}, Lorg/eclipse/jgit/diff/Edit;-><init>(II)V

    .line 222
    .restart local v2       #in:Lorg/eclipse/jgit/diff/Edit;
    iget-object v5, p0, Lorg/eclipse/jgit/patch/HunkHeader;->editList:Lorg/eclipse/jgit/diff/EditList;

    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/diff/EditList;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 225
    invoke-virtual {v2}, Lorg/eclipse/jgit/diff/Edit;->extendB()V

    goto :goto_1

    .line 202
    :sswitch_data_0
    .sparse-switch
        0xa -> :sswitch_0
        0x20 -> :sswitch_0
        0x2b -> :sswitch_3
        0x2d -> :sswitch_2
        0x5c -> :sswitch_1
    .end sparse-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x2c

    .line 410
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 411
    .local v0, buf:Ljava/lang/StringBuilder;
    const-string v1, "HunkHeader["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/HunkHeader;->getOldImage()Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->getStartLine()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 413
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 414
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/HunkHeader;->getOldImage()Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/patch/HunkHeader$OldImage;->getLineCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 415
    const-string v1, "->"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 416
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewStartLine()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewLineCount()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 417
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 418
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
