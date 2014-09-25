.class Lorg/eclipse/jgit/blame/Candidate;
.super Ljava/lang/Object;
.source "Candidate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/blame/Candidate$BlobCandidate;,
        Lorg/eclipse/jgit/blame/Candidate$ReverseCandidate;
    }
.end annotation


# instance fields
.field queueNext:Lorg/eclipse/jgit/blame/Candidate;

.field regionList:Lorg/eclipse/jgit/blame/Region;

.field renameScore:I

.field sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

.field sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

.field sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

.field sourceText:Lorg/eclipse/jgit/diff/RawText;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V
    .locals 0
    .parameter "commit"
    .parameter "path"

    .prologue
    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 114
    iput-object p2, p0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    .line 115
    return-void
.end method

.method private static add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;
    .locals 3
    .parameter "aTail"
    .parameter "a"
    .parameter "n"

    .prologue
    const/4 v2, 0x0

    .line 262
    if-nez p0, :cond_0

    .line 263
    iput-object p2, p1, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 264
    iput-object v2, p2, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 283
    .end local p2
    :goto_0
    return-object p2

    .line 274
    .restart local p2
    :cond_0
    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v1, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v0, v1

    iget v1, p2, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    if-ne v0, v1, :cond_1

    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    iget v1, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v0, v1

    iget v1, p2, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    if-ne v0, v1, :cond_1

    .line 276
    iget v0, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    iget v1, p2, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int/2addr v0, v1

    iput v0, p0, Lorg/eclipse/jgit/blame/Region;->length:I

    move-object p2, p0

    .line 277
    goto :goto_0

    .line 281
    :cond_1
    iput-object p2, p0, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 282
    iput-object v2, p2, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    goto :goto_0
.end method

.method private static blame(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)V
    .locals 12
    .parameter "editList"
    .parameter "a"
    .parameter "b"

    .prologue
    .line 176
    invoke-direct {p2}, Lorg/eclipse/jgit/blame/Candidate;->clearRegionList()Lorg/eclipse/jgit/blame/Region;

    move-result-object v8

    .line 177
    .local v8, r:Lorg/eclipse/jgit/blame/Region;
    const/4 v0, 0x0

    .line 178
    .local v0, aTail:Lorg/eclipse/jgit/blame/Region;
    const/4 v1, 0x0

    .line 180
    .local v1, bTail:Lorg/eclipse/jgit/blame/Region;
    const/4 v4, 0x0

    .local v4, eIdx:I
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v10

    if-ge v4, v10, :cond_8

    .line 184
    if-nez v8, :cond_2

    .line 258
    :cond_1
    :goto_1
    return-void

    .line 187
    :cond_2
    invoke-virtual {p0, v4}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/diff/Edit;

    .line 190
    .local v3, e:Lorg/eclipse/jgit/diff/Edit;
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v10

    iget v11, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    if-gt v10, v11, :cond_3

    .line 191
    add-int/lit8 v4, v4, 0x1

    .line 192
    goto :goto_0

    .line 197
    :cond_3
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v11

    if-ge v10, v11, :cond_5

    .line 198
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getBeginB()I

    move-result v10

    iget v11, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    sub-int v2, v10, v11

    .line 199
    .local v2, d:I
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->length:I

    if-gt v10, v2, :cond_4

    .line 201
    iget-object v7, v8, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 202
    .local v7, next:Lorg/eclipse/jgit/blame/Region;
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v10

    sub-int/2addr v10, v2

    iput v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    .line 203
    invoke-static {v0, p1, v8}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v0

    .line 204
    move-object v8, v7

    .line 205
    goto :goto_0

    .line 209
    .end local v7           #next:Lorg/eclipse/jgit/blame/Region;
    :cond_4
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getBeginA()I

    move-result v10

    sub-int/2addr v10, v2

    invoke-virtual {v8, v10, v2}, Lorg/eclipse/jgit/blame/Region;->splitFirst(II)Lorg/eclipse/jgit/blame/Region;

    move-result-object v10

    invoke-static {v0, p1, v10}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v0

    .line 210
    invoke-virtual {v8, v2}, Lorg/eclipse/jgit/blame/Region;->slideAndShrink(I)V

    .line 217
    .end local v2           #d:I
    :cond_5
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getLengthB()I

    move-result v10

    if-nez v10, :cond_6

    .line 218
    add-int/lit8 v4, v4, 0x1

    .line 219
    goto :goto_0

    .line 223
    :cond_6
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    iget v11, v8, Lorg/eclipse/jgit/blame/Region;->length:I

    add-int v9, v10, v11

    .line 224
    .local v9, rEnd:I
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v10

    if-gt v9, v10, :cond_7

    .line 225
    iget-object v7, v8, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 226
    .restart local v7       #next:Lorg/eclipse/jgit/blame/Region;
    invoke-static {v1, p2, v8}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v1

    .line 227
    move-object v8, v7

    .line 228
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v10

    if-ne v9, v10, :cond_0

    .line 229
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 235
    .end local v7           #next:Lorg/eclipse/jgit/blame/Region;
    :cond_7
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v10

    iget v11, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    sub-int v6, v10, v11

    .line 236
    .local v6, len:I
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    invoke-virtual {v8, v10, v6}, Lorg/eclipse/jgit/blame/Region;->splitFirst(II)Lorg/eclipse/jgit/blame/Region;

    move-result-object v10

    invoke-static {v1, p2, v10}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v1

    .line 237
    invoke-virtual {v8, v6}, Lorg/eclipse/jgit/blame/Region;->slideAndShrink(I)V

    .line 238
    add-int/lit8 v4, v4, 0x1

    .line 239
    goto/16 :goto_0

    .line 241
    .end local v3           #e:Lorg/eclipse/jgit/diff/Edit;
    .end local v6           #len:I
    .end local v9           #rEnd:I
    :cond_8
    if-eqz v8, :cond_1

    .line 246
    invoke-virtual {p0}, Lorg/eclipse/jgit/diff/EditList;->size()I

    move-result v10

    add-int/lit8 v10, v10, -0x1

    invoke-virtual {p0, v10}, Lorg/eclipse/jgit/diff/EditList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/diff/Edit;

    .line 247
    .restart local v3       #e:Lorg/eclipse/jgit/diff/Edit;
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndB()I

    move-result v5

    .line 248
    .local v5, endB:I
    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/Edit;->getEndA()I

    move-result v10

    sub-int v2, v5, v10

    .line 249
    .restart local v2       #d:I
    if-nez v0, :cond_b

    .line 250
    iput-object v8, p1, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 254
    :cond_9
    :goto_2
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    if-gt v5, v10, :cond_a

    .line 255
    iget v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    sub-int/2addr v10, v2

    iput v10, v8, Lorg/eclipse/jgit/blame/Region;->sourceStart:I

    .line 256
    :cond_a
    iget-object v8, v8, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 257
    if-nez v8, :cond_9

    goto/16 :goto_1

    .line 252
    :cond_b
    iput-object v8, v0, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    goto :goto_2
