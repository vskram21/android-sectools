.class public Lorg/eclipse/jgit/lib/SymbolicRef;
.super Ljava/lang/Object;
.source "SymbolicRef.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Ref;


# instance fields
.field private final name:Ljava/lang/String;

.field private final target:Lorg/eclipse/jgit/lib/Ref;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lorg/eclipse/jgit/lib/Ref;)V
    .locals 0
    .parameter "refName"
    .parameter "target"

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lorg/eclipse/jgit/lib/SymbolicRef;->name:Ljava/lang/String;

    .line 67
    iput-object p2, p0, Lorg/eclipse/jgit/lib/SymbolicRef;->target:Lorg/eclipse/jgit/lib/Ref;

    .line 68
    return-void
.end method


# virtual methods
.method public getLeaf()Lorg/eclipse/jgit/lib/Ref;
    .locals 2

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/SymbolicRef;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    .line 80
    .local v0, dst:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 81
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    goto :goto_0

    .line 82
    :cond_0
    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/eclipse/jgit/lib/SymbolicRef;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 90
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/SymbolicRef;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/SymbolicRef;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    return-object v0
.end method

.method public getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 1

    .prologue
    .line 94
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    return-object v0
.end method

.method public getTarget()Lorg/eclipse/jgit/lib/Ref;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lorg/eclipse/jgit/lib/SymbolicRef;->target:Lorg/eclipse/jgit/lib/Ref;

    return-object v0
.end method

.method public isPeeled()Z
    .locals 1

    .prologue
    .line 102
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/SymbolicRef;->getLeaf()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isPeeled()Z

    move-result v0

    return v0
.end method

.method public isSymbolic()Z
    .locals 1

    .prologue
    .line 75
    const/4 v0, 0x1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 108
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 109
    .local v1, r:Ljava/lang/StringBuilder;
    const-string v2, "SymbolicRef["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    move-object v0, p0

    .line 111
    .local v0, cur:Lorg/eclipse/jgit/lib/Ref;
    :goto_0
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->isSymbolic()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 112
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getTarget()Lorg/eclipse/jgit/lib/Ref;

    move-result-object v0

    goto :goto_0

    .line 116
    :cond_0
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    const/16 v2, 0x3d

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 118
    invoke-interface {v0}, Lorg/eclipse/jgit/lib/Ref;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v2

    invoke-static {v2}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
