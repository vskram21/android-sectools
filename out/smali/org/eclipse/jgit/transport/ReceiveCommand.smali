.class public Lorg/eclipse/jgit/transport/ReceiveCommand;
.super Ljava/lang/Object;
.source "ReceiveCommand.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/transport/ReceiveCommand$1;,
        Lorg/eclipse/jgit/transport/ReceiveCommand$Result;,
        Lorg/eclipse/jgit/transport/ReceiveCommand$Type;
    }
.end annotation


# instance fields
.field private message:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final newId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final oldId:Lorg/eclipse/jgit/lib/ObjectId;

.field private ref:Lorg/eclipse/jgit/lib/Ref;

.field private status:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

.field private type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

.field private typeIsCorrect:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;)V
    .locals 1
    .parameter "oldId"
    .parameter "newId"
    .parameter "name"

    .prologue
    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->status:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    .line 180
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 181
    iput-object p2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 182
    iput-object p3, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->name:Ljava/lang/String;

    .line 184
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 185
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->CREATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 187
    :cond_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    invoke-virtual {v0, p2}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 188
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->DELETE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 189
    :cond_1
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;Ljava/lang/String;Lorg/eclipse/jgit/transport/ReceiveCommand$Type;)V
    .locals 1
    .parameter "oldId"
    .parameter "newId"
    .parameter "name"
    .parameter "type"

    .prologue
    .line 207
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->status:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    .line 208
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 209
    iput-object p2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 210
    iput-object p3, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->name:Ljava/lang/String;

    .line 211
    iput-object p4, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 212
    return-void
.end method

