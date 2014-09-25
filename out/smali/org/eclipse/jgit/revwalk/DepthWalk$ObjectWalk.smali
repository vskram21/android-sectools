.class public Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;
.super Lorg/eclipse/jgit/revwalk/ObjectWalk;
.source "DepthWalk.java"

# interfaces
.implements Lorg/eclipse/jgit/revwalk/DepthWalk;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/revwalk/DepthWalk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectWalk"
.end annotation


# instance fields
.field private final REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

.field private final depth:I


# direct methods
.method public constructor <init>(Lorg/eclipse/jgit/lib/ObjectReader;I)V
    .locals 1
    .parameter "or"
    .parameter "depth"

    .prologue
    .line 179
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/ObjectReader;)V

    .line 181
    iput p2, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->depth:I

    .line 182
    const-string v0, "UNSHALLOW"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 183
    const-string v0, "REINTERESTING"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 184
    return-void
.end method

.method public constructor <init>(Lorg/eclipse/jgit/lib/Repository;I)V
    .locals 1
    .parameter "repo"
    .parameter "depth"

    .prologue
    .line 167
    invoke-direct {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;-><init>(Lorg/eclipse/jgit/lib/Repository;)V

    .line 169
    iput p2, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->depth:I

    .line 170
    const-string v0, "UNSHALLOW"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 171
    const-string v0, "REINTERESTING"

    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->newFlag(Ljava/lang/String;)Lorg/eclipse/jgit/revwalk/RevFlag;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    .line 172
    return-void
.end method


# virtual methods
.method protected createCommit(Lorg/eclipse/jgit/lib/AnyObjectId;)Lorg/eclipse/jgit/revwalk/RevCommit;
    .locals 1
    .parameter "id"

    .prologue
    .line 228
    new-instance v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    invoke-direct {v0, p1}, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;-><init>(Lorg/eclipse/jgit/lib/AnyObjectId;)V

    return-object v0
.end method

.method public getDepth()I
    .locals 1

    .prologue
    .line 232
    iget v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->depth:I

    return v0
.end method

.method public getReinterestingFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1

    .prologue
    .line 240
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->REINTERESTING:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-object v0
.end method

.method public getUnshallowFlag()Lorg/eclipse/jgit/revwalk/RevFlag;
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    return-object v0
.end method

.method public markRoot(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 2
    .parameter "o"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    move-object v0, p1

    .line 198
    .local v0, c:Lorg/eclipse/jgit/revwalk/RevObject;
    :goto_0
    instance-of v1, v0, Lorg/eclipse/jgit/revwalk/RevTag;

    if-eqz v1, :cond_0

    .line 199
    check-cast v0, Lorg/eclipse/jgit/revwalk/RevTag;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {v0}, Lorg/eclipse/jgit/revwalk/RevTag;->getObject()Lorg/eclipse/jgit/revwalk/RevObject;

    move-result-object v0

    .line 200
    .restart local v0       #c:Lorg/eclipse/jgit/revwalk/RevObject;
    invoke-virtual {p0, v0}, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->parseHeaders(Lorg/eclipse/jgit/revwalk/RevObject;)V

    goto :goto_0

    .line 202
    :cond_0
    instance-of v1, v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    if-eqz v1, :cond_1

    .line 203
    check-cast v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;

    .end local v0           #c:Lorg/eclipse/jgit/revwalk/RevObject;
    const/4 v1, 0x0

    iput v1, v0, Lorg/eclipse/jgit/revwalk/DepthWalk$Commit;->depth:I

    .line 204
    :cond_1
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 205
    return-void
.end method

.method public markUnshallow(Lorg/eclipse/jgit/revwalk/RevObject;)V
    .locals 1
    .parameter "c"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/errors/MissingObjectException;,
            Lorg/eclipse/jgit/errors/IncorrectObjectTypeException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 221
    instance-of v0, p1, Lorg/eclipse/jgit/revwalk/RevCommit;

    if-eqz v0, :cond_0

    .line 222
    iget-object v0, p0, Lorg/eclipse/jgit/revwalk/DepthWalk$ObjectWalk;->UNSHALLOW:Lorg/eclipse/jgit/revwalk/RevFlag;

    invoke-virtual {p1, v0}, Lorg/eclipse/jgit/revwalk/RevObject;->add(Lorg/eclipse/jgit/revwalk/RevFlag;)V

    .line 223
    :cond_0
    invoke-super {p0, p1}, Lorg/eclipse/jgit/revwalk/ObjectWalk;->markStart(Lorg/eclipse/jgit/revwalk/RevObject;)V

    .line 224
    return-void
.end method
