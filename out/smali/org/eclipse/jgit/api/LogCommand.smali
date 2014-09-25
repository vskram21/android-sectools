.class public Lorg/eclipse/jgit/api/LogCommand;
.super Lorg/eclipse/jgit/api/GitCommand;
.source "LogCommand.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/eclipse/jgit/api/GitCommand",
        "<",
        "Ljava/lang/Iterable",
        "<",
        "Lorg/eclipse/jgit/revwalk/RevCommit;",
        ">;>;"
    }
.end annotation


# instance fields
.field private maxCount:I

.field private final pathFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/treewalk/filter/PathFilter;",
            ">;"
        }
    .end annotation
.end field

.field private skip:I

.field private startSpecified:Z

.field private walk:Lorg/eclipse/jgit/revwalk/RevWalk;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Repository;)V
    .locals 2
    .parameter "repo"

    .prologue
    const/4 v1, -0x1

    .line 117
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/api/GitCommand;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 105
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/api/LogCommand;->startSpecified:Z

    .line 107
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/api/LogCommand;->pathFilters:Ljava/util/List;

    .line 109
    iput v1, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    .line 111
    iput v1, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    .line 118
    new-instance v0, Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/RevWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    iput-object v0, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    .line 119
    return-void
.end method

.method private add(ZLorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;
    .locals 5
    .parameter "include"
    .parameter "start"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Lorg/eclipse/jgit/api/errors/JGitInternalException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x1

    .line 327
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->checkCallable()V

    .line 329
    if-eqz p1, :cond_0

    .line 330
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevCommit;)V

    .line 331
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/eclipse/jgit/api/LogCommand;->startSpecified:Z

    .line 334
    :goto_0
    return-object p0

    .line 333
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v2, p2}, Lorg/eclipse/jgit/revwalk/RevWalk;->lookupCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->markUninteresting(Lorg/eclipse/jgit/revwalk/RevCommit;)V
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 335
    :catch_0
    move-exception v0

    .line 336
    .local v0, e:Lorg/eclipse/jgit/errors/MissingObjectException;
    throw v0

    .line 337
    .end local v0           #e:Lorg/eclipse/jgit/errors/MissingObjectException;
    :catch_1
    move-exception v0

    .line 338
    .local v0, e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    throw v0

    .line 339
    .end local v0           #e:Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
    :catch_2
    move-exception v0

    .line 340
    .local v0, e:Ljava/io/IOException;
    new-instance v1, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v2

    iget-object v2, v2, Lorg/eclipse/jgit/internal/JGitText;->exceptionOccurredDuringAddingOfOptionToALogCommand:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method