.end method

.method private clearRegionList()Lorg/eclipse/jgit/blame/Region;
    .locals 2

    .prologue
    .line 287
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 288
    .local v0, r:Lorg/eclipse/jgit/blame/Region;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 289
    return-object v0
.end method


# virtual methods
.method add(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 1
    .parameter "flag"

    .prologue
    .line 138
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 139
    return-void
.end method

.method beginResult(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 1
    .parameter "rw"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseBody(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 119
    return-void
.end method

.method canMergeRegions(Lorg/eclipse/jgit/blame/Candidate;)Z
    .locals 2
    .parameter "other"

    .prologue
    .line 293
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    iget-object v1, p1, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v0}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method copy(Lorg/eclipse/jgit/revwalk/RevCommit;)Lorg/eclipse/jgit/blame/Candidate;
    .locals 2
    .parameter "commit"

    .prologue
    .line 158
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {p0, p1, v1}, Lorg/eclipse/jgit/blame/Candidate;->create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;

    move-result-object v0

    .line 159
    .local v0, r:Lorg/eclipse/jgit/blame/Candidate;
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    .line 160
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    .line 161
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    iput-object v1, v0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    .line 162
    iget v1, p0, Lorg/eclipse/jgit/blame/Candidate;->renameScore:I

    iput v1, v0, Lorg/eclipse/jgit/blame/Candidate;->renameScore:I

    .line 163
    return-object v0
.end method

.method create(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)Lorg/eclipse/jgit/blame/Candidate;
    .locals 1
    .parameter "commit"
    .parameter "path"

    .prologue
    .line 154
    new-instance v0, Lorg/eclipse/jgit/blame/Candidate;

    invoke-direct {v0, p1, p2}, Lorg/eclipse/jgit/blame/Candidate;-><init>(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/treewalk/filter/PathFilter;)V

    return-object v0
.end method

.method getAuthor()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getAuthorIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v0

    return-object v0
.end method

.method getNextCandidate(I)Lorg/eclipse/jgit/blame/Candidate;
    .locals 1
    .parameter "idx"

    .prologue
    .line 130
    const/4 v0, 0x0

    return-object v0
.end method

.method getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "idx"

    .prologue
    .line 126
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParent(I)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v0

    return-object v0
.end method

.method getParentCount()I
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getParentCount()I

    move-result v0

    return v0
.end method

.method getTime()I
    .locals 1

    .prologue
    .line 146
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevCommit;->getCommitTime()I

    move-result v0

    return v0
.end method

.method has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z
    .locals 1
    .parameter "flag"

    .prologue
    .line 134
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->has(Lorg/eclipse/jgit/revwalk/RevFlag;)Z

    move-result v0

    return v0
.end method

.method loadText(Lorg/eclipse/jgit/lib/ObjectReader;)V
    .locals 3
    .parameter "reader"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 167
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceBlob:Lorg/eclipse/jgit/lib/ObjectId;

    const/4 v2, 0x3

    invoke-virtual {p1, v1, v2}, Lorg/eclipse/jgit/lib/ObjectReader;->open(Lorg/eclipse/jgit/lib/AnyObjectId;I)Lorg/eclipse/jgit/lib/ObjectLoader;

    move-result-object v0

    .line 168
    .local v0, ldr:Lorg/eclipse/jgit/lib/ObjectLoader;
    new-instance v1, Lorg/eclipse/jgit/diff/RawText;

    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Lorg/eclipse/jgit/lib/ObjectLoader;->getCachedBytes(I)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/eclipse/jgit/diff/RawText;-><init>([B)V

    iput-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceText:Lorg/eclipse/jgit/diff/RawText;

    .line 169
    return-void
.end method

.method mergeRegions(Lorg/eclipse/jgit/blame/Candidate;)V
    .locals 6
    .parameter "other"

    .prologue
    .line 301
    invoke-direct {p0}, Lorg/eclipse/jgit/blame/Candidate;->clearRegionList()Lorg/eclipse/jgit/blame/Region;

    move-result-object v0

    .line 302
    .local v0, a:Lorg/eclipse/jgit/blame/Region;
    invoke-direct {p1}, Lorg/eclipse/jgit/blame/Candidate;->clearRegionList()Lorg/eclipse/jgit/blame/Region;

    move-result-object v1

    .line 303
    .local v1, b:Lorg/eclipse/jgit/blame/Region;
    const/4 v3, 0x0

    .line 305
    .local v3, t:Lorg/eclipse/jgit/blame/Region;
    :goto_0
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    .line 306
    iget v4, v0, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    iget v5, v1, Lorg/eclipse/jgit/blame/Region;->resultStart:I

    if-ge v4, v5, :cond_0

    .line 307
    iget-object v2, v0, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 308
    .local v2, n:Lorg/eclipse/jgit/blame/Region;
    invoke-static {v3, p0, v0}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v3

    .line 309
    move-object v0, v2

    .line 310
    goto :goto_0

    .line 311
    .end local v2           #n:Lorg/eclipse/jgit/blame/Region;
    :cond_0
    iget-object v2, v1, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 312
    .restart local v2       #n:Lorg/eclipse/jgit/blame/Region;
    invoke-static {v3, p0, v1}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v3

    .line 313
    move-object v1, v2

    .line 314
    goto :goto_0

    .line 317
    .end local v2           #n:Lorg/eclipse/jgit/blame/Region;
    :cond_1
    if-eqz v0, :cond_2

    .line 318
    iget-object v2, v0, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 319
    .restart local v2       #n:Lorg/eclipse/jgit/blame/Region;
    invoke-static {v3, p0, v0}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v3

    .line 320
    iput-object v2, v3, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 326
    :goto_1
    return-void

    .line 322
    .end local v2           #n:Lorg/eclipse/jgit/blame/Region;
    :cond_2
    iget-object v2, v1, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    .line 323
    .restart local v2       #n:Lorg/eclipse/jgit/blame/Region;
    invoke-static {v3, p0, v1}, Lorg/eclipse/jgit/blame/Candidate;->add(Lorg/eclipse/jgit/blame/Region;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Region;)Lorg/eclipse/jgit/blame/Region;

    move-result-object v3

    .line 324
    iput-object v2, v3, Lorg/eclipse/jgit/blame/Region;->next:Lorg/eclipse/jgit/blame/Region;

    goto :goto_1
.end method

.method remove(Lorg/eclipse/jgit/revwalk/RevFlag;)V
    .locals 1
    .parameter "flag"

    .prologue
    .line 142
    iget-object v0, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/revwalk/RevCommit;->remove(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 143
    return-void
.end method

.method takeBlame(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/blame/Candidate;)V
    .locals 0
    .parameter "editList"
    .parameter "child"

    .prologue
    .line 172
    invoke-static {p1, p0, p2}, Lorg/eclipse/jgit/blame/Candidate;->blame(Lorg/eclipse/jgit/diff/EditList;Lorg/eclipse/jgit/blame/Candidate;Lorg/eclipse/jgit/blame/Candidate;)V

    .line 173
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 332
    .local v0, r:Ljava/lang/StringBuilder;
    const-string v1, "Candidate["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourcePath:Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    invoke-virtual {v1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 334
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v1, :cond_0

    .line 335
    const-string v1, " @ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/blame/Candidate;->sourceCommit:Lorg/eclipse/jgit/revwalk/RevCommit;

    const/4 v3, 0x6

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevCommit;->abbreviate(I)Lorg/eclipse/jgit/lib/AbbreviatedObjectId;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/lib/AbbreviatedObjectId;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 336
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    if-eqz v1, :cond_1

    .line 337
    const-string v1, " regions:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/eclipse/jgit/blame/Candidate;->regionList:Lorg/eclipse/jgit/blame/Region;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 338
    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 339
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
