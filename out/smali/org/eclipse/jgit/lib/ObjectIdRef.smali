.class public abstract Lorg/eclipse/jgit/lib/ObjectIdRef;
.super Ljava/lang/Object;
.source "ObjectIdRef.java"

# interfaces
.implements Lorg/eclipse/jgit/lib/Ref;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledNonTag;,
        Lorg/eclipse/jgit/lib/ObjectIdRef$PeeledTag;,
        Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;
    }
.end annotation


# instance fields
.field private final name:Ljava/lang/String;

.field private final objectId:Lorg/eclipse/jgit/lib/ObjectId;

.field private final storage:Lorg/eclipse/jgit/lib/Ref$Storage;


# direct methods
.method protected constructor <init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 0
    .parameter "st"
    .parameter "name"
    .parameter "id"

    .prologue
    .line 148
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 149
    iput-object p2, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->name:Ljava/lang/String;

    .line 150
    iput-object p1, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->storage:Lorg/eclipse/jgit/lib/Ref$Storage;

    .line 151
    iput-object p3, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    .line 152
    return-void
.end method


# virtual methods
.method public getLeaf()Lorg/eclipse/jgit/lib/Ref;
    .locals 0

    .prologue
    .line 163
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 155
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getObjectId()Lorg/eclipse/jgit/lib/ObjectId;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->objectId:Lorg/eclipse/jgit/lib/ObjectId;

    return-object v0
.end method

.method public getStorage()Lorg/eclipse/jgit/lib/Ref$Storage;
    .locals 1

    .prologue
    .line 175
    iget-object v0, p0, Lorg/eclipse/jgit/lib/ObjectIdRef;->storage:Lorg/eclipse/jgit/lib/Ref$Storage;

    return-object v0
.end method

.method public getTarget()Lorg/eclipse/jgit/lib/Ref;
    .locals 0

    .prologue
    .line 167
    return-object p0
.end method

.method public isSymbolic()Z
    .locals 1

    .prologue
    .line 159
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .local v0, r:Ljava/lang/StringBuilder;
    const-string v1, "Ref["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectIdRef;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 183
    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 184
    invoke-virtual {p0}, Lorg/eclipse/jgit/lib/ObjectIdRef;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v1

    invoke-static {v1}, Lorg/eclipse/jgit/lib/ObjectId;->toString(Lorg/eclipse/jgit/lib/ObjectId;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
