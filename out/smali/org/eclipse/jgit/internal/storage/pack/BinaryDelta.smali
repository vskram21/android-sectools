.class public Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;
.super Ljava/lang/Object;
.source "BinaryDelta.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final apply([B[B)[B
    .locals 1
    .parameter "base"
    .parameter "delta"

    .prologue
    .line 118
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->apply([B[B[B)[B

    move-result-object v0

    return-object v0
.end method

.method public static final apply([B[B[B)[B
    .locals 16
    .parameter "base"
    .parameter "delta"
    .parameter "result"

    .prologue
    .line 137
    const/4 v7, 0x0

    .line 141
    .local v7, deltaPtr:I
    const/4 v2, 0x0

    .line 142
    .local v2, baseLen:I
    const/4 v11, 0x0

    .line 144
    .local v11, shift:I
    :goto_0
    add-int/lit8 v8, v7, 0x1

    .end local v7           #deltaPtr:I
    .local v8, deltaPtr:I
    aget-byte v12, p1, v7

    and-int/lit16 v3, v12, 0xff

    .line 145
    .local v3, c:I
    int-to-long v12, v2

    and-int/lit8 v14, v3, 0x7f

    int-to-long v14, v14

    shl-long/2addr v14, v11

    or-long/2addr v12, v14

    long-to-int v2, v12

    .line 146
    add-int/lit8 v11, v11, 0x7

    .line 147
    and-int/lit16 v12, v3, 0x80

    if-nez v12, :cond_f

    .line 148
    move-object/from16 v0, p0

    array-length v12, v0

    if-eq v12, v2, :cond_0

    .line 149
    new-instance v12, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->baseLengthIncorrect:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 154
    :cond_0
    const/4 v9, 0x0

    .line 155
    .local v9, resLen:I
    const/4 v11, 0x0

    move v7, v8

    .line 157
    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :goto_1
    add-int/lit8 v8, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    aget-byte v12, p1, v7

    and-int/lit16 v3, v12, 0xff

    .line 158
    int-to-long v12, v9

    and-int/lit8 v14, v3, 0x7f

    int-to-long v14, v14

    shl-long/2addr v14, v11

    or-long/2addr v12, v14

    long-to-int v9, v12

    .line 159
    add-int/lit8 v11, v11, 0x7

    .line 160
    and-int/lit16 v12, v3, 0x80

    if-nez v12, :cond_e

    .line 162
    if-nez p2, :cond_9

    .line 163
    new-array v0, v9, [B

    move-object/from16 p2, v0

    .line 168
    :cond_1
    const/4 v10, 0x0

    .local v10, resultPtr:I
    move v7, v8

    .line 169
    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :goto_2
    move-object/from16 v0, p1

    array-length v12, v0

    if-ge v7, v12, :cond_c

    .line 170
    add-int/lit8 v8, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    aget-byte v12, p1, v7

    and-int/lit16 v4, v12, 0xff

    .line 171
    .local v4, cmd:I
    and-int/lit16 v12, v4, 0x80

    if-eqz v12, :cond_a

    .line 176
    const/4 v5, 0x0

    .line 177
    .local v5, copyOffset:I
    and-int/lit8 v12, v4, 0x1

    if-eqz v12, :cond_2

    .line 178
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v5, v12, 0xff

    move v8, v7

    .line 179
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_2
    and-int/lit8 v12, v4, 0x2

    if-eqz v12, :cond_3

    .line 180
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x8

    or-int/2addr v5, v12

    move v8, v7

    .line 181
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_3
    and-int/lit8 v12, v4, 0x4

    if-eqz v12, :cond_4

    .line 182
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x10

    or-int/2addr v5, v12

    move v8, v7

    .line 183
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_4
    and-int/lit8 v12, v4, 0x8

    if-eqz v12, :cond_5

    .line 184
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x18

    or-int/2addr v5, v12

    move v8, v7

    .line 186
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_5
    const/4 v6, 0x0

    .line 187
    .local v6, copySize:I
    and-int/lit8 v12, v4, 0x10

    if-eqz v12, :cond_6

    .line 188
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v6, v12, 0xff

    move v8, v7

    .line 189
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_6
    and-int/lit8 v12, v4, 0x20

    if-eqz v12, :cond_7

    .line 190
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x8

    or-int/2addr v6, v12

    move v8, v7

    .line 191
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_7
    and-int/lit8 v12, v4, 0x40

    if-eqz v12, :cond_d

    .line 192
    add-int/lit8 v7, v8, 0x1

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p1, v8

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x10

    or-int/2addr v6, v12

    .line 193
    :goto_3
    if-nez v6, :cond_8

    .line 194
    const/high16 v6, 0x1

    .line 196
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-static {v0, v5, v1, v10, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 197
    add-int/2addr v10, v6

    .line 198
    goto :goto_2

    .line 164
    .end local v4           #cmd:I
    .end local v5           #copyOffset:I
    .end local v6           #copySize:I
    .end local v7           #deltaPtr:I
    .end local v10           #resultPtr:I
    .restart local v8       #deltaPtr:I
    :cond_9
    move-object/from16 v0, p2

    array-length v12, v0

    if-eq v12, v9, :cond_1

    .line 165
    new-instance v12, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->resultLengthIncorrect:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 198
    .restart local v4       #cmd:I
    .restart local v10       #resultPtr:I
    :cond_a
    if-eqz v4, :cond_b

    .line 202
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v0, v8, v1, v10, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 203
    add-int v7, v8, v4

    .line 204
    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    add-int/2addr v10, v4

    goto/16 :goto_2

    .line 209
    .end local v7           #deltaPtr:I
    .restart local v8       #deltaPtr:I
    :cond_b
    new-instance v12, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->unsupportedCommand0:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 214
    .end local v4           #cmd:I
    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_c
    return-object p2

    .end local v7           #deltaPtr:I
    .restart local v4       #cmd:I
    .restart local v5       #copyOffset:I
    .restart local v6       #copySize:I
    .restart local v8       #deltaPtr:I
    :cond_d
    move v7, v8

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    goto :goto_3

    .end local v4           #cmd:I
    .end local v5           #copyOffset:I
    .end local v6           #copySize:I
    .end local v7           #deltaPtr:I
    .end local v10           #resultPtr:I
    .restart local v8       #deltaPtr:I
    :cond_e
    move v7, v8

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    goto/16 :goto_1

    .end local v7           #deltaPtr:I
    .end local v9           #resLen:I
    .restart local v8       #deltaPtr:I
    :cond_f
    move v7, v8

    .end local v8           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    goto/16 :goto_0
.end method

.method public static format([B)Ljava/lang/String;
    .locals 1
    .parameter "delta"

    .prologue
    .line 225
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lorg/eclipse/jgit/internal/storage/pack/BinaryDelta;->format([BZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static format([BZ)Ljava/lang/String;
    .locals 14
    .parameter "delta"
    .parameter "includeHeader"

    .prologue
    .line 239
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .local v8, r:Ljava/lang/StringBuilder;
    const/4 v6, 0x0

    .line 242
    .local v6, deltaPtr:I
    const-wide/16 v0, 0x0

    .line 243
    .local v0, baseLen:J
    const/4 v11, 0x0

    .line 245
    .local v11, shift:I
    :goto_0
    add-int/lit8 v7, v6, 0x1

    .end local v6           #deltaPtr:I
    .local v7, deltaPtr:I
    aget-byte v12, p0, v6

    and-int/lit16 v2, v12, 0xff

    .line 246
    .local v2, c:I
    and-int/lit8 v12, v2, 0x7f

    int-to-long v12, v12

    shl-long/2addr v12, v11

    or-long/2addr v0, v12

    .line 247
    add-int/lit8 v11, v11, 0x7

    .line 248
    and-int/lit16 v12, v2, 0x80

    if-nez v12, :cond_d

    .line 250
    const-wide/16 v9, 0x0

    .line 251
    .local v9, resLen:J
    const/4 v11, 0x0

    move v6, v7

    .line 253
    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    :goto_1
    add-int/lit8 v7, v6, 0x1

    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p0, v6

    and-int/lit16 v2, v12, 0xff

    .line 254
    and-int/lit8 v12, v2, 0x7f

    int-to-long v12, v12

    shl-long/2addr v12, v11

    or-long/2addr v9, v12

    .line 255
    add-int/lit8 v11, v11, 0x7

    .line 256
    and-int/lit16 v12, v2, 0x80

    if-nez v12, :cond_c

    .line 258
    if-eqz p1, :cond_0

    .line 259
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "DELTA( BASE="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " RESULT="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " )\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    move v6, v7

    .line 261
    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    :goto_2
    array-length v12, p0

    if-ge v6, v12, :cond_a

    .line 262
    add-int/lit8 v7, v6, 0x1

    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    aget-byte v12, p0, v6

    and-int/lit16 v3, v12, 0xff

    .line 263
    .local v3, cmd:I
    and-int/lit16 v12, v3, 0x80

    if-eqz v12, :cond_8

    .line 268
    const/4 v4, 0x0

    .line 269
    .local v4, copyOffset:I
    and-int/lit8 v12, v3, 0x1

    if-eqz v12, :cond_1

    .line 270
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v4, v12, 0xff

    move v7, v6

    .line 271
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_1
    and-int/lit8 v12, v3, 0x2

    if-eqz v12, :cond_2

    .line 272
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x8

    or-int/2addr v4, v12

    move v7, v6

    .line 273
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_2
    and-int/lit8 v12, v3, 0x4

    if-eqz v12, :cond_3

    .line 274
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x10

    or-int/2addr v4, v12

    move v7, v6

    .line 275
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_3
    and-int/lit8 v12, v3, 0x8

    if-eqz v12, :cond_4

    .line 276
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x18

    or-int/2addr v4, v12

    move v7, v6

    .line 278
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_4
    const/4 v5, 0x0

    .line 279
    .local v5, copySize:I
    and-int/lit8 v12, v3, 0x10

    if-eqz v12, :cond_5

    .line 280
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v5, v12, 0xff

    move v7, v6

    .line 281
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_5
    and-int/lit8 v12, v3, 0x20

    if-eqz v12, :cond_6

    .line 282
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x8

    or-int/2addr v5, v12

    move v7, v6

    .line 283
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_6
    and-int/lit8 v12, v3, 0x40

    if-eqz v12, :cond_b

    .line 284
    add-int/lit8 v6, v7, 0x1

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    aget-byte v12, p0, v7

    and-int/lit16 v12, v12, 0xff

    shl-int/lit8 v12, v12, 0x10

    or-int/2addr v5, v12

    .line 285
    :goto_3
    if-nez v5, :cond_7

    .line 286
    const/high16 v5, 0x1

    .line 288
    :cond_7
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "  COPY  ("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")\n"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_2

    .line 290
    .end local v4           #copyOffset:I
    .end local v5           #copySize:I
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_8
    if-eqz v3, :cond_9

    .line 294
    const-string v12, "  INSERT("

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    sget-object v12, Lorg/eclipse/jgit/util/QuotedString;->GIT_PATH:Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;

    add-int v13, v7, v3

    invoke-static {p0, v7, v13}, Lorg/eclipse/jgit/util/RawParseUtils;->decode([BII)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lorg/eclipse/jgit/util/QuotedString$GitPathStyle;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    const-string v12, ")\n"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    add-int v6, v7, v3

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    goto/16 :goto_2

    .line 303
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_9
    new-instance v12, Ljava/lang/IllegalArgumentException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->unsupportedCommand0:Ljava/lang/String;

    invoke-direct {v12, v13}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 308
    .end local v3           #cmd:I
    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    :cond_a
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    return-object v12

    .end local v6           #deltaPtr:I
    .restart local v3       #cmd:I
    .restart local v4       #copyOffset:I
    .restart local v5       #copySize:I
    .restart local v7       #deltaPtr:I
    :cond_b
    move v6, v7

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    goto :goto_3

    .end local v3           #cmd:I
    .end local v4           #copyOffset:I
    .end local v5           #copySize:I
    .end local v6           #deltaPtr:I
    .restart local v7       #deltaPtr:I
    :cond_c
    move v6, v7

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    goto/16 :goto_1

    .end local v6           #deltaPtr:I
    .end local v9           #resLen:J
    .restart local v7       #deltaPtr:I
    :cond_d
    move v6, v7

    .end local v7           #deltaPtr:I
    .restart local v6       #deltaPtr:I
    goto/16 :goto_0
.end method

.method public static getBaseSize([B)J
    .locals 8
    .parameter "delta"

    .prologue
    .line 68
    const/4 v3, 0x0

    .line 69
    .local v3, p:I
    const-wide/16 v0, 0x0

    .line 70
    .local v0, baseLen:J
    const/4 v5, 0x0

    .line 72
    .local v5, shift:I
    :goto_0
    add-int/lit8 v4, v3, 0x1

    .end local v3           #p:I
    .local v4, p:I
    aget-byte v6, p0, v3

    and-int/lit16 v2, v6, 0xff

    .line 73
    .local v2, c:I
    and-int/lit8 v6, v2, 0x7f

    int-to-long v6, v6

    shl-long/2addr v6, v5

    or-long/2addr v0, v6

    .line 74
    add-int/lit8 v5, v5, 0x7

    .line 75
    and-int/lit16 v6, v2, 0x80

    if-nez v6, :cond_0

    .line 76
    return-wide v0

    :cond_0
    move v3, v4

    .end local v4           #p:I
    .restart local v3       #p:I
    goto :goto_0
.end method

.method public static getResultSize([B)J
    .locals 8
    .parameter "delta"

    .prologue
    .line 87
    const/4 v1, 0x0

    .line 93
    .local v1, p:I
    :goto_0
    add-int/lit8 v2, v1, 0x1

    .end local v1           #p:I
    .local v2, p:I
    aget-byte v6, p0, v1

    and-int/lit16 v0, v6, 0xff

    .line 94
    .local v0, c:I
    and-int/lit16 v6, v0, 0x80

    if-nez v6, :cond_1

    .line 96
    const-wide/16 v3, 0x0

    .line 97
    .local v3, resLen:J
    const/4 v5, 0x0

    .local v5, shift:I
    move v1, v2

    .line 99
    .end local v2           #p:I
    .restart local v1       #p:I
    :goto_1
    add-int/lit8 v2, v1, 0x1

    .end local v1           #p:I
    .restart local v2       #p:I
    aget-byte v6, p0, v1

    and-int/lit16 v0, v6, 0xff

    .line 100
    and-int/lit8 v6, v0, 0x7f

    int-to-long v6, v6

    shl-long/2addr v6, v5

    or-long/2addr v3, v6

    .line 101
    add-int/lit8 v5, v5, 0x7

    .line 102
    and-int/lit16 v6, v0, 0x80

    if-nez v6, :cond_0

    .line 103
    return-wide v3

    :cond_0
    move v1, v2

    .end local v2           #p:I
    .restart local v1       #p:I
    goto :goto_1

    .end local v1           #p:I
    .end local v3           #resLen:J
    .end local v5           #shift:I
    .restart local v2       #p:I
    :cond_1
    move v1, v2

    .end local v2           #p:I
    .restart local v1       #p:I
    goto :goto_0
.end method
