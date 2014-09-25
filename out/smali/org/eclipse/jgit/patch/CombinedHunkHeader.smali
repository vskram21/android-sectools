.class public Lorg/eclipse/jgit/patch/CombinedHunkHeader;
.super Lorg/eclipse/jgit/patch/HunkHeader;
.source "CombinedHunkHeader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    }
.end annotation


# instance fields
.field private old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/patch/CombinedFileHeader;I)V
    .locals 4
    .parameter "fh"
    .parameter "offset"

    .prologue
    .line 66
    const/4 v2, 0x0

    invoke-direct {p0, p1, p2, v2}, Lorg/eclipse/jgit/patch/HunkHeader;-><init>(Lorg/eclipse/jgit/patch/FileHeader;ILorg/eclipse/jgit/patch/HunkHeader$OldImage;)V

    .line 67
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/CombinedFileHeader;->getParentCount()I

    move-result v2

    new-array v2, v2, [Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    iput-object v2, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    .line 68
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 69
    move v1, v0

    .line 70
    .local v1, imagePos:I
    iget-object v2, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    new-instance v3, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;

    invoke-direct {v3, p0, p1, v1}, Lorg/eclipse/jgit/patch/CombinedHunkHeader$1;-><init>(Lorg/eclipse/jgit/patch/CombinedHunkHeader;Lorg/eclipse/jgit/patch/CombinedFileHeader;I)V

    aput-object v3, v2, v0

    .line 68
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 77
    .end local v1           #imagePos:I
    :cond_0
    return-void
.end method


# virtual methods
.method extractFileLines(Ljava/lang/StringBuilder;[Ljava/lang/String;[I)V
    .locals 7
    .parameter "sb"
    .parameter "text"
    .parameter "offsets"

    .prologue
    .line 271
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v1, v5, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 272
    .local v1, buf:[B
    iget v4, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    .line 273
    .local v4, ptr:I
    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 274
    .local v3, eol:I
    iget v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->endOffset:I

    if-gt v5, v3, :cond_1

    .line 327
    :cond_0
    :goto_0
    return-void

    .line 276
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {p0, p1, p2, p3, v5}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    .line 277
    move v4, v3

    :goto_1
    iget v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->endOffset:I

    if-ge v4, v5, :cond_0

    .line 278
    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 280
    sub-int v5, v3, v4

    iget-object v6, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v6, v6

    add-int/lit8 v6, v6, 0x1

    if-lt v5, v6, :cond_0

    .line 286
    aget-byte v5, v1, v4

    sparse-switch v5, :sswitch_data_0

    goto :goto_0

    .line 299
    :sswitch_0
    const/4 v2, 0x0

    .line 300
    .local v2, copied:Z
    const/4 v0, 0x0

    .local v0, ancestor:I
    :goto_2
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v5, v5

    if-ge v0, v5, :cond_3

    .line 301
    add-int v5, v4, v0

    aget-byte v5, v1, v5

    sparse-switch v5, :sswitch_data_1

    goto :goto_0

    .line 304
    :sswitch_1
    if-eqz v2, :cond_2

    .line 305
    invoke-virtual {p0, p2, p3, v0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->skipLine([Ljava/lang/String;[II)V

    .line 300
    :goto_3
    :sswitch_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 307
    :cond_2
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    .line 308
    const/4 v2, 0x1

    .line 310
    goto :goto_3

    .line 319
    :cond_3
    if-nez v2, :cond_4

    .line 324
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v5, v5

    invoke-virtual {p0, p1, p2, p3, v5}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->copyLine(Ljava/lang/StringBuilder;[Ljava/lang/String;[II)V

    .line 277
    :cond_4
    move v4, v3

    goto :goto_1

    .line 286
    nop

    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
    .end sparse-switch

    .line 301
    :sswitch_data_1
    .sparse-switch
        0x20 -> :sswitch_1
        0x2b -> :sswitch_2
        0x2d -> :sswitch_1
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
    .line 207
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v1, v5, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 208
    .local v1, buf:[B
    iget v4, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    .line 209
    .local v4, ptr:I
    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 210
    .local v3, eol:I
    iget v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->endOffset:I

    if-gt v5, v3, :cond_1

    .line 267
    :cond_0
    :goto_0
    return-void

    .line 217
    :cond_1
    const/4 v5, 0x0

    aget-object v5, p1, v5

    sub-int v6, v3, v4

    invoke-virtual {v5, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 219
    move v4, v3

    :goto_1
    iget v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->endOffset:I

    if-ge v4, v5, :cond_0

    .line 220
    invoke-static {v1, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v3

    .line 222
    sub-int v5, v3, v4

    iget-object v6, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v6, v6

    add-int/lit8 v6, v6, 0x1

    if-lt v5, v6, :cond_0

    .line 228
    aget-byte v5, v1, v4

    sparse-switch v5, :sswitch_data_0

    goto :goto_0

    .line 241
    :sswitch_0
    const/4 v2, 0x0

    .line 242
    .local v2, delcnt:I
    const/4 v0, 0x0

    .local v0, ancestor:I
    :goto_2
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v5, v5

    if-ge v0, v5, :cond_2

    .line 243
    add-int v5, v4, v0

    aget-byte v5, v1, v5

    sparse-switch v5, :sswitch_data_1

    goto :goto_0

    .line 250
    :sswitch_1
    aget-object v5, p1, v0

    sub-int v6, v3, v4

    invoke-virtual {v5, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 242
    :goto_3
    :sswitch_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 245
    :sswitch_3
    add-int/lit8 v2, v2, 0x1

    .line 246
    aget-object v5, p1, v0

    sub-int v6, v3, v4

    invoke-virtual {v5, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_3

    .line 260
    :cond_2
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v5, v5

    if-ge v2, v5, :cond_3

    .line 264
    iget-object v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v5, v5

    aget-object v5, p1, v5

    sub-int v6, v3, v4

    invoke-virtual {v5, v1, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    .line 219
    :cond_3
    move v4, v3

    goto :goto_1

    .line 228
    nop

    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
    .end sparse-switch

    .line 243
    :sswitch_data_1
    .sparse-switch
        0x20 -> :sswitch_1
        0x2b -> :sswitch_2
        0x2d -> :sswitch_3
    .end sparse-switch
.end method

.method public getFileHeader()Lorg/eclipse/jgit/patch/CombinedFileHeader;
    .locals 1

    .prologue
    .line 81
    invoke-super {p0}, Lorg/eclipse/jgit/patch/HunkHeader;->getFileHeader()Lorg/eclipse/jgit/patch/FileHeader;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/CombinedFileHeader;

    return-object v0
.end method

.method public bridge synthetic getFileHeader()Lorg/eclipse/jgit/patch/FileHeader;
    .locals 1

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->getFileHeader()Lorg/eclipse/jgit/patch/CombinedFileHeader;

    move-result-object v0

    return-object v0
.end method

.method public getOldImage()Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
    .locals 1

    .prologue
    .line 86
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->getOldImage(I)Lorg/eclipse/jgit/patch/HunkHeader$OldImage;

    move-result-object v0

    return-object v0
.end method

.method public getOldImage(I)Lorg/eclipse/jgit/patch/HunkHeader$OldImage;
    .locals 1
    .parameter "nthParent"

    .prologue
    .line 97
    iget-object v0, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v0, v0, p1

    return-object v0
.end method

.method parseBody(Lorg/eclipse/jgit/patch/Patch;I)I
    .locals 19
    .parameter "script"
    .parameter "end"

    .prologue
    .line 125
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v3, v14, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 126
    .local v3, buf:[B
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    invoke-static {v3, v14}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v4

    .line 128
    .local v4, c:I
    move-object/from16 v0, p0

    iget-object v2, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    .local v2, arr$:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    array-length v8, v2

    .local v8, len$:I
    const/4 v7, 0x0

    .local v7, i$:I
    :goto_0
    if-ge v7, v8, :cond_0

    aget-object v13, v2, v7

    .line 129
    .local v13, o:Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    const/4 v14, 0x0

    iput v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nDeleted:I

    .line 130
    const/4 v14, 0x0

    iput v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nAdded:I

    .line 131
    const/4 v14, 0x0

    iput v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nContext:I

    .line 128
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 133
    .end local v13           #o:Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    :cond_0
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->nContext:I

    .line 134
    const/4 v12, 0x0

    .line 136
    .local v12, nAdded:I
    :goto_1
    move/from16 v0, p2

    if-ge v4, v0, :cond_1

    .line 137
    invoke-static {v3, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BI)I

    move-result v6

    .line 139
    .local v6, eol:I
    sub-int v14, v6, v4

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v15, v15

    add-int/lit8 v15, v15, 0x1

    if-ge v14, v15, :cond_3

    .line 183
    .end local v6           #eol:I
    :cond_1
    :goto_2
    const/4 v1, 0x0

    .local v1, ancestor:I
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v14, v14

    if-ge v1, v14, :cond_6

    .line 184
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v13, v14, v1

    .line 185
    .restart local v13       #o:Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    iget v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nContext:I

    iget v15, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nDeleted:I

    add-int v5, v14, v15

    .line 186
    .local v5, cmp:I
    iget v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->lineCount:I

    if-ge v5, v14, :cond_2

    .line 187
    iget v14, v13, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->lineCount:I

    sub-int v10, v14, v5

    .line 188
    .local v10, missingCnt:I
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->truncatedHunkLinesMissingForAncestor:Ljava/lang/String;

    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    add-int/lit8 v18, v1, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v14, v15}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    .line 183
    .end local v10           #missingCnt:I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 145
    .end local v1           #ancestor:I
    .end local v5           #cmp:I
    .end local v13           #o:Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;
    .restart local v6       #eol:I
    :cond_3
    aget-byte v14, v3, v4

    sparse-switch v14, :sswitch_data_0

    goto :goto_2

    .line 158
    :sswitch_0
    const/4 v9, 0x0

    .line 159
    .local v9, localcontext:I
    const/4 v1, 0x0

    .restart local v1       #ancestor:I
    :goto_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v14, v14

    if-ge v1, v14, :cond_4

    .line 160
    add-int v14, v4, v1

    aget-byte v14, v3, v14

    sparse-switch v14, :sswitch_data_1

    goto :goto_2

    .line 162
    :sswitch_1
    add-int/lit8 v9, v9, 0x1

    .line 163
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v14, v14, v1

    iget v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nContext:I

    add-int/lit8 v15, v15, 0x1

    iput v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nContext:I

    .line 159
    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 167
    :sswitch_2
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v14, v14, v1

    iget v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nDeleted:I

    add-int/lit8 v15, v15, 0x1

    iput v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nDeleted:I

    goto :goto_5

    .line 171
    :sswitch_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v14, v14, v1

    iget v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nAdded:I

    add-int/lit8 v15, v15, 0x1

    iput v15, v14, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->nAdded:I

    .line 172
    add-int/lit8 v12, v12, 0x1

    .line 173
    goto :goto_5

    .line 179
    :cond_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v14, v14

    if-ne v9, v14, :cond_5

    .line 180
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->nContext:I

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, p0

    iput v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->nContext:I

    .line 136
    :cond_5
    move v4, v6

    goto/16 :goto_1

    .line 195
    .end local v6           #eol:I
    .end local v9           #localcontext:I
    :cond_6
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->nContext:I

    add-int/2addr v14, v12

    move-object/from16 v0, p0

    iget v15, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->newLineCount:I

    if-ge v14, v15, :cond_7

    .line 196
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->newLineCount:I

    move-object/from16 v0, p0

    iget v15, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->nContext:I

    add-int/2addr v15, v12

    sub-int v11, v14, v15

    .line 197
    .local v11, missingCount:I
    move-object/from16 v0, p0

    iget v14, v0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v15

    iget-object v15, v15, Lorg/eclipse/jgit/internal/JGitText;->truncatedHunkNewLinesMissing:Ljava/lang/String;

    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v15 .. v16}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v14, v15}, Lorg/eclipse/jgit/patch/Patch;->error([BILjava/lang/String;)V

    .line 202
    .end local v11           #missingCount:I
    :cond_7
    return v4

    .line 145
    nop

    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_0
        0x2b -> :sswitch_0
        0x2d -> :sswitch_0
    .end sparse-switch

    .line 160
    :sswitch_data_1
    .sparse-switch
        0x20 -> :sswitch_1
        0x2b -> :sswitch_3
        0x2d -> :sswitch_2
    .end sparse-switch
.end method

.method parseHeader()V
    .locals 7

    .prologue
    const/16 v6, 0x2c

    const/4 v5, 0x1

    .line 104
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->file:Lorg/eclipse/jgit/patch/FileHeader;

    iget-object v0, v3, Lorg/eclipse/jgit/patch/FileHeader;->buf:[B

    .line 105
    .local v0, buf:[B
    new-instance v2, Lorg/eclipse/jgit/util/MutableInteger;

    invoke-direct {v2}, Lorg/eclipse/jgit/util/MutableInteger;-><init>()V

    .line 106
    .local v2, ptr:Lorg/eclipse/jgit/util/MutableInteger;
    iget v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->startOffset:I

    const/16 v4, 0x20

    invoke-static {v0, v3, v4}, Lorg/eclipse/jgit/util/RawParseUtils;->nextLF([BIC)I

    move-result v3

    iput v3, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    .line 108
    const/4 v1, 0x0

    .local v1, n:I
    :goto_0
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    .line 109
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v3, v3, v1

    iget v4, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    invoke-static {v0, v4, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v4

    neg-int v4, v4

    iput v4, v3, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->startLine:I

    .line 110
    iget v3, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    aget-byte v3, v0, v3

    if-ne v3, v6, :cond_0

    .line 111
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v3, v3, v1

    iget v4, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v4, v4, 0x1

    invoke-static {v0, v4, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v4

    iput v4, v3, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->lineCount:I

    .line 108
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 113
    :cond_0
    iget-object v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->old:[Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;

    aget-object v3, v3, v1

    iput v5, v3, Lorg/eclipse/jgit/patch/CombinedHunkHeader$CombinedOldImage;->lineCount:I

    goto :goto_1

    .line 116
    :cond_1
    iget v3, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->newStartLine:I

    .line 117
    iget v3, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    aget-byte v3, v0, v3

    if-ne v3, v6, :cond_2

    .line 118
    iget v3, v2, Lorg/eclipse/jgit/util/MutableInteger;->value:I

    add-int/lit8 v3, v3, 0x1

    invoke-static {v0, v3, v2}, Lorg/eclipse/jgit/util/RawParseUtils;->parseBase10([BILorg/eclipse/jgit/util/MutableInteger;)I

    move-result v3

    iput v3, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->newLineCount:I

    .line 121
    :goto_2
    return-void

    .line 120
    :cond_2
    iput v5, p0, Lorg/eclipse/jgit/patch/CombinedHunkHeader;->newLineCount:I

    goto :goto_2
.end method
