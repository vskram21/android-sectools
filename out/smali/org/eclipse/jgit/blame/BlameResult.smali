.class public Lorg/eclipse/jgit/blame/BlameResult;
.super Ljava/lang/Object;
.source "BlameResult.java"


# instance fields
.field private generator:Lorg/eclipse/jgit/blame/BlameGenerator;

.field private lastLength:I

.field private resultContents:Lorg/eclipse/jgit/diff/RawText;

.field private final resultPath:Ljava/lang/String;

.field private final sourceAuthors:[Lorg/eclipse/jgit/lib/PersonIdent;

.field private final sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

.field private final sourceCommitters:[Lorg/eclipse/jgit/lib/PersonIdent;

.field private final sourceLines:[I

.field private final sourcePaths:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/blame/BlameGenerator;Ljava/lang/String;Lorg/eclipse/jgit/diff/RawText;)V
    .locals 2
    .parameter "bg"
    .parameter "path"
    .parameter "text"

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    iput-object p1, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 115
    iput-object p2, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultPath:Ljava/lang/String;

    .line 116
    iput-object p3, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultContents:Lorg/eclipse/jgit/diff/RawText;

    .line 118
    invoke-virtual {p3}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v0

    .line 119
    .local v0, cnt:I
    new-array v1, v0, [Lorg/eclipse/jgit/revwalk/RevCommit;

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    .line 120
    new-array v1, v0, [Lorg/eclipse/jgit/lib/PersonIdent;

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceAuthors:[Lorg/eclipse/jgit/lib/PersonIdent;

    .line 121
    new-array v1, v0, [Lorg/eclipse/jgit/lib/PersonIdent;

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommitters:[Lorg/eclipse/jgit/lib/PersonIdent;

    .line 122
    new-array v1, v0, [I

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    .line 123
    new-array v1, v0, [Ljava/lang/String;

    iput-object v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourcePaths:[Ljava/lang/String;

    .line 124
    return-void
.end method

.method public static create(Lorg/eclipse/jgit/blame/BlameGenerator;)Lorg/eclipse/jgit/blame/BlameResult;
    .locals 3
    .parameter "gen"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultPath()Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, path:Ljava/lang/String;
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultContents()Lorg/eclipse/jgit/diff/RawText;

    move-result-object v0

    .line 87
    .local v0, contents:Lorg/eclipse/jgit/diff/RawText;
    if-nez v0, :cond_0

    .line 88
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 89
    const/4 v2, 0x0

    .line 91
    :goto_0
    return-object v2

    :cond_0
    new-instance v2, Lorg/eclipse/jgit/blame/BlameResult;

    invoke-direct {v2, p0, v1, v0}, Lorg/eclipse/jgit/blame/BlameResult;-><init>(Lorg/eclipse/jgit/blame/BlameGenerator;Ljava/lang/String;Lorg/eclipse/jgit/diff/RawText;)V

    goto :goto_0
.end method

.method private loadFrom(Lorg/eclipse/jgit/blame/BlameGenerator;)V
    .locals 8
    .parameter "gen"

    .prologue
    .line 334
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourceCommit()Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v3

    .line 335
    .local v3, srcCommit:Lorg/eclipse/jgit/revwalk/RevCommit;
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourceAuthor()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    .line 336
    .local v2, srcAuthor:Lorg/eclipse/jgit/lib/PersonIdent;
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourceCommitter()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v4

    .line 337
    .local v4, srcCommitter:Lorg/eclipse/jgit/lib/PersonIdent;
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourcePath()Ljava/lang/String;

    move-result-object v6

    .line 338
    .local v6, srcPath:Ljava/lang/String;
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getSourceStart()I

    move-result v5

    .line 339
    .local v5, srcLine:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultStart()I

    move-result v1

    .line 340
    .local v1, resLine:I
    invoke-virtual {p1}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultEnd()I

    move-result v0

    .line 342
    .local v0, resEnd:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 346
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    aget v7, v7, v1

    if-eqz v7, :cond_0

    .line 342
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 349
    :cond_0
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aput-object v3, v7, v1

    .line 350
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceAuthors:[Lorg/eclipse/jgit/lib/PersonIdent;

    aput-object v2, v7, v1

    .line 351
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommitters:[Lorg/eclipse/jgit/lib/PersonIdent;

    aput-object v4, v7, v1

    .line 352
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourcePaths:[Ljava/lang/String;

    aput-object v6, v7, v1

    .line 357
    iget-object v7, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    add-int/lit8 v5, v5, 0x1

    aput v5, v7, v1

    goto :goto_1

    .line 359
    :cond_1
    return-void
.end method


# virtual methods
.method public computeAll()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 234
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 235
    .local v0, gen:Lorg/eclipse/jgit/blame/BlameGenerator;
    if-nez v0, :cond_0

    .line 245
    :goto_0
    return-void

    .line 239
    :cond_0
    :goto_1
    :try_start_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->next()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 240
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameResult;->loadFrom(Lorg/eclipse/jgit/blame/BlameGenerator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 242
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 243
    iput-object v2, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    throw v1

    .line 242
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 243
    iput-object v2, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    goto :goto_0
.end method

.method public computeNext()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v1, -0x1

    .line 259
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 260
    .local v0, gen:Lorg/eclipse/jgit/blame/BlameGenerator;
    if-nez v0, :cond_0

    .line 270
    :goto_0
    return v1

    .line 263
    :cond_0
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->next()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 264
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameResult;->loadFrom(Lorg/eclipse/jgit/blame/BlameGenerator;)V

    .line 265
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getRegionLength()I

    move-result v1

    iput v1, p0, Lorg/eclipse/jgit/blame/BlameResult;->lastLength:I

    .line 266
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultStart()I

    move-result v1

    goto :goto_0

    .line 268
    :cond_1
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 269
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    goto :goto_0
.end method

.method public computeRange(II)V
    .locals 4
    .parameter "start"
    .parameter "end"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    .line 291
    .local v0, gen:Lorg/eclipse/jgit/blame/BlameGenerator;
    if-nez v0, :cond_1

    .line 323
    :cond_0
    :goto_0
    return-void

    .line 293
    :cond_1
    if-nez p1, :cond_4

    iget-object v3, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultContents:Lorg/eclipse/jgit/diff/RawText;

    invoke-virtual {v3}, Lorg/eclipse/jgit/diff/RawText;->size()I

    move-result v3

    if-ne p2, v3, :cond_4

    .line 294
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameResult;->computeAll()V

    goto :goto_0

    .line 308
    :cond_2
    invoke-direct {p0, v0}, Lorg/eclipse/jgit/blame/BlameResult;->loadFrom(Lorg/eclipse/jgit/blame/BlameGenerator;)V

    .line 314
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultStart()I

    move-result v2

    .line 315
    .local v2, resLine:I
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->getResultEnd()I

    move-result v1

    .line 317
    .local v1, resEnd:I
    if-gt v2, p1, :cond_3

    if-ge p1, v1, :cond_3

    .line 318
    move p1, v1

    .line 320
    :cond_3
    if-gt v2, p2, :cond_4

    if-ge p2, v1, :cond_4

    .line 321
    move p2, v2

    .line 298
    .end local v1           #resEnd:I
    .end local v2           #resLine:I
    :cond_4
    if-ge p1, p2, :cond_0

    .line 299
    invoke-virtual {p0, p1, p2}, Lorg/eclipse/jgit/blame/BlameResult;->hasSourceData(II)Z

    move-result v3

    if-nez v3, :cond_0

    .line 302
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->next()Z

    move-result v3

    if-nez v3, :cond_2

    .line 303
    invoke-virtual {v0}, Lorg/eclipse/jgit/blame/BlameGenerator;->release()V

    .line 304
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/eclipse/jgit/blame/BlameResult;->generator:Lorg/eclipse/jgit/blame/BlameGenerator;

    goto :goto_0
.end method

.method public discardResultContents()V
    .locals 1

    .prologue
    .line 138
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultContents:Lorg/eclipse/jgit/diff/RawText;

    .line 139
    return-void
.end method

.method public getResultContents()Lorg/eclipse/jgit/diff/RawText;
    .locals 1

    .prologue
    .line 133
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultContents:Lorg/eclipse/jgit/diff/RawText;

    return-object v0
.end method

.method public getResultPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->resultPath:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceAuthor(I)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1
    .parameter "idx"

    .prologue
    .line 191
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceAuthors:[Lorg/eclipse/jgit/lib/PersonIdent;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getSourceCommit(I)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "idx"

    .prologue
    .line 180
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommits:[Lorg/eclipse/jgit/revwalk/RevCommit;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getSourceCommitter(I)Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1
    .parameter "idx"

    .prologue
    .line 202
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceCommitters:[Lorg/eclipse/jgit/lib/PersonIdent;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public getSourceLine(I)I
    .locals 1
    .parameter "idx"

    .prologue
    .line 224
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    aget v0, v0, p1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getSourcePath(I)Ljava/lang/String;
    .locals 1
    .parameter "idx"

    .prologue
    .line 213
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourcePaths:[Ljava/lang/String;

    aget-object v0, v0, p1

    return-object v0
.end method

.method public hasSourceData(I)Z
    .locals 1
    .parameter "idx"

    .prologue
    .line 149
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    aget v0, v0, p1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasSourceData(II)Z
    .locals 1
    .parameter "start"
    .parameter "end"

    .prologue
    .line 162
    :goto_0
    if-ge p1, p2, :cond_1

    .line 163
    iget-object v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->sourceLines:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    .line 164
    const/4 v0, 0x0

    .line 165
    :goto_1
    return v0

    .line 162
    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 165
    :cond_1
    const/4 v0, 0x1

    goto :goto_1
.end method

.method public lastLength()I
    .locals 1

    .prologue
    .line 276
    iget v0, p0, Lorg/eclipse/jgit/blame/BlameResult;->lastLength:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 327
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 328
    .local v0, r:Ljava/lang/StringBuilder;
    const-string v1, "BlameResult: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 329
    invoke-virtual {p0}, Lorg/eclipse/jgit/blame/BlameResult;->getResultPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