# virtual methods
.method public add(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;
    .locals 1
    .parameter "start"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 189
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/api/LogCommand;->add(ZLorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v0

    return-object v0
.end method

.method public addPath(Ljava/lang/String;)Lorg/eclipse/jgit/api/LogCommand;
    .locals 2
    .parameter "path"

    .prologue
    .line 293
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->checkCallable()V

    .line 294
    iget-object v0, p0, Lorg/eclipse/jgit/api/LogCommand;->pathFilters:Ljava/util/List;

    invoke-static {p1}, Lorg/eclipse/jgit/treewalk/filter/PathFilter;->create(Ljava/lang/String;)Lorg/eclipse/jgit/treewalk/filter/PathFilter;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    return-object p0
.end method

.method public addRange(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;
    .locals 1
    .parameter "since"
    .parameter "until"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0, p1}, Lorg/eclipse/jgit/api/LogCommand;->not(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/api/LogCommand;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v0

    return-object v0
.end method

.method public all()Lorg/eclipse/jgit/api/LogCommand;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 258
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v5

    invoke-virtual {v5}, Lorg/eclipse/jgit/lib/Repository;->getRefDatabase()Lorg/eclipse/jgit/lib/RefDatabase;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 259
    .local v4, refs:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;>;"
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/eclipse/jgit/lib/Ref;

    .line 260
    .local v3, ref:Lorg/eclipse/jgit/lib/Ref;
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v5

    if-nez v5, :cond_1

    .line 261
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/eclipse/jgit/lib/Repository;->peel(Lorg/eclipse/jgit/lib/Ref;)Lorg/eclipse/jgit/lib/Ref;

    move-result-object v3

    .line 263
    :cond_1
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 264
    .local v2, objectId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v2, :cond_2

    .line 265
    invoke-interface {v3}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    .line 266
    :cond_2
    const/4 v0, 0x0

    .line 268
    .local v0, commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_start_0
    iget-object v5, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    invoke-virtual {v5, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    :try_end_0
    .catch Lorg/eclipse/jgit/errors/MissingObjectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/eclipse/jgit/errors/IncorrectObjectTypeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 277
    :goto_1
    if-eqz v0, :cond_0

    .line 278
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/api/LogCommand;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    goto :goto_0

    .line 280
    .end local v0           #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .end local v2           #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .end local v3           #ref:Lorg/eclipse/jgit/lib/Ref;
    :cond_3
    return-object p0

    .line 272
    .restart local v0       #commit:Lorg/eclipse/jgit/revwalk/RevCommit;
    .restart local v2       #objectId:Lorg/eclipse/jgit/lib/ObjectId;
    .restart local v3       #ref:Lorg/eclipse/jgit/lib/Ref;
    :catch_0
    move-exception v5

    goto :goto_1

    .line 269
    :catch_1
    move-exception v5

    goto :goto_1
.end method

.method public call()Ljava/lang/Iterable;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable",
            "<",
            "Lorg/eclipse/jgit/revwalk/RevCommit;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;,
            Lorg/eclipse/jgit/api/errors/NoHeadException;
        }
    .end annotation

    .prologue
    const/4 v5, -0x1

    .line 133
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->checkCallable()V

    .line 134
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->pathFilters:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 135
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget-object v3, p0, Lorg/eclipse/jgit/api/LogCommand;->pathFilters:Ljava/util/List;

    invoke-static {v3}, Lorg/eclipse/jgit/treewalk/filter/PathFilterGroup;->create(Ljava/util/Collection;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v3

    sget-object v4, Lorg/eclipse/jgit/treewalk/filter/TreeFilter;->ANY_DIFF:Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    invoke-static {v3, v4}, Lorg/eclipse/jgit/treewalk/filter/AndTreeFilter;->create(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)Lorg/eclipse/jgit/treewalk/filter/TreeFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setTreeFilter(Lorg/eclipse/jgit/treewalk/filter/TreeFilter;)V

    .line 137
    :cond_0
    iget v2, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    if-le v2, v5, :cond_2

    iget v2, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    if-le v2, v5, :cond_2

    .line 138
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v3, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    invoke-static {v3}, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->create(I)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v3

    iget v4, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    invoke-static {v4}, Lorg/eclipse/jgit/revwalk/filter/MaxCountRevFilter;->create(I)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/eclipse/jgit/revwalk/filter/AndRevFilter;->create(Lorg/eclipse/jgit/revwalk/filter/RevFilter;Lorg/eclipse/jgit/revwalk/filter/RevFilter;)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    .line 144
    :cond_1
    :goto_0
    iget-boolean v2, p0, Lorg/eclipse/jgit/api/LogCommand;->startSpecified:Z

    if-nez v2, :cond_5

    .line 146
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->repo:Lorg/eclipse/jgit/lib/Repository;

    const-string v3, "HEAD"

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->resolve(Ljava/lang/String;)Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    .line 147
    .local v1, headId:Lorg/eclipse/jgit/lib/ObjectId;
    if-nez v1, :cond_4

    .line 148
    new-instance v2, Lorg/eclipse/jgit/api/errors/NoHeadException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->noHEADExistsAndNoExplicitStartingRevisionWasSpecified:Ljava/lang/String;

    invoke-direct {v2, v3}, Lorg/eclipse/jgit/api/errors/NoHeadException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .end local v1           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :catch_0
    move-exception v0

    .line 154
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Lorg/eclipse/jgit/api/errors/JGitInternalException;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v3

    iget-object v3, v3, Lorg/eclipse/jgit/internal/JGitText;->anExceptionOccurredWhileTryingToAddTheIdOfHEAD:Ljava/lang/String;

    invoke-direct {v2, v3, v0}, Lorg/eclipse/jgit/api/errors/JGitInternalException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    .line 140
    .end local v0           #e:Ljava/io/IOException;
    :cond_2
    iget v2, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    if-le v2, v5, :cond_3

    .line 141
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v3, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    invoke-static {v3}, Lorg/eclipse/jgit/revwalk/filter/SkipRevFilter;->create(I)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    goto :goto_0

    .line 142
    :cond_3
    iget v2, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    if-le v2, v5, :cond_1

    .line 143
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    iget v3, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    invoke-static {v3}, Lorg/eclipse/jgit/revwalk/filter/MaxCountRevFilter;->create(I)Lorg/eclipse/jgit/revwalk/filter/RevFilter;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/revwalk/RevWalk;->setRevFilter(Lorg/eclipse/jgit/revwalk/filter/RevFilter;)V

    goto :goto_0

    .line 150
    .restart local v1       #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_4
    :try_start_1
    invoke-virtual {p0, v1}, Lorg/eclipse/jgit/api/LogCommand;->add(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 159
    .end local v1           #headId:Lorg/eclipse/jgit/lib/ObjectId;
    :cond_5
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/api/LogCommand;->setCallable(Z)V

    .line 160
    iget-object v2, p0, Lorg/eclipse/jgit/api/LogCommand;->walk:Lorg/eclipse/jgit/revwalk/RevWalk;

    return-object v2
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/api/errors/GitAPIException;
        }
    .end annotation

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->call()Ljava/lang/Iterable;

    move-result-object v0

    return-object v0
.end method

.method public not(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;
    .locals 1
    .parameter "start"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;
        }
    .end annotation

    .prologue
    .line 217
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/eclipse/jgit/api/LogCommand;->add(ZLorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/api/LogCommand;

    move-result-object v0

    return-object v0
.end method

.method public setMaxCount(I)Lorg/eclipse/jgit/api/LogCommand;
    .locals 0
    .parameter "maxCount"

    .prologue
    .line 319
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->checkCallable()V

    .line 320
    iput p1, p0, Lorg/eclipse/jgit/api/LogCommand;->maxCount:I

    .line 321
    return-object p0
.end method

.method public setSkip(I)Lorg/eclipse/jgit/api/LogCommand;
    .locals 0
    .parameter "skip"

    .prologue
    .line 306
    invoke-virtual {p0}, Lorg/eclipse/jgit/api/LogCommand;->checkCallable()V

    .line 307
    iput p1, p0, Lorg/eclipse/jgit/api/LogCommand;->skip:I

    .line 308
    return-object p0
.end method