.method public static filter(Ljava/util/List;Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)Ljava/util/List;
    .locals 4
    .parameter
    .parameter "want"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;",
            "Lorg/eclipse/jgit/transport/ReceiveCommand$Result;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/eclipse/jgit/transport/ReceiveCommand;",
            ">;"
        }
    .end annotation

    .prologue
    .line 142
    .local p0, commands:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 143
    .local v2, r:Ljava/util/List;,"Ljava/util/List<Lorg/eclipse/jgit/transport/ReceiveCommand;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/eclipse/jgit/transport/ReceiveCommand;

    .line 144
    .local v0, cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    invoke-virtual {v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 145
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 147
    .end local v0           #cmd:Lorg/eclipse/jgit/transport/ReceiveCommand;
    :cond_1
    return-object v2
.end method


# virtual methods
.method public execute(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .locals 4
    .parameter "rp"

    .prologue
    .line 313
    :try_start_0
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRepository()Lorg/eclipse/jgit/lib/Repository;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/Repository;->updateRef(Ljava/lang/String;)Lorg/eclipse/jgit/lib/RefUpdate;

    move-result-object v1

    .line 314
    .local v1, ru:Lorg/eclipse/jgit/lib/RefUpdate;
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRefLogIdent()Lorg/eclipse/jgit/lib/PersonIdent;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogIdent(Lorg/eclipse/jgit/lib/PersonIdent;)V

    .line 315
    sget-object v2, Lorg/eclipse/jgit/transport/ReceiveCommand$1;->$SwitchMap$org$eclipse$jgit$transport$ReceiveCommand$Type:[I

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v3

    invoke-virtual {v3}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 341
    .end local v1           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :goto_0
    return-void

    .line 317
    .restart local v1       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_0
    invoke-static {}, Lorg/eclipse/jgit/lib/ObjectId;->zeroId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/eclipse/jgit/lib/ObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 322
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 324
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 325
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->delete(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 338
    .end local v1           #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :catch_0
    move-exception v0

    .line 339
    .local v0, err:Ljava/io/IOException;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->reject(Ljava/io/IOException;)V

    goto :goto_0

    .line 331
    .end local v0           #err:Ljava/io/IOException;
    .restart local v1       #ru:Lorg/eclipse/jgit/lib/RefUpdate;
    :pswitch_1
    :try_start_1
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->isAllowNonFastForwards()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setForceUpdate(Z)V

    .line 332
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setExpectedOldObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 333
    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->setNewObjectId(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    .line 334
    const-string v2, "push"

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jgit/lib/RefUpdate;->setRefLogMessage(Ljava/lang/String;Z)V

    .line 335
    invoke-virtual {p1}, Lorg/eclipse/jgit/transport/BaseReceivePack;->getRevWalk()Lorg/eclipse/jgit/revwalk/RevWalk;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/eclipse/jgit/lib/RefUpdate;->update(Lorg/eclipse/jgit/revwalk/RevWalk;)Lorg/eclipse/jgit/lib/RefUpdate$Result;

    move-result-object v2

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 315
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->message:Ljava/lang/String;

    return-object v0
.end method

.method public getNewId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 221
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getOldId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 216
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getRef()Lorg/eclipse/jgit/lib/Ref;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->ref:Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public getRefName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getResult()Lorg/eclipse/jgit/transport/ReceiveCommand$Result;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->status:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    return-object v0
.end method

.method public getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    return-object v0
.end method

.method reject(Ljava/io/IOException;)V
    .locals 5
    .parameter "err"

    .prologue
    .line 395
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-static {}, Lorg/eclipse/jgit/internal/JGitText;->get()Lorg/eclipse/jgit/internal/JGitText;

    move-result-object v1

    iget-object v1, v1, Lorg/eclipse/jgit/internal/JGitText;->lockError:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    .line 397
    return-void
.end method

.method setRef(Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter "r"

    .prologue
    .line 344
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->ref:Lorg/eclipse/jgit/lib/Ref;

    .line 345
    return-void
.end method

.method public setResult(Lorg/eclipse/jgit/lib/RefUpdate$Result;)V
    .locals 2
    .parameter "r"

    .prologue
    .line 363
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$1;->$SwitchMap$org$eclipse$jgit$lib$RefUpdate$Result:[I

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 389
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_OTHER_REASON:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/RefUpdate$Result;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    .line 392
    :goto_0
    return-void

    .line 365
    :pswitch_0
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->NOT_ATTEMPTED:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 370
    :pswitch_1
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->LOCK_FAILURE:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 377
    :pswitch_2
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->OK:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 381
    :pswitch_3
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 385
    :pswitch_4
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Result;->REJECTED_CURRENT_BRANCH:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V

    goto :goto_0

    .line 363
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;)V
    .locals 1
    .parameter "s"

    .prologue
    .line 256
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V

    .line 257
    return-void
.end method

.method public setResult(Lorg/eclipse/jgit/transport/ReceiveCommand$Result;Ljava/lang/String;)V
    .locals 0
    .parameter "s"
    .parameter "m"

    .prologue
    .line 268
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->status:Lorg/eclipse/jgit/transport/ReceiveCommand$Result;

    .line 269
    iput-object p2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->message:Ljava/lang/String;

    .line 270
    return-void
.end method

.method setType(Lorg/eclipse/jgit/transport/ReceiveCommand$Type;)V
    .locals 0
    .parameter "t"

    .prologue
    .line 348
    iput-object p1, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 349
    return-void
.end method

.method setTypeFastForwardUpdate()V
    .locals 1

    .prologue
    .line 352
    sget-object v0, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    iput-object v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    .line 353
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->typeIsCorrect:Z

    .line 354
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 402
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getType()Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getOldId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getNewId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-virtual {v1}, Lorg/eclipse/jgit/lib/ObjectId;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/eclipse/jgit/transport/ReceiveCommand;->getRefName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updateType(Lorg/eclipse/jgit/revwalk/RevWalk;)V
    .locals 4
    .parameter "walk"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 289
    iget-boolean v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->typeIsCorrect:Z

    if-eqz v2, :cond_0

    .line 300
    :goto_0
    return-void

    .line 291
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->type:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    sget-object v3, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    iget-object v3, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-static {v2, v3}, Lorg/eclipse/jgit/lib/AnyObjectId;->equals(Lorg/eclipse/jgit/lib/AnyObjectId;Lorg/eclipse/jgit/lib/AnyObjectId;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 292
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->oldId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v1

    .line 293
    .local v1, o:Lorg/eclipse/jgit/revwalk/RevObject;
    iget-object v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->newId:Lorg/eclipse/jgit/lib/ObjectId;

    invoke-virtual {p1, v2}, Lorg/eclipse/jgit/revwalk/RevWalk;->parseAny(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 294
    .local v0, n:Lorg/eclipse/jgit/revwalk/RevObject;
    instance-of v2, v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v2, :cond_1

    instance-of v2, v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v2, :cond_1

    check-cast v1, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v1           #o:Lorg/eclipse/jgit/revwalk/RevObject;
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevCommit;

    .end local v0           #n:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {p1, v1, v0}, Lorg/eclipse/jgit/revwalk/RevWalk;->isMergedInto(Lorg/eclipse/jgit/revwalk/RevCommit;Lorg/eclipse/jgit/revwalk/RevCommit;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 297
    :cond_1
    sget-object v2, Lorg/eclipse/jgit/transport/ReceiveCommand$Type;->UPDATE_NONFASTFORWARD:Lorg/eclipse/jgit/transport/ReceiveCommand$Type;

    invoke-virtual {p0, v2}, Lorg/eclipse/jgit/transport/ReceiveCommand;->setType(Lorg/eclipse/jgit/transport/ReceiveCommand$Type;)V

    .line 299
    :cond_2
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/eclipse/jgit/transport/ReceiveCommand;->typeIsCorrect:Z

    goto :goto_0
.end method
