.class final Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;
.super Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;
.source "RefDirectory.java"

# interfaces
.implements Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jgit/internal/storage/file/RefDirectory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LooseUnpeeled"
.end annotation


# instance fields
.field private snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V
    .locals 1
    .parameter "snapShot"
    .parameter "refName"
    .parameter "id"

    .prologue
    .line 1094
    sget-object v0, Lorg/eclipse/jgit/lib/Ref$Storage;->LOOSE:Lorg/eclipse/jgit/lib/Ref$Storage;

    invoke-direct {p0, v0, p2, p3}, Lorg/eclipse/jgit/lib/ObjectIdRef$Unpeeled;-><init>(Lorg/eclipse/jgit/lib/Ref$Storage;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1095
    iput-object p1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    .line 1096
    return-void
.end method


# virtual methods
.method public getSnapShot()Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;
    .locals 1

    .prologue
    .line 1099
    iget-object v0, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    return-object v0
.end method

.method public peel(Lorg/eclipse/jgit/lib/ObjectIdRef;)Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseRef;
    .locals 5
    .parameter "newLeaf"

    .prologue
    .line 1103
    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectIdRef;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1104
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LoosePeeledTag;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-virtual {p1}, Lorg/eclipse/jgit/lib/ObjectIdRef;->getPeeledObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v4

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LoosePeeledTag;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;Lorg/eclipse/jgit/lib/ObjectId;)V

    .line 1107
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;

    iget-object v1, p0, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->snapShot:Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseUnpeeled;->getObjectId()Lorg/eclipse/jgit/lib/ObjectId;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lorg/eclipse/jgit/internal/storage/file/RefDirectory$LooseNonTag;-><init>(Lorg/eclipse/jgit/internal/storage/file/FileSnapshot;Ljava/lang/String;Lorg/eclipse/jgit/lib/ObjectId;)V

    goto :goto_0
.end method
