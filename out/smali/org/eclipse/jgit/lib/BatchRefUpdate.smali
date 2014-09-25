.class public Lorg/eclipse/jgit/lib/BatchRefUpdate;
.super Ljava/lang/Object;
.source "BatchRefUpdate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/BatchRefUpdate$1;
    }
.end annotation


# instance fields
.field private allowNonFastForwards:Z

.field private final commands:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation
.end field

.field private refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

.field private refLogIncludeResult:Z

.field private refLogMessage:Ljava/lang/String;

.field private final refdb:Lorg/eclipse/jgit/lib/RefDatabase;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/RefDatabase;)V
    .locals 1
    .parameter "refdb"

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refdb:Lorg/eclipse/jgit/lib/RefDatabase;

    .line 96
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    .line 97
    return-void
.end method

.method private static addRefToPrefixes(Ljava/util/Collection;Ljava/lang/String;)V
    .locals 3
    .parameter
    .parameter "name"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 347
    .local p0, prefixes:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {p1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getPrefixes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 348
    .local v1, prefix:Ljava/lang/String;
    invoke-interface {p0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 350
    .end local v1           #prefix:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method static getPrefixes(Ljava/lang/String;)Ljava/util/Collection;
    .locals 4
    .parameter "s"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const/16 v3, 0x2f

    .line 353
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 354
    .local v1, ret:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-virtual {p0, v3}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 355
    .local v0, p1:I
    :goto_0
    if-lez v0, :cond_0

    .line 356
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 357
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    goto :goto_0

    .line 359
    :cond_0
    return-object v1
.end method

.method private static getTakenPrefixes(Ljava/util/Collection;)Ljava/util/Collection;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 339
    .local p0, names:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 340
    .local v2, ref:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 341
    .local v1, name:Ljava/lang/String;
    invoke-static {v1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getPrefixes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 342
    .end local v1           #name:Ljava/lang/String;
    :cond_0
    return-object v2
.end method


# virtual methods
.method public addCommand(Ljava/util/Collection;)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;)",
            "Lorg/eclipse/jgit/lib/BatchRefUpdate;"
        }
    .end annotation

    .prologue
    .line 234
    .local p1, cmd:Ljava/util/Collection;,"Ljava/util/Collection<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 235
    return-object p0
.end method

.method public addCommand(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1
    .parameter "cmd"

    .prologue
    .line 211
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    return-object p0
.end method

.method public varargs addCommand([Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1
    .parameter "cmd"

    .prologue
    .line 223
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->addCommand(Ljava/util/Collection;)Lorg/eclipse/jgit/lib/BatchRefUpdate;

    move-result-object v0

    return-object v0
.end method

.method public disableRefLog()Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    .line 189
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIncludeResult:Z

    .line 190
    return-object p0
.end method

.method public execute(Lorg/eclipse/jgit/revwalk/RevWalk;Lorg/eclipse/jgit/lib/ProgressMonitor;)V
    .locals 18
    .parameter "walk"
    .parameter "monitor"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 256
    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v13

    iget-object v13, v13, Lorg/eclipse/jgit/internal/JGitText;->updatingReferences:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->size()I

    move-result v14

    move-object/from16 v0, p2

    invoke-interface {v0, v13, v14}, Lorg/eclipse/jgit/lib/ProgressMonitor;->beginTask(Ljava/lang/String;I)V

    .line 257
    new-instance v2, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-direct {v2, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 259
    .local v2, commands2:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    new-instance v6, Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    invoke-direct {v6, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 262
    .local v6, namesToCheck:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 264
    .local v1, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :try_start_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v13

    sget-object v14, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v13, v14, :cond_0

    .line 265
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->updateType(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 266
    sget-object v13, Lorg/eclipse/jgit/lib/BatchRefUpdate$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Type:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v14

    invoke-virtual {v14}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->ordinal()I

    move-result v14

    aget v13, v13, v14

    packed-switch v13, :pswitch_data_0

    goto :goto_0

    .line 268
    :pswitch_0
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v6, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 281
    :catch_0
    move-exception v3

    .line 282
    .local v3, err:Ljava/io/IOException;
    sget-object v13, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->lockError:Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v13, v14}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    goto :goto_0

    .line 273
    .end local v3           #err:Ljava/io/IOException;
    :pswitch_1
    :try_start_1
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 276
    :pswitch_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->newUpdate(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v9

    .line 277
    .local v9, rud:Lorg/eclipse/jgit/lib/RefUpdate;
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    .line 278
    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v13

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 288
    .end local v1           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    .end local v9           #rud:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_1
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_6

    .line 290
    new-instance v11, Ljava/util/HashSet;

    move-object/from16 v0, p0

    iget-object v13, v0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refdb:Lorg/eclipse/jgit/lib/RefDatabase;

    const-string v14, ""

    invoke-virtual {v13, v14}, Lorg/eclipse/jgit/lib/RefDatabase;->getRefs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v13

    invoke-direct {v11, v13}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 292
    .local v11, takenNames:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-static {v11}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getTakenPrefixes(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v12

    .line 295
    .local v12, takenPrefixes:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .end local v4           #i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 297
    .restart local v1       #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :try_start_2
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v13

    sget-object v14, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    if-ne v13, v14, :cond_2

    .line 298
    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->updateType(Lorg/eclipse/jgit/revwalk/RevWalk;)V

    .line 299
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->newUpdate(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v8

    .line 300
    .local v8, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    sget-object v13, Lorg/eclipse/jgit/lib/BatchRefUpdate$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Type:[I

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v14

    invoke-virtual {v14}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->ordinal()I

    move-result v14

    aget v13, v13, v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    packed-switch v13, :pswitch_data_1

    .line 330
    .end local v8           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_2
    :goto_2
    :pswitch_3
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 306
    .restart local v8       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_4
    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->newUpdate(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v10

    .line 307
    .local v10, ruu:Lorg/eclipse/jgit/lib/RefUpdate;
    move-object/from16 v0, p1

    invoke-virtual {v10, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v13

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    .line 326
    .end local v8           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v10           #ruu:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_1
    move-exception v3

    .line 327
    .restart local v3       #err:Ljava/io/IOException;
    :try_start_4
    sget-object v13, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v14

    iget-object v14, v14, Lorg/eclipse/jgit/internal/JGitText;->lockError:Ljava/lang/String;

    const/4 v15, 0x1

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v1, v13, v14}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 330
    const/4 v13, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v13}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    goto :goto_1

    .line 310
    .end local v3           #err:Ljava/io/IOException;
    .restart local v8       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_5
    :try_start_5
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->getPrefixes(Ljava/lang/String;)Ljava/util/Collection;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, i$:Ljava/util/Iterator;
    :cond_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 311
    .local v7, prefix:Ljava/lang/String;
    invoke-interface {v11, v7}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 312
    sget-object v13, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_2

    .line 330
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v7           #prefix:Ljava/lang/String;
    .end local v8           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :catchall_0
    move-exception v13

    const/4 v14, 0x1

    move-object/from16 v0, p2

    invoke-interface {v0, v14}, Lorg/eclipse/jgit/lib/ProgressMonitor;->update(I)V

    throw v13

    .line 316
    .restart local v5       #i$:Ljava/util/Iterator;
    .restart local v8       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :cond_4
    :try_start_6
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v12, v13}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_5

    .line 317
    sget-object v13, Lorg/eclipse/jgit/lib/RefUpdate$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/lib/RefUpdate$Result;

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V

    goto :goto_2

    .line 320
    :cond_5
    const/4 v13, 0x0

    invoke-virtual {v8, v13}, Lorg/eclipse/jgit/lib/RefUpdate;->setCheckConflicting(Z)V

    .line 321
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->addRefToPrefixes(Ljava/util/Collection;Ljava/lang/String;)V

    .line 322
    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v11, v13}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 323
    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v13

    invoke-virtual {v1, v13}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_2

    .line 334
    .end local v1           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    .end local v5           #i$:Ljava/util/Iterator;
    .end local v8           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    .end local v11           #takenNames:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    .end local v12           #takenPrefixes:Ljava/util/Collection;,"Ljava/util/Collection<Ljava/lang/String;>;"
    :cond_6
    invoke-interface/range {p2 .. p2}, Lorg/eclipse/jgit/lib/ProgressMonitor;->endTask()V

    .line 335
    return-void

    .line 266
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 300
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method

.method public getCommands()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation

    .prologue
    .line 200
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->commands:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    return-object v0
.end method

.method public getRefLogMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    return-object v0
.end method

.method public isAllowNonFastForwards()Z
    .locals 1

    .prologue
    .line 104
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->allowNonFastForwards:Z

    return v0
.end method

.method public isRefLogDisabled()Z
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isRefLogIncludingResult()Z
    .locals 1

    .prologue
    .line 154
    iget-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIncludeResult:Z

    return v0
.end method

.method protected newUpdate(Lorg/eclipse/jgit/transport/ReceiveCommand;)Lorg/eclipse/jgit/lib/RefUpdate;
    .locals 4
    .parameter "cmd"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 373
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refdb:Lorg/eclipse/jgit/lib/RefDatabase;

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/lib/RefDatabase;->newUpdate(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v0

    .line 374
    .local v0, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->isRefLogDisabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 375
    invoke-virtual {v0}, Lorg/eclipse/jgit/lib/RefUpdate;->disableRefLog()V

    .line 380
    :goto_0
    sget-object v1, Lorg/eclipse/jgit/lib/BatchRefUpdate$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Type:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v2

    invoke-virtual {v2}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 391
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->isAllowNonFastForwards()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 392
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 393
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 394
    :goto_1
    return-object v0

    .line 377
    :cond_0
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 378
    iget-object v1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    iget-boolean v2, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIncludeResult:Z

    invoke-virtual {v0, v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    goto :goto_0

    .line 382
    :pswitch_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 383
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 384
    :cond_1
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    goto :goto_1

    .line 380
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
    .end packed-switch
.end method

.method public setAllowNonFastForwards(Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 0
    .parameter "allow"

    .prologue
    .line 115
    iput-boolean p1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->allowNonFastForwards:Z

    .line 116
    return-object p0
.end method

.method public setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 0
    .parameter "pi"

    .prologue
    .line 138
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIdent:Lorg/eclipse/jgit/lib/PersonIdent;

    .line 139
    return-object p0
.end method

.method public setRefLogMessage(Ljava/lang/String;Z)Lorg/eclipse/jgit/lib/BatchRefUpdate;
    .locals 1
    .parameter "msg"
    .parameter "appendStatus"

    .prologue
    .line 170
    if-nez p1, :cond_0

    if-nez p2, :cond_0

    .line 171
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/BatchRefUpdate;->disableRefLog()Lorg/eclipse/jgit/lib/BatchRefUpdate;

    .line 179
    :goto_0
    return-object p0

    .line 172
    :cond_0
    if-nez p1, :cond_1

    if-eqz p2, :cond_1

    .line 173
    const-string v0, ""

    iput-object v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    .line 174
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIncludeResult:Z

    goto :goto_0

    .line 176
    :cond_1
    iput-object p1, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogMessage:Ljava/lang/String;

    .line 177
    iput-boolean p2, p0, Lorg/eclipse/jgit/lib/BatchRefUpdate;->refLogIncludeResult:Z

    goto :goto_0
.end method
