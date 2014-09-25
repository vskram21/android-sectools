.class public Lorg/eclipse/jgit/api/ApplyCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "ApplyCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/api/ApplyCommand$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Lorg/eclipse/jgit/api/ApplyResult;",
        ">;"
    }
.end annotation


# instance fields
.field private in:Ljava/io/InputStream;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 0
    .parameter "repo"

    .prologue
    .line 84
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 85
    return-void
.end method

.method private apply(Ljava/io/File;Lorg/eclipse/jgit/patch/FileHeader;)V
    .locals 21
    .parameter "f"
    .parameter "fh"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/eclipse/jgit/api/errors/PatchApplyException;
        }
    .end annotation

    .prologue
    .line 193
    new-instance v15, Lorg/eclipse/jgit/diff/RawText;

    move-object/from16 v0, p1

    invoke-direct {v15, v0}, Lorg/eclipse/jgit/diff/RawText;-><init>(Ljava/io/File;)V

    .line 194
    .local v15, rt:Lorg/eclipse/jgit/diff/RawText;
    new-instance v13, Ljava/util/ArrayList;

    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-direct {v13, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 195
    .local v13, oldLines:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v8, 0x0

    .local v8, i:I
    :goto_0
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_0

    .line 196
    invoke-virtual {v15, v8}, Lorg/eclipse/jgit/diff/RawText;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 195
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 197
    :cond_0
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12, v13}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 198
    .local v12, newLines:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual/range {p2 .. p2}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    .local v9, i$:Ljava/util/Iterator;
    :cond_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_6

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/patch/HunkHeader;

    .line 199
    .local v3, hh:Lorg/eclipse/jgit/patch/HunkHeader;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 200
    .local v5, hunk:Ljava/lang/StringBuilder;
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getStartOffset()I

    move-result v10

    .local v10, j:I
    :goto_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getEndOffset()I

    move-result v17

    move/from16 v0, v17

    if-ge v10, v0, :cond_2

    .line 201
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getBuffer()[B

    move-result-object v17

    aget-byte v17, v17, v10

    move/from16 v0, v17

    int-to-char v0, v0

    move/from16 v17, v0

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 202
    :cond_2
    new-instance v4, Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->getBytes()[B

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    .line 203
    .local v4, hrt:Lorg/eclipse/jgit/diff/RawText;
    new-instance v7, Ljava/util/ArrayList;

    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v17

    move/from16 v0, v17

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 204
    .local v7, hunkLines:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v8, 0x0

    :goto_2
    invoke-virtual {v4}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v8, v0, :cond_3

    .line 205
    invoke-virtual {v4, v8}, Lorg/eclipse/jgit/diff/RawText;->getString(I)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 204
    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 206
    :cond_3
    const/4 v14, 0x0

    .line 207
    .local v14, pos:I
    const/4 v10, 0x1

    :goto_3
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v10, v0, :cond_1

    .line 208
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 209
    .local v6, hunkLine:Ljava/lang/String;
    const/16 v17, 0x0

    move/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/lang/String;->charAt(I)C

    move-result v17

    sparse-switch v17, :sswitch_data_0

    .line 207
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 211
    :sswitch_0
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewStartLine()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    add-int v17, v17, v14

    move/from16 v0, v17

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_4

    .line 213
    new-instance v17, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->patchApplyException:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v3, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 216
    :cond_4
    add-int/lit8 v14, v14, 0x1

    .line 217
    goto :goto_4

    .line 219
    :sswitch_1
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewStartLine()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    add-int v17, v17, v14

    move/from16 v0, v17

    invoke-interface {v12, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-nez v17, :cond_5

    .line 221
    new-instance v17, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v18

    move-object/from16 v0, v18

    iget-object v0, v0, Lorg/eclipse/jgit/internal/JGitText;->patchApplyException:Ljava/lang/String;

    move-object/from16 v18, v0

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    aput-object v3, v19, v20

    invoke-static/range {v18 .. v19}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 224
    :cond_5
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewStartLine()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    add-int v17, v17, v14

    move/from16 v0, v17

    invoke-interface {v12, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto/16 :goto_4

    .line 227
    :sswitch_2
    invoke-virtual {v3}, Lorg/eclipse/jgit/patch/HunkHeader;->getNewStartLine()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    add-int v17, v17, v14

    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-virtual {v6, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v18

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-interface {v12, v0, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 229
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_4

    .line 234
    .end local v3           #hh:Lorg/eclipse/jgit/patch/HunkHeader;
    .end local v4           #hrt:Lorg/eclipse/jgit/diff/RawText;
    .end local v5           #hunk:Ljava/lang/StringBuilder;
    .end local v6           #hunkLine:Ljava/lang/String;
    .end local v7           #hunkLines:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .end local v10           #j:I
    .end local v14           #pos:I
    :cond_6
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lorg/eclipse/jgit/api/ApplyCommand;->isNoNewlineAtEndOfFile(Lorg/eclipse/jgit/patch/FileHeader;)Z

    move-result v17

    if-nez v17, :cond_7

    .line 235
    const-string v17, ""

    move-object/from16 v0, v17

    invoke-interface {v12, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    :cond_7
    invoke-virtual {v15}, Lorg/eclipse/jgit/diff/RawText;->isMissingNewlineAtEnd()Z

    move-result v17

    if-nez v17, :cond_8

    .line 237
    const-string v17, ""

    move-object/from16 v0, v17

    invoke-interface {v13, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    :cond_8
    invoke-static {v13, v12}, Lorg/eclipse/jgit/api/ApplyCommand;->isChanged(Ljava/util/List;Ljava/util/List;)Z

    move-result v17

    if-nez v17, :cond_9

    .line 250
    :goto_5
    return-void

    .line 240
    :cond_9
    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .local v16, sb:Ljava/lang/StringBuilder;
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_6
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_a

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 244
    .local v11, l:Ljava/lang/String;
    move-object/from16 v0, v16

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const/16 v18, 0xa

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_6

    .line 246
    .end local v11           #l:Ljava/lang/String;
    :cond_a
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->length()I

    move-result v17

    add-int/lit8 v17, v17, -0x1

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->deleteCharAt(I)Ljava/lang/StringBuilder;

    .line 247
    new-instance v2, Ljava/io/FileWriter;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 248
    .local v2, fw:Ljava/io/FileWriter;
    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    .line 249
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V

    goto :goto_5

    .line 209
    nop

    :sswitch_data_0
    .sparse-switch
        0x20 -> :sswitch_0
        0x2b -> :sswitch_2
        0x2d -> :sswitch_1
    .end sparse-switch
.end method

.method private getFile(Ljava/lang/String;Z)Ljava/io/File;
    .locals 7
    .parameter "path"
    .parameter "create"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/PatchApplyException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x1

    .line 172
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ApplyCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/lib/Repository;->getWorkTree()Ljava/io/File;

    move-result-object v3

    invoke-direct {v1, v3, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 173
    .local v1, f:Ljava/io/File;
    if-eqz p2, :cond_0

    .line 175
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    .line 176
    .local v2, parent:Ljava/io/File;
    const/4 v3, 0x1

    invoke-static {v2, v3}, Lorg/eclipse/jgit/util/FileUtils;->mkdirs(Ljava/io/File;Z)V

    .line 177
    invoke-static {v1}, Lorg/eclipse/jgit/util/FileUtils;->createNewFile(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 182
    .end local v2           #parent:Ljava/io/File;
    :cond_0
    return-object v1

    .line 178
    :catch_0
    move-exception v0

    .line 179
    .local v0, e:Ljava/io/IOException;
    new-instance v3, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v4

    iget-object v4, v4, Lorg/eclipse/jgit/internal/JGitText;->createNewFileFailed:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v4, v5}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v0}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private static isChanged(Ljava/util/List;Ljava/util/List;)Z
    .locals 4
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p0, ol:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    .local p1, nl:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v2, 0x1

    .line 253
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-eq v1, v3, :cond_0

    move v1, v2

    .line 258
    :goto_0
    return v1

    .line 255
    :cond_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 256
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    move v1, v2

    .line 257
    goto :goto_0

    .line 255
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 258
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isNoNewlineAtEndOfFile(Lorg/eclipse/jgit/patch/FileHeader;)Z
    .locals 4
    .parameter "fh"

    .prologue
    .line 262
    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1}, Lorg/eclipse/jgit/patch/FileHeader;->getHunks()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/patch/HunkHeader;

    .line 263
    .local v0, lastHunk:Lorg/eclipse/jgit/patch/HunkHeader;
    new-instance v1, Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v0}, Lorg/eclipse/jgit/patch/HunkHeader;->getBuffer()[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    .line 264
    .local v1, lhrt:Lorg/eclipse/jgit/diff/RawText;
    invoke-virtual {v1}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/diff/RawText;->getString(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "\\ No newline at end of file"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    return v2
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 74
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ApplyCommand;->call()Lorg/eclipse/jgit/api/ApplyResult;

    move-result-object v0

    return-object v0
.end method

.method public call()Lorg/eclipse/jgit/api/ApplyResult;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/PatchFormatException;,
            Lorg/eclipse/jgit/api/errors/PatchApplyException;
        }
    .end annotation

    .prologue
    .line 112
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ApplyCommand;->checkCallable()V

    .line 113
    new-instance v8, Lorg/eclipse/jgit/api/ApplyResult;

    invoke-direct {v8}, Lorg/eclipse/jgit/api/ApplyResult;-><init>()V

    .line 115
    .local v8, r:Lorg/eclipse/jgit/api/ApplyResult;
    :try_start_0
    new-instance v7, Lorg/eclipse/jgit/patch/Patch;

    invoke-direct {v7}, Lorg/eclipse/jgit/patch/Patch;-><init>()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .local v7, p:Lorg/eclipse/jgit/patch/Patch;
    :try_start_1
    iget-object v10, p0, Lorg/eclipse/jgit/api/ApplyCommand;->in:Ljava/io/InputStream;

    invoke-virtual {v7, v10}, Lorg/eclipse/jgit/patch/Patch;->parse(Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 119
    :try_start_2
    iget-object v10, p0, Lorg/eclipse/jgit/api/ApplyCommand;->in:Ljava/io/InputStream;

    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    .line 121
    invoke-virtual {v7}, Lorg/eclipse/jgit/patch/Patch;->getErrors()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_0

    .line 122
    new-instance v10, Lorg/eclipse/jgit/api/errors/PatchFormatException;

    invoke-virtual {v7}, Lorg/eclipse/jgit/patch/Patch;->getErrors()Ljava/util/List;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/PatchFormatException;-><init>(Ljava/util/List;)V

    throw v10
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 162
    .end local v7           #p:Lorg/eclipse/jgit/patch/Patch;
    :catch_0
    move-exception v2

    .line 163
    .local v2, e:Ljava/io/IOException;
    new-instance v10, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->patchApplyException:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11, v2}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v10

    .line 119
    .end local v2           #e:Ljava/io/IOException;
    .restart local v7       #p:Lorg/eclipse/jgit/patch/Patch;
    :catchall_0
    move-exception v10

    :try_start_3
    iget-object v11, p0, Lorg/eclipse/jgit/api/ApplyCommand;->in:Ljava/io/InputStream;

    invoke-virtual {v11}, Ljava/io/InputStream;->close()V

    throw v10

    .line 123
    :cond_0
    invoke-virtual {v7}, Lorg/eclipse/jgit/patch/Patch;->getFiles()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/eclipse/jgit/patch/FileHeader;

    .line 124
    .local v4, fh:Lorg/eclipse/jgit/patch/FileHeader;
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getChangeType()Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;

    move-result-object v9

    .line 125
    .local v9, type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    const/4 v3, 0x0

    .line 126
    .local v3, f:Ljava/io/File;
    sget-object v10, Lorg/eclipse/jgit/api/ApplyCommand$1;->$SwitchMap$org$eclipse$jgit$diff$DiffEntry$ChangeType:[I

    invoke-virtual {v9}, Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 160
    :cond_1
    :goto_1
    invoke-virtual {v8, v3}, Lorg/eclipse/jgit/api/ApplyResult;->addUpdatedFile(Ljava/io/File;)Lorg/eclipse/jgit/api/ApplyResult;

    goto :goto_0

    .line 128
    :pswitch_0
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getNewPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    .line 129
    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/api/ApplyCommand;->apply(Ljava/io/File;Lorg/eclipse/jgit/patch/FileHeader;)V

    goto :goto_1

    .line 132
    :pswitch_1
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getOldPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    .line 133
    invoke-direct {p0, v3, v4}, Lorg/eclipse/jgit/api/ApplyCommand;->apply(Ljava/io/File;Lorg/eclipse/jgit/patch/FileHeader;)V

    goto :goto_1

    .line 136
    :pswitch_2
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getOldPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    .line 137
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v10

    if-nez v10, :cond_1

    .line 138
    new-instance v10, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->cannotDeleteFile:Ljava/lang/String;

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 142
    :pswitch_3
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getOldPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    .line 143
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getNewPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v1

    .line 144
    .local v1, dest:Ljava/io/File;
    invoke-virtual {v3, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 145
    new-instance v10, Lorg/eclipse/jgit/api/errors/PatchApplyException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v11

    iget-object v11, v11, Lorg/eclipse/jgit/internal/JGitText;->renameFileFailed:Ljava/lang/String;

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    aput-object v3, v12, v13

    const/4 v13, 0x1

    aput-object v1, v12, v13

    invoke-static {v11, v12}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v10, v11}, Lorg/eclipse/jgit/api/errors/PatchApplyException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 149
    .end local v1           #dest:Ljava/io/File;
    :pswitch_4
    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getOldPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x0

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v3

    .line 150
    invoke-static {v3}, Lorg/eclipse/jgit/util/IO;->readFully(Ljava/io/File;)[B

    move-result-object v0

    .line 151
    .local v0, bs:[B
    new-instance v5, Ljava/io/FileOutputStream;

    invoke-virtual {v4}, Lorg/eclipse/jgit/patch/FileHeader;->getNewPath()Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x1

    invoke-direct {p0, v10, v11}, Lorg/eclipse/jgit/api/ApplyCommand;->getFile(Ljava/lang/String;Z)Ljava/io/File;

    move-result-object v10

    invoke-direct {v5, v10}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 155
    .local v5, fos:Ljava/io/FileOutputStream;
    :try_start_4
    invoke-virtual {v5, v0}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 157
    :try_start_5
    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    goto/16 :goto_1

    :catchall_1
    move-exception v10

    invoke-virtual {v5}, Ljava/io/FileOutputStream;->close()V

    throw v10
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    .line 166
    .end local v0           #bs:[B
    .end local v3           #f:Ljava/io/File;
    .end local v4           #fh:Lorg/eclipse/jgit/patch/FileHeader;
    .end local v5           #fos:Ljava/io/FileOutputStream;
    .end local v9           #type:Lorg/eclipse/jgit/diff/DiffEntry$ChangeType;
    :cond_2
    const/4 v10, 0x0

    invoke-virtual {p0, v10}, Lorg/eclipse/jgit/api/ApplyCommand;->setCallable(Z)V

    .line 167
    return-object v8

    .line 126
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public setPatch(Ljava/io/InputStream;)Lorg/eclipse/jgit/api/ApplyCommand;
    .locals 0
    .parameter "in"

    .prologue
    .line 93
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/ApplyCommand;->checkCallable()V

    .line 94
    iput-object p1, p0, Lorg/eclipse/jgit/api/ApplyCommand;->in:Ljava/io/InputStream;

    .line 95
    return-object p0
.end method
